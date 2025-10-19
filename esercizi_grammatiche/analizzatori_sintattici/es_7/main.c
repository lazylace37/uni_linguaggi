#include "y.tab.h"
#include <stdio.h>

void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }

int yywrap() { return 1; }

int main(void) {
  yyparse();
  return 0;
}
