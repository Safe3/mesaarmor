#ifndef SVC_LABEL_H
#define SVC_LABEL_H

#include <stdio.h>
#include "hashtab.h"

int create_svc_label_table(HASH_TABLE *);
char *make_svc_label(char *name);
void out_svc_type(FILE *out);
void out_svc_contexts_config(FILE *svc_contexts);

#endif
