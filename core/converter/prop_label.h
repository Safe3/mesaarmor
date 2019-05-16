#ifndef PROP_LABEL_H
#define PROP_LABEL_H

#include <stdio.h>
#include "hashtab.h"

int create_prop_label_table(HASH_TABLE *);
char *make_prop_label(char *name);
void out_prop_type(FILE *out);
/*
void print_prop_label_tab();
void delete_prop_label_tab();
void out_prop_type(FILE *);
*/
void out_prop_contexts_config(FILE *prop_contexts);

#endif
