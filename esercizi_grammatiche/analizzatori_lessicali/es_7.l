%{
#include <stdio.h>
%}

DIGIT     [0-9]

INTEGER   [\+\-]?{DIGIT}+
FRACT     [\+\-]?({DIGIT}+\.{DIGIT}*|\.{DIGIT}+)

%%
{INTEGER}                         { 
    printf("(%s, INTEGER, %d)\n", yytext, yyleng); }
{FRACT}                           {
    printf("(%s, FRAC, %d)\n", yytext, yyleng);
}
({INTEGER}|{FRACT})[eE]{INTEGER} {
    printf("(%s, FLOAT, %d)\n", yytext, yyleng);
}
.               {}
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
