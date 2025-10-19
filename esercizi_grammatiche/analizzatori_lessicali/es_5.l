%{
#include <stdio.h>
int n = 0;
%}

%%
[048]                 printf("%s ", yytext);
[0-9]*00              printf("%s ", yytext);
[0-9]*[13579][26]     printf("%s ", yytext);
[0-9]*[02468][048]    printf("%s ", yytext);
.                     {}
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
