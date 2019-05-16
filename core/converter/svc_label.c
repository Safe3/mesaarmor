#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "hashtab.h"
#include "global.h"
#include "svc_label.h"
#include "action.h"
#include <seedit/common.h>

/**
 ***********************************************
 *   Functions to associate label with file
 ***********************************************
 */

/**
 *  hash table of association of label with file
 *  key:file name
 */
HASH_TABLE *svc_label_table;

static HASH_TABLE *declared_type_table;

#define SVC_LABEL_TABLE_SIZE 1024*8

char *make_svc_label(char *name)
{
	char *head = NULL;
	char *label;
	int len;
	int i;
	char *svcname;

	if(name == NULL)
	    return NULL;

	/* the label of default svc */
	if (strcmp(name, "*") == 0)
	{
		label = strdup(DEFAULT_SVC_LABEL);
		return label;
	}

	svcname = strdup(name);
	head = svcname;
	len = strlen(head);

	/* convert "." to "d" */
	for (i = 0; i < len; i++)
	{
		if(head[i] == '.')
		{
			head[i]='d';
		}
	}

	label = (char *)my_malloc(sizeof(char)*(len+3));
	sprintf(label, "s_%s", head);
	free(svcname);

	return label;
}

/*allocate label buffer and set value*/
SVC_LABEL *init_svc_label(char *svc) {
	SVC_LABEL *label;
	label = (SVC_LABEL *)my_malloc(sizeof(SVC_LABEL));
	if (label == NULL) {
		return NULL;
	}
	label->svcname = strdup(svc);
	label->labelname = make_svc_label(svc);

	return label;
}

/*
  Add label to svc_label_table.
*/
static void register_svc_label_table(SVC_LABEL *label) {
	FILE_LABEL *tmp;

	if ((tmp = search_element(svc_label_table, label->svcname)) == NULL){
		insert_element(svc_label_table, label, label->svcname);
	}
}


static int add_svc_label(SVC_RULE svc_rule) {
	SVC_LABEL *label;

	label = init_svc_label(svc_rule.svc);
	register_svc_label_table(label);
	return 0;
}

/**
 *  @name:	one_domain_svc_label
 *  @about:
 *  @args:	domain (void *) -> domain
 *  @return:	return 0 on success
 */
static int
one_domain_svc_label(void *domain)
{
	DOMAIN *d;
	SVC_RULE *svc_rule_array;
	int svc_rule_array_num;
	int i;
	d = domain;
	svc_rule_array = d->svc_rule_array;
	svc_rule_array_num = d->svc_rule_array_num;
	for(i=0;i<svc_rule_array_num;i++){
	  add_svc_label(svc_rule_array[i]);
	}

	return 0;
}


/**
 *  @name:	create_svc_label_table
 *  @about:	major function to label files
 *  @args:	domaintab (HASH_TABLE *) -> hash table
 *  @return:	return 0 on success
 */
int
create_svc_label_table(HASH_TABLE *domaintab){
  int i;
  FORCE_LABEL *fl;
  /* create file hash table */
  svc_label_table = create_hash_table(SVC_LABEL_TABLE_SIZE);

  /* store handler function to the domain table */
  handle_all_element(domaintab, one_domain_svc_label);

  return 0;
}

/**
 *  @name:	print_svc_label
 *  @about:	print svc label
 *  @args:	n (void *) -> svc
 *  @retrun:	return 0
 */
static int
print_svc_label(void *n)
{
	SVC_LABEL *l;

	l = n;
	printf("%s,%s\n", l->svcname, l->labelname);

	return 0;
}

/**
 *  @name:	print_svc_label_tab
 *  @about:	print svc label table
 *  @args:	none
 *  @return:	none
 */
void
print_svc_label_tab()
{
	handle_all_element(svc_label_table, print_svc_label);
}


/**
 *  @name:	free_svc_label
 *  @about:	free svc label buffer
 *  @args:	l (void *) -> label buffer
 *  @return:	return 0
 */
static int
free_svc_label(void *l)
{
	SVC_LABEL *n;

	n = l;
	free(n->svcname);
	free(n->labelname);
	free(n);

	return 0;
}

/**
 *  @name:	delete_svc_label_tab
 *  @about:	delete svc label table
 *  @args:	none
 *  @return:	none
 */
void
delete_svc_label_tab()
{
	handle_all_element(svc_label_table, free_svc_label);
	delete_hash_table(svc_label_table);
}

/**
 *  output file pointer (static)
 */
static FILE *out_fp;

/**
 *  @name:	print_type
 *  @about:	print svc type
 *  @args:	n (void *) -> SVC_LABEL pointer
 *  @return:	return 0 on success
 */

static int print_type(void *n){
  SVC_LABEL *l;
  SVC_LABEL *t;
  l = n;
  t = (SVC_LABEL *)search_element(declared_type_table, l->labelname);
  if(t == NULL){
    fprintf(out_fp, "type %s,service_manager_type;\n", l->labelname);
    insert_element(declared_type_table, l, l->labelname);
  }

  return 0;
}

/**
 *  @name:	out_svc_type
 *  @about:	output svc type
 *  @args:	out (FILE *) -> output file descripter
 *  @return:	none
 */

void out_svc_type(FILE *out){
  out_fp = out;
  declared_type_table = create_hash_table(SVC_LABEL_TABLE_SIZE);
  handle_all_element(svc_label_table, print_type);
}

/**
 *  Functions related to file_context
 */
static char **svc_name_buf;
//static FILE *context_out_fp;

/**
 *  @name:	set_buf
 *  @about:	to set value in array to  sort
 * 		This function is supposed to be called only once because of "static"
 *  @args:	e (void *) -> file label
 *  @return:	return 0 on success
 */
static int
set_buf(void *e)
{
	static int i=0;
	SVC_LABEL *l;
	l = e;
	svc_name_buf[i] = l->svcname;
	i++;

	return 0;
}

/**
 *  @name:	compar
 *  @about:	compare strings
 *  @args:	a (void *) -> first target
 *  @args:	b (void *) -> second target
 *  @return:	return 0 if a < b, otherwise return 1
 */
static int
compar(const void *a, const void *b)
{
	return strcmp(*(char **)a, *(char **)b);
}

static int
rev_compar(const void *a, const void *b)
{
	return strcmp(*(char **)b, *(char **)a);
}

void out_svc_contexts_file(FILE *svc_contexts) {
	int i;
	SVC_LABEL *pl;
	HASH_NODE **svc_label_array ;

	fprintf(svc_contexts, "#This file is generated by seedit-converter\n");

	svc_label_array = create_hash_array(svc_label_table);
	for (i = 0; i<svc_label_table->element_num; i++){
		pl =svc_label_array[i]->data;
		fprintf(svc_contexts, "%s\tu:object_r:%s:s0\n",
				pl->svcname, pl->labelname);
	}
	fprintf(svc_contexts, "#End of service_contexts\n");
    free(svc_label_array);
	return;
}

void out_svc_contexts_config(FILE *svc_contexts){
  svc_name_buf = (char **)my_malloc(sizeof(char *)*(svc_label_table->element_num));

  handle_all_element(svc_label_table, set_buf);
  qsort(svc_name_buf, svc_label_table->element_num, sizeof(char *), compar);

  out_svc_contexts_file(svc_contexts);

  free(svc_name_buf);
}


