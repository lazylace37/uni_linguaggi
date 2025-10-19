%{
#include <stdio.h>
#include <string.h>
#include "y.tab.c"
%}

%%
  /* Costanti numeriche */
[0-9]+                { yylval = atoi(yytext); return NUMBER; }

  /* Operazioni aritmetiche */
"+"                   { return OP_PLUS; }
"-"                   { return OP_MINUS; }
"*"                   { return OP_TIMES; }

  /* Uguaglianza */
"=="                  { return OP_EQUAL; }

  /* if, then, else */
"if"                  { return IF; }
"then"                { return THEN; }
"else"                { return ELSE; }

"("                   { return yytext[0]; }
")"                   { return yytext[0]; }

  /* Ignoriamo gli spazi e tab */
[ \t]                 {}
  /* Ma passiamo i \n */
\n                    { return yytext[0]; }
%%
