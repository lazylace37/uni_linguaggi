%{
#include <stdio.h>
#include <string.h>
#include "y.tab.c"
%}

%%
  /* Costanti numeriche */
[0-9]+                { yylval.number = atoi(yytext); return NUMBER; }

  /* Operazioni aritmetiche */
"+"                   { return OP_PLUS; }
"-"                   { return OP_MINUS; }
"*"                   { return OP_TIMES; }
"/"                   { return OP_DIVIDE; }

  /* Esponente */
"**"                  { return OP_EXP; }

  /* Funzioni analitiche */
"sin"                 { return F_SIN; }
"cos"                 { return F_COS; }
"tan"                 { return F_TAN; }

  /* Parentesi */
"("                   { return OPAREN; }
")"                   { return CPAREN; }

  /* Identificatori (devono venire dopo le funzioni analitiche) */
[a-zA-Z][a-zA-Z0-9_]* { yylval.string = strdup(yytext); return IDENTIFIER; }

  /* Ignoriamo gli spazi e tab */
[ \t]                 {}
  /* Ma passiamo i \n */
\n                    { return yytext[0]; }
%%
