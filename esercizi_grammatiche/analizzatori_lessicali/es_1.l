%{
#include <stdio.h>
%}

%%
  /* Parole chiave */
"var"               { printf("(KEYWORD, %s)\n", yytext); }
"function"          { printf("(KEYWORD, %s)\n", yytext); }
"procedure"         { printf("(KEYWORD, %s)\n", yytext); }
"while"             { printf("(KEYWORD, %s)\n", yytext); }
"do"                { printf("(KEYWORD, %s)\n", yytext); }
"if"                { printf("(KEYWORD, %s)\n", yytext); }
"then"              { printf("(KEYWORD, %s)\n", yytext); }
"else"              { printf("(KEYWORD, %s)\n", yytext); }
"for"               { printf("(KEYWORD, %s)\n", yytext); }

  /* Identificatori */
[a-z][a-zA-Z0-9_-]* { printf("(IDENTIFIER, %s)\n", yytext); }

  /* Sequenze di cifre */
[0-9]+              { printf("(NUMBER, %s)\n", yytext); }

  /* Operatori */
"+"                 { printf("(OPERATOR, %s)\n", yytext); }
"++"                { printf("(OPERATOR, %s)\n", yytext); }
"-"                 { printf("(OPERATOR, %s)\n", yytext); }
"--"                { printf("(OPERATOR, %s)\n", yytext); }
"="                 { printf("(OPERATOR, %s)\n", yytext); }
"=="                { printf("(OPERATOR, %s)\n", yytext); }

  /* Ignora spazi */
[ \t]               {}
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
