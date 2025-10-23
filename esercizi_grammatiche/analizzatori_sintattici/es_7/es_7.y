%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token OP_PLUS
%token OP_MINUS
%token OP_TIMES
%token OP_EQUAL
%token IF
%token THEN
%token ELSE

%left OP_EQUAL  // Ha la precedenza più bassa
%left OP_PLUS OP_MINUS
%left OP_TIMES
%right ELSE     // Altrimenti la grammatica è ambigua per if-then if-then else

%%
input:
     | input line
;

line: '\n'                     {}
    | exp '\n'                 { printf("%d\n", $1); }
;

exp: NUMBER                    { $$ = $1; }

   | exp OP_PLUS exp           { $$ = $1 + $3; }
   | exp OP_MINUS exp          { $$ = $1 - $3; }
   | exp OP_TIMES exp          { $$ = $1 * $3; }

   | exp OP_EQUAL exp          { $$ = $1 == $3; }

   | IF exp THEN exp ELSE exp  { $$ = $2 ? $4 : $6; }

   | '(' exp ')'               { $$ = $2; }
;
