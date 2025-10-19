%{
#include <stdio.h>
%}

%%
0*(1(01*0)*1)+        { printf("%s\n", yytext); }
.                     {}
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
