/*
#! SELinux Policy Editor, a simple editor for SELinux policies
#! Copyright (C) 2003 Hitachi Software Engineering Co., Ltd.
#! Copyright (C) 2005, 2006 Yuichi Nakamura
#! 
#! This program is free software; you can redistribute it and/or modify
#! it under the terms of the GNU General Public License as published by
#! the Free Software Foundation; either version 2 of the License, or
#! (at your option) any later version.
#! 
#! This program is distributed in the hope that it will be useful,
#! but WITHOUT ANY WARRANTY; without even the implied warranty of
#! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#! GNU General Public License for more details.
#! 
#! You should have received a copy of the GNU General Public License
#! along with this program; if not, write to the Free Software
#! Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
/* Modification for FC4 etc by Yuichi Nakamura*/
/* $Id: out_file_acl.c,v 1.8 2006/04/29 02:45:31 ynakam Exp $ */
/*(c) 2006 Yuichi Nakamura , modified to support implicit dir:search output*/

#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <dirent.h>
#include <selinux/selinux.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "global.h"
#include "hashtab.h"
#include "action.h"
#include <seedit/parse.h>
#include <seedit/common.h>
#include "out_macro.h"

/**
 *  this is used in "print_allow_consider_child".
 *  if the parentname is the same,
 *  distance between filename and parentname is the nearest will survive.
 */
typedef struct child_allow
{
	char	*filename;	/* target file name	*/
	char	*parentname;	/* parent file name	*/
	int	perm;		/* permittion		*/
} CHILD_ALLOW_BUF;

/**
 *  hash table the element if CHILD_ALLOW_BUF
 */
static HASH_TABLE *file_child_buf_table = NULL;
static HASH_TABLE *dir_child_buf_table = NULL;
#define CHILD_BUF_TABLE_SIZE 1024




/**
 *  @name:	distance	
 *  @about:	return the distance between filename and parent.
 *		filename must be the child of parent 
 *  @args:	filename (char *) -> target file name
 *  @args:	parent (char *) -> parent directory
 *  @return:	distance
 */
int
distance(char *filename, char *parent)
{
	int len;
	int l, k, i;
	l = k = 0;

	if (strcmp(filename, "/") == 0)
	{
		k++;
	}
	if (strcmp(parent, "/") == 0)
	{
		l++;
	}

	len = strlen(filename);
	for (i = 0; i < len; i++)
	{
		if (filename[i] == '/')
			l++;
	}

	len = strlen(parent);
	for (i = 0; i < len; i++)
	{
		if (filename[i] == '/')
			k++;
	}

	return l-k;
}

/**
 *  @name:	clear_child_buf_table	
 *  @about:	clear child buffer table 
 *  @args:	none
 *  @return:	none
 */
static void clear_child_buf_table(HASH_TABLE **child_buf_table_pointer){
	int i,num;
	HASH_NODE **array;
	CHILD_ALLOW_BUF *tmp;

	HASH_TABLE *child_buf_table;
	child_buf_table = *child_buf_table_pointer;
	num = child_buf_table->element_num;
	array = create_hash_array(child_buf_table);

	for (i = 0; i < num; i++)
	{
		tmp = (CHILD_ALLOW_BUF *)array[i]->data;
		free(tmp->filename);
		free(tmp->parentname);
		free(tmp);
	}

	delete_hash_table(child_buf_table);
	child_buf_table = NULL;
	*child_buf_table_pointer = NULL;
    free(array);
}

/**
 *  @name:	register_child_buf_table	
 *  @about:	set value with child_buf hash table. if key:filename already exists, 
 *		register the one whose the distance to parent directory is smaller.
 *  @args:	filename (char *) -> file name
 *  @args:	parentname (char *) -> parent file name
 *  @args:	allowed (int) -> permission
 *  @return: 	none
 */
static void register_child_buf_table(HASH_TABLE **child_buf_table_pointer, char *filename, char *parentname, int allowed){
  CHILD_ALLOW_BUF *tmp;
  CHILD_ALLOW_BUF *old;
  CHILD_ALLOW_BUF work;
  int s;
  int l1,l2;
  HASH_TABLE *child_buf_table = NULL;  

  if (*child_buf_table_pointer == NULL){
    child_buf_table = create_hash_table(CHILD_BUF_TABLE_SIZE);
    if (child_buf_table == NULL){
      perror("malloc");
      exit(1);
    }
    * child_buf_table_pointer = child_buf_table;
  }else{
    child_buf_table = *child_buf_table_pointer;
  }

  work.filename = strdup(filename);
  work.parentname = strdup(parentname);
  work.perm = allowed;
  
  if ((tmp = (CHILD_ALLOW_BUF *)malloc(sizeof(CHILD_ALLOW_BUF))) == NULL){
    perror("malloc");
    exit(1);
  }
  *tmp = work;
  
  s = insert_element(child_buf_table,tmp,filename);
  if (s == -2){
    /**
     *  the one whose  distance to parent directory is smaller  remain
     */
    old = search_element(child_buf_table, tmp->filename);
    if (old == NULL){
      error_print(__FILE__, __LINE__, "bug!");
      exit(1);
    }

    l1 = distance(filename, parentname);
    l2 = distance(old->filename, old->parentname);

    if (l1 < l2){
      free(old->parentname);
      old->parentname = strdup(parentname);
      old->perm = allowed;
    }
  }

  return;
}

static void print_allow(char *, FILE_LABEL *,int, FILE *);

/**
 *  @name:	print_allow_consider_child	
 *  @about:	print "allow" considering the label of child directory
 *              if the child of "filename" is labeled in file-label table,
 *              print "allow" to the label of the child. 
 *  @args:	domain (char *) -> domain name
 *  @args:	filename (char *) -> file name
 *  @args:	allowed (int) -> permission
 *  @args:	outfp (FILE *) -> output file descripter
 *  @args:	only_flag (int) -> flag
 *  @return:	none
 */
static void print_allow_consider_child(char *domain, char *filename, int allowed, FILE *outfp, int state){
	FILE_LABEL *label;
	HASH_NODE **file_label_array=NULL;
	HASH_NODE **dir_label_array=NULL;
	DOMAIN *domain_info;
	int i;
	int child_flag = 0;

	label = search_element(file_label_table,filename);
	if(label ==NULL){
		bug_and_die("");
	}
	if(state == FILE_FILE||state == FILE_DIR){
		/* allow /hoge/foo r,s; if foo is dir, does not output for file label under foo, but dir label
		 */   
		if(gDir_search) {
			if (state == FILE_FILE) {
				label = search_element(file_label_table,filename);
				if(label ==NULL){
					bug_and_die("");
				}

			} else {
				label = search_element(dir_label_table,filename);	
				if(label ==NULL){
					bug_and_die("");
				}
			}
			print_allow(domain, label, allowed, outfp);	
		} else {
			print_allow(domain, label, allowed, outfp);
		}
	} else {

		print_allow(domain, label, allowed, outfp);
		if(gDir_search) {
			label = search_element(dir_label_table,filename);
			if(label ==NULL){
				bug_and_die("");
			}
		}
		print_allow(domain, label, allowed, outfp);    
	}

	
	domain_info=(DOMAIN *)search_element(domain_hash_table,domain);
	if (domain_info == NULL){
		fprintf(stderr, "this must be bug\n");
		exit(1);
	}	
	
	file_label_array = create_hash_array(file_label_table);
	for (i = 0; i < file_label_table->element_num; i++){
		int s;
		label = (FILE_LABEL *)file_label_array[i]->data;
		
		child_flag = 0;
		if (state == FILE_DIRECT_CHILD){
			if (label->dir_flag) {
				s = 0;
			} else {
				s = 1;
			}

			child_flag = chk_child_file(filename, label->filename, s);
			//			printf("Debug:%s %s %s,%d %d\n", domain, filename, label->filename, label->dir_flag, child_flag);
		}else if(state == FILE_FILE || state == FILE_DIR){
			child_flag =0;
		}else{
			child_flag = chk_child_dir(filename, label->filename);
		}    
		
		if (child_flag == 1){ 
			if (search_element(domain_info->appeared_file_name, label->filename) == NULL){
				/* register it with child_buf_table and print later	*/
				register_child_buf_table(&file_child_buf_table, label->filename, filename, allowed);
			}
		}
	}  
	free(file_label_array);
	
	if(gDir_search) {
		dir_label_array = create_hash_array(dir_label_table);
		for (i = 0; i < dir_label_table->element_num; i++){
			label = (FILE_LABEL *)dir_label_array[i]->data;    
			child_flag = 0;
			if(state != FILE_ALL_CHILD)
				continue;
			child_flag = chk_child_dir(filename, label->filename);
			if (child_flag == 1){
				if (search_element(domain_info->appeared_file_name, label->filename) == NULL){
					register_child_buf_table(&dir_child_buf_table, label->filename, filename, allowed);

				}
			}    
		}
		free(dir_label_array);
	}
}

/*print permissions related to files*/
/*devflag is whether output "chr_file, blk_file" or not*/
void print_file_allow(DOMAIN *domain, char *type, int devflag, int allowed, FILE *outfp) {
	char *domain_name = domain->name;
	ADMIN_OTHER_RULE *adm_array;
	int num;
	int i;
	int devcreateflag=0;
	int part_relabelflag=0;
	int setattrflag=0;
	adm_array = domain->admin_rule_array;
	num = domain->admin_rule_array_num;

	/* check for allowseop part_relabel, allowpriv devcreate*/
	for(i=0 ;i<num ;i++){
		if(strcmp(adm_array[i].rule, "part_relabel") == 0) {
			part_relabelflag=1;
		}
		if(strcmp(adm_array[i].rule, "devcreate") == 0) {
			devcreateflag=1;
		}   
		if(strcmp(adm_array[i].rule, "setattr") == 0) {
			setattrflag=1;
		}
	}

	if(gDiet_by_attr || gProfile) {
		if(allowed == (WRITE_PRM|READ_PRM|SEARCH_PRM)){
			out_optimized_macro(outfp,"allow_file_wrs",domain_name,type);
			if(devflag){	    
				out_optimized_macro(outfp,"allow_file_dev_wrs",domain_name,type);
			} 
			return;
		}
		if(allowed == (READ_PRM|SEARCH_PRM)){
			out_optimized_macro(outfp,"allow_file_rs",domain_name,type);
			if(devflag){	    
				out_optimized_macro(outfp,"allow_file_dev_rs",domain_name,type);
			} 
			return;
		}
		if(allowed == (READ_PRM|EXECUTE_PRM|SEARCH_PRM)){
			out_optimized_macro(outfp,"allow_file_rxs",domain_name,type);
			if(devflag){	    
				out_optimized_macro(outfp,"allow_file_dev_rxs",domain_name,type);
			} 
			return;
		}
	}
  
	if (allowed & READ_PRM){
		out_optimized_macro(outfp,"allow_file_r",domain_name,type);
		if(devflag){	    
			out_optimized_macro(outfp,"allow_file_dev_r",domain_name,type);
		}
	}
	
	if (allowed & WRITE_PRM){
		out_optimized_macro(outfp,"allow_file_w",domain_name,type);
		if(devflag){    
			out_optimized_macro(outfp,"allow_file_dev_w",domain_name,type);
		}
		if(devcreateflag){
			fprintf(outfp, "#allowpriv devcreate\n");
			fprintf(outfp, "allow_file_devcreate(%s,%s)\n", domain_name,type);
		}
		if(part_relabelflag){
			fprintf(outfp, "#allowseop part_relabel\n");
			fprintf(outfp, "allow_file_relabel(%s,%s)\n", domain_name,type);
		}
	}
  
	if(allowed & EXECUTE_PRM){    
		out_optimized_macro(outfp,"allow_file_x",domain_name,type);
		if(devflag){
			out_optimized_macro(outfp,"allow_file_dev_x",domain_name,type);	    
		}
	}
	if (allowed & SEARCH_PRM){	      
		out_optimized_macro(outfp,"allow_file_s",domain_name,type);      
		if(devflag){    
			fprintf(outfp, "allow_file_dev_s(%s,%s)\n", domain_name, type);
		}
		if(setattrflag){
			fprintf(outfp, "#allowpriv setattr\n");	    
			out_optimized_macro(outfp, "allow_file_setattr", domain_name, type);   
		}
	}
	if(allowed & OVERWRITE_PRM){
		out_optimized_macro(outfp, "allow_file_o", domain_name, type);
		if(devflag){
			out_optimized_macro(outfp, "allow_file_dev_o", domain_name, type);
		}
		if(part_relabelflag){
			out_optimized_macro(outfp, "allow_file_relabel", domain_name, type);
		}
	}

	if(allowed & APPEND_PRM){
		out_optimized_macro(outfp, "allow_file_a", domain_name, type);
		if(devflag){
			out_optimized_macro(outfp, "allow_file_dev_a\n", domain_name, type);
		}
	}
  
	if(allowed & ERASE_PRM){
		out_optimized_macro(outfp, "allow_file_e", domain_name, type); 
		if(devflag){
			out_optimized_macro(outfp, "allow_file_dev_e", domain_name, type); 
		}
	}
	
	if(allowed & CREATE_PRM){
		out_optimized_macro(outfp, "allow_file_c", domain_name, type);
		if(devflag){
			out_optimized_macro(outfp, "allow_file_dev_c", domain_name, type); 
		}
	}

	if(allowed & SETATTR_PRM){
		out_optimized_macro(outfp, "allow_file_t", domain_name,type);
		if(devflag){
			out_optimized_macro(outfp, "allow_file_dev_t", domain_name, type);
		}
	}
	if(allowed & EXECMOD_PRM){
		out_optimized_macro(outfp, "allow_file_m", domain_name,type);
	}
}

/*Check whether |domain| is allowed to access device file under |filename|*/
int check_dev_flag(DOMAIN *domain, char *filename){
  char **devroot= domain->dev_root_array;
  char devroot_num=domain->dev_root_array_num;
  char *realname;
  int len;
  int i;
  
  for(i=0;i<devroot_num;i++){
    if(strcmp(devroot[i],filename)==0){
      return 1;
    }
    
    if(filename[0]!='/'){
      /*This is necessary to handle 
	allow /dev exclusive dev_log_t;
	allow dev_log_t r,s;
	1 is returned for |filename|=dev_log_t
      */
      realname = (char *)search_element(tmp_label_table, filename);
    }else{
      realname = filename;
    }
    if(realname == NULL){
      continue;
    }

    len = strlen(devroot[i]);
    strip_slash(devroot[i]);
    if (strncmp(devroot[i],realname,len)==0){
      if(realname[len]=='/'||realname[len]=='\0'){
	return 1;
      }
    }  
  }
 
  return 0;
}


char **find_to_domain(char *filename) {
	int i;
	char **to_domain = NULL;
	ENTRY_POINT e;
	int state;
	int s;
	//  to_domain = extend_ntarray(to_domain, xxxx);
	for (i=0; i<g_entry_point_array_num; i++) {
		e = g_entry_point_array[i];
		state = e.state;
    
		switch(state) {
		case FILE_FILE:
			if (strcmp(filename, e.filename)==0)
				to_domain = extend_ntarray(to_domain, e.to_domain);      
			break;
		case FILE_DIRECT_CHILD:
			if (search_element(all_dirs_table, filename)) {
				s = 0;
			} else {
				s = 1;
			}
			if (chk_child_file(e.filename, filename, s)==1) {
				to_domain = extend_ntarray(to_domain, e.to_domain);      
			}
			break;
		case FILE_ALL_CHILD:
			if(chk_child_dir(e.filename, filename)==1) {
				to_domain = extend_ntarray(to_domain, e.to_domain);      
			}
			break;
		default:
			break;
		}
		
	}
	
	return to_domain;
}

/*handles dx permission*/
void print_domain_execute(DOMAIN *domain, FILE_LABEL *label,  int devflag, FILE *outfp){
  char **to_domain=NULL; /*NULL terminated array*/
  int num;
  int i;
  to_domain = find_to_domain(label->filename);
  num = get_ntarray_num(to_domain);
  if(num == 0){
    fprintf(outfp,"##dx specified but no to domain\n");
    return ;
  }
  if(num == 1){
    fprintf(outfp,"##domain execute\n");
    fprintf(outfp,"domain_auto_trans(%s,%s,%s)\n", domain->name, label->labelname, to_domain[0]);
  }
  if(num>1){    
    fprintf(outfp,"##domain execute, multiple(%d) to domain.\n", num);
    for(i=0;i<num;i++){
      fprintf(outfp,"domain_auto_trans(%s,%s,%s)\n", domain->name, label->labelname, to_domain[i]); 
    }
  }
  
  print_file_allow(domain, label->labelname, devflag, EXECUTE_PRM, outfp);
  return ;

}

/**
 *  @name:	print_allow		
 *  @about:	print "allow" based on "domain,filename,allowed" 
 *  @args:	domain (char *) -> domain name
 *  @args:	filename (char *) -> filename
 *  @args:	outfp (FILE *) -> output file descripter
 *  @return:	none
 */
static void print_allow(char *domain, FILE_LABEL *label, int allowed, FILE *outfp){
	DOMAIN *d;
	int devflag =0;
	char *filename;
	char *c;
	char *childstr="";

	d = (DOMAIN *)search_element(domain_hash_table, domain);

	if (allowed == DENY_PRM || label == NULL || d == NULL){
	  return;
	}
	filename = strdup(label->filename);
	c = strstr(filename, DUMMY_FILE_NAME);
	if (c) {
		*c = '\0';
		childstr ="<child dirs>";
	}

	fprintf(outfp, "\n#%s:%s%s:%s\n",label->labelname, filename, childstr, perm_to_str(allowed));
	
	devflag = check_dev_flag(d, label->filename);
	
	print_file_allow(d, label->labelname, devflag, allowed, outfp);
	
	if(allowed & DOMAIN_EXECUTE_PRM){
	  print_domain_execute(d,label,devflag, outfp);
	}
	free(filename);
}

/**
 *  @name:	print_child_allow		
 *  @about:	print "allow" based on child_buf_table which is constructed by "print_allow_consider_child". 
 *  @args:	domain (char *) -> domain name
 *  @args:	outfp (FILE *) -> output file descripter
 *  @return: 	none
 */
static void print_child_allow(char *domain, FILE *outfp){
  HASH_NODE **array;
  CHILD_ALLOW_BUF *tmp;
  int i,num;
  FILE_LABEL *label;
  if (file_child_buf_table != NULL){
    
    num = file_child_buf_table->element_num;
    array = create_hash_array(file_child_buf_table);

    for (i = 0; i < num; i++){
      tmp = (CHILD_ALLOW_BUF *)array[i]->data;
      label = (FILE_LABEL *)search_element(file_label_table, tmp->filename);
      print_allow(domain, label, tmp->perm, outfp);
    }
    clear_child_buf_table(&file_child_buf_table);
    free(array);
  }

  if(gDir_search) {
	  if(dir_child_buf_table !=NULL){
		  num = dir_child_buf_table ->element_num;  
		  array = create_hash_array(dir_child_buf_table);
		  for (i = 0; i < num; i++){
			  tmp = (CHILD_ALLOW_BUF *)array[i]->data;
			  label =(FILE_LABEL *)search_element(dir_label_table, tmp->filename);
			  print_allow(domain, label, tmp->perm, outfp);
		  }
		  clear_child_buf_table(&dir_child_buf_table);
          free(array);
	  }
  }
}

/**
 *  @name:	print_domain_allow
 *  @about:	 
 *  @args:	a (vlid *) -> File acl rule
 *  @return:	return 0
 */
static FILE *file_out_fp;
static int print_domain_allow(DOMAIN *domain){

  FILE_RULE *array;
  int array_num;
  FILE_RULE rule;
  int i;
  FILE_LABEL *label;
   
  array = domain->file_rule_array;
  array_num = domain->file_rule_array_num;

  for(i = 0;i<array_num;i++){
    rule = array[i];
    if(rule.path[0]=='/' || rule.path[0]=='~'){/*allow for files*/
      print_allow_consider_child(rule.domain->name, rule.path,rule.allowed, file_out_fp,rule.state);
    }else{/*allow for "allow|allowfs exclusive" labels*/
      if(search_element(tmp_label_table, rule.path)==NULL){
	fprintf(stderr, "Warning:label %s does not exist, skipped.Check allow label <permission>.\n",rule.path);
      }else{
	if(rule.allowed!=DENY_PRM){
	  fprintf(file_out_fp,"#Can access allow|allowfs exclusive label(%s)\n",rule.path);
	  label = (FILE_LABEL *)search_element(file_label_table, rule.path);
	  print_allow(rule.domain->name, label, rule.allowed, file_out_fp);
	}
      }
    }
  }
  return 0;
}

/**
 *  @name:	save_prev_label
 *  @about:	Labels labeled by "file_type_auto_trans" are overwritten 
 *              by setfiles. So,save such labels in file.
 *  @args:	path (char *) -> directory
 *  @args:	exec_label (char *) -> label name
 *  @return:	none
 */
static void
save_prev_label(char *path, char *tmp_label)
{
	struct stat buf;
	security_context_t context=NULL;
	DIR *fp;
	struct dirent *dent;
	char *fullpath;
	char *type;
	int r;
	int stat_ret;
	if (is_selinux_enabled() != 1)
	{				/*do nothing if SELinux is off */
		return;
	}
	memset(&buf,0,sizeof(buf));
	r = stat(path, &buf);
	if(r!=0){
	  return;
	}
	if (!S_ISDIR(buf.st_mode))
	{
		return;
	}

	if ((fp=opendir(path)) == NULL)
	{
		fprintf(stderr,"Directory open error %s\n", path);
        return;
	}

	while ((dent = readdir(fp)) != NULL)
	{
		fullpath = malloc(sizeof(char)*(strlen(path) + strlen(dent->d_name) + 4));
		sprintf(fullpath, "%s/%s", path, dent->d_name);
		memset(&buf,0,sizeof(buf));
		stat_ret = stat(fullpath, &buf);

		if (lgetfilecon(fullpath, &context) == -1)
		{
			free(fullpath);
            closedir(fp);
			return;
		}

		//		type = strrchr((char *)context, ':');
		type = get_type_from_context(context);
		if (type == NULL)
		{
			error_print(__FILE__, __LINE__, "bug\n");
			printf("%s,%s\n", fullpath, (char *)context);
			exit(1);
		}

		if (strcmp(type, tmp_label) == 0)
		{
			//      fprintf(stdout, "%s\t%s\n", fullpath, type);
			if (stat_ret==0 && S_ISDIR(buf.st_mode))
			{
				fprintf(TMP_fp, "%s(|/.*)\tgen_context(system_u:object_r:%s:s0)\n", fullpath, type);
			}
			else
			{
				fprintf(TMP_fp, "%s\tgen_context(system_u:object_r:%s:s0)\n", fullpath, type);
			}
		}

		freecon(context);
		free(type);

		free(fullpath);
	}
    closedir(fp);
}

/**
 *  @name:	out_file_type_trans
 *  @about:	print "file_type_auto_trans"
 *  @args:	outfp (FILE *) -> output file
 *  @args:	d (DOMAIN *) -> domain buffer list
 *  @return:	none
 */
static void out_file_type_trans(FILE *outfp, DOMAIN *d) {
	FILE_TMP_RULE e;
	int i;
	FILE_LABEL *l = NULL;
	
	if (d->tmp_rule_array_num == 0)
		return;
	
	fprintf(outfp, "\n####file_type_auto_trans rule\n");

	for (i = 0; i < d->tmp_rule_array_num; i++) {
		e = d->tmp_rule_array[i];
		
		if(gDir_search) {
			l = (FILE_LABEL *)search_element(dir_label_table,e.path);
			if (l == NULL){
				l = (FILE_LABEL *)search_element(file_label_table, e.path);
			}
		} else {
			l = (FILE_LABEL *)search_element(file_label_table, e.path);
		}
		
		if(gOutFileTypeTransContext) {
			/* need to change save_prev_lable to support android */
			/* save_prev_label(e.path, e.name); */
		}
	
		if (l == NULL) 
		{
			fprintf(stderr, "bug\n");
			exit(1);
		}
		//fprintf(outfp, "file_type_auto_trans(%s,%s,%s)\n", d->name, l->labelname, e.name);
		fprintf(outfp, "type_transition %s %s:file %s;\n", d->name, l->labelname, e.name);
		fprintf(outfp, "allow %s %s:file { read write };\n", d->name, e.name);
	}
	fprintf(outfp, "####\n");
}

/**
 *  @name:	out_file_acl
 *  @about:	output file acl
 *  @args:	outfp (FILE *) -> output file
 *  @args:	domain (DOMAIN *) -> domain buffer list
 *  @return:	none
 */
void out_file_acl(FILE *outfp, DOMAIN *domain){
  file_out_fp = outfp;

  print_domain_allow(domain);
  print_child_allow(domain->name, outfp);
  out_file_type_trans(outfp, domain);
}

