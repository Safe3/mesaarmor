/*This is from libselinux 1.30
 code of libselinux is public domain software.
*/
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <pwd.h>
#include <limits.h>
#include <selinux/selinux.h>
#include <selinux/context.h>
#define CUSTOMIZABLE_PATH "/etc/selinux/seedit/contexts/customizable_types"
#include "is_customizable_type.h"

#ifdef NO_CUSTOMIZABLE_TYPES

static int get_customizable_type_list (security_context_t **retlist)
{
	FILE *fp;
	char buf[4097];
	unsigned int ctr=0, i;
	security_context_t *list=NULL;

	fp = fopen(CUSTOMIZABLE_PATH, "r");
	if (!fp)
		return -1;

	while (fgets_unlocked(buf, 4096, fp) && ctr < UINT_MAX) {
		ctr++;
	}
	rewind(fp);
	if (ctr) {
		list=(security_context_t *) calloc(sizeof(security_context_t), ctr+1);
		if (list) {
		  i=0;
		  while (fgets_unlocked(buf, 4096, fp) && i < ctr) {
		    buf[strlen(buf)-1]=0;
		    list[i]=(security_context_t) strdup(buf);
		    if (!list[i]) {
		      unsigned int j;
		      for (j = 0; j < i; j++) free(list[j]);
		      free(list);
		      list=NULL;
		      break;
		    }
		    i++;
		  }
		}
	}
	fclose(fp);
	if (!list)
		return -1;
	*retlist=list;
	return 0;
}

static security_context_t *customizable_list=NULL;

int is_context_customizable (security_context_t scontext) {
  int i;
  const char *type;
  context_t c;

  if (! customizable_list) {
    if (get_customizable_type_list(&customizable_list)!=0) 
      return -1;
  }

  c = context_new(scontext);
  if (!c)
	  return -1;

  type = context_type_get(c);
  if (!type) {
	  context_free(c);
	  return -1;
  }
  
  for (i = 0; customizable_list[i]; i++) {
	  if (strcmp(customizable_list[i],type) == 0) {
		  context_free(c);
		  return 1;
	  }
  }
  context_free(c);
  return 0;
}

#endif
