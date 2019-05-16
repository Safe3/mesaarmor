#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include "hashtab.h"
#include "global.h"
#include "prop_label.h"
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
HASH_TABLE *prop_label_table;

static HASH_TABLE *declared_type_table;

#define PROP_LABEL_TABLE_SIZE 1024*8

char *make_prop_label(char *name)
{
	char *head = NULL;
	char *label;
	int len;
	int i;
	char *propname;

	if(name == NULL)
	    return NULL;

	/* the label of default prop */
	if (strcmp(name, "*") == 0)
	{
		label = strdup(DEFAULT_PROP_LABEL);
		return label;
	}

	propname = strdup(name);
	head = propname;
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
	sprintf(label, "p_%s", head);
	free(propname);

	return label;
}

/*allocate label buffer and set value*/
PROP_LABEL *init_prop_label(char *prop) {
	PROP_LABEL *label;
	label = (PROP_LABEL *)my_malloc(sizeof(PROP_LABEL));
	if (label == NULL) {
		return NULL;
	}
	label->propname = strdup(prop);
	label->labelname = make_prop_label(prop);

	return label;
}

/*
  Add label to prop_label_table.
*/
static void register_prop_label_table(PROP_LABEL *label) {
	FILE_LABEL *tmp;

	if ((tmp = search_element(prop_label_table, label->propname)) == NULL){
		insert_element(prop_label_table, label, label->propname);
	}
}


static int add_prop_label(PROP_RULE prop_rule) {
	PROP_LABEL *label;

	label = init_prop_label(prop_rule.prop);
	register_prop_label_table(label);
	return 0;
}

/**
 *  @name:	one_domain_prop_label
 *  @about:
 *  @args:	domain (void *) -> domain
 *  @return:	return 0 on success
 */
static int
one_domain_prop_label(void *domain)
{
	DOMAIN *d;
	PROP_RULE *prop_rule_array;
	int prop_rule_array_num;
	int i;
	d = domain;
	prop_rule_array = d->prop_rule_array;
	prop_rule_array_num = d->prop_rule_array_num;
	for(i=0;i<prop_rule_array_num;i++){
	  add_prop_label(prop_rule_array[i]);
	}

	return 0;
}


/**
 *  @name:	create_prop_label_table
 *  @about:	major function to label files
 *  @args:	domaintab (HASH_TABLE *) -> hash table
 *  @return:	return 0 on success
 */
int
create_prop_label_table(HASH_TABLE *domaintab){
  int i;
  FORCE_LABEL *fl;
  /* create file hash table */
  prop_label_table = create_hash_table(PROP_LABEL_TABLE_SIZE);

  /* store handler function to the domain table */
  handle_all_element(domaintab, one_domain_prop_label);

  return 0;
}

/**
 *  @name:	print_prop_label
 *  @about:	print prop label
 *  @args:	n (void *) -> prop
 *  @retrun:	return 0
 */
static int
print_prop_label(void *n)
{
	PROP_LABEL *l;

	l = n;
	printf("%s,%s\n", l->propname, l->labelname);

	return 0;
}

/**
 *  @name:	print_prop_label_tab
 *  @about:	print prop label table
 *  @args:	none
 *  @return:	none
 */
void
print_prop_label_tab()
{
	handle_all_element(prop_label_table, print_prop_label);
}


/**
 *  @name:	free_prop_label
 *  @about:	free prop label buffer
 *  @args:	l (void *) -> label buffer
 *  @return:	return 0
 */
static int
free_prop_label(void *l)
{
	PROP_LABEL *n;

	n = l;
	free(n->propname);
	free(n->labelname);
	free(n);

	return 0;
}

/**
 *  @name:	delete_prop_label_tab
 *  @about:	delete prop label table
 *  @args:	none
 *  @return:	none
 */
void
delete_prop_label_tab()
{
	handle_all_element(prop_label_table, free_prop_label);
	delete_hash_table(prop_label_table);
}

/**
 *  output file pointer (static)
 */
static FILE *out_fp;

/**
 *  @name:	print_type
 *  @about:	print prop type
 *  @args:	n (void *) -> PROP_LABEL pointer
 *  @return:	return 0 on success
 */

static int print_type(void *n){
  PROP_LABEL *l;
  PROP_LABEL *t;
  l = n;
  t = (PROP_LABEL *)search_element(declared_type_table, l->labelname);
  if(t == NULL){
    fprintf(out_fp, "type %s,property_type;\n", l->labelname);
    insert_element(declared_type_table, l, l->labelname);
  }

  return 0;
}

/**
 *  @name:	out_prop_type
 *  @about:	output prop type
 *  @args:	out (FILE *) -> output file descripter
 *  @return:	none
 */

void out_prop_type(FILE *out){
  out_fp = out;
  declared_type_table = create_hash_table(PROP_LABEL_TABLE_SIZE);
  handle_all_element(prop_label_table, print_type);
}

/**
 *  Functions related to file_context
 */
static char **prop_name_buf;
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
	PROP_LABEL *l;
	l = e;
	prop_name_buf[i] = l->propname;
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

void out_prop_contexts_file(FILE *prop_contexts) {
	int i;
	PROP_LABEL *pl;
	HASH_NODE **prop_label_array ;

	fprintf(prop_contexts, "#This file is generated by seedit-converter\n");

	prop_label_array = create_hash_array(prop_label_table);
	for (i = 0; i<prop_label_table->element_num; i++){
		pl =prop_label_array[i]->data;
		fprintf(prop_contexts, "%s\tu:object_r:%s:s0\n",
				pl->propname, pl->labelname);
	}
	fprintf(prop_contexts, "#End of property_contexts\n");
    free(prop_label_array);
	return;
}

void out_prop_contexts_config(FILE *prop_contexts){
  prop_name_buf = (char **)my_malloc(sizeof(char *)*(prop_label_table->element_num));

  handle_all_element(prop_label_table, set_buf);
  qsort(prop_name_buf, prop_label_table->element_num, sizeof(char *), compar);

  out_prop_contexts_file(prop_contexts);

  free(prop_name_buf);
}


