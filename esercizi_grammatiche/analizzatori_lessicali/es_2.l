%{
#include <stdio.h>

unsigned int livello_commento = 0;
%}

%%
  /* Rimuoviamo da '--' fino alla fine della linea */
"--".*$    {}

  /* Quando troviamo un '{-' incrementiamo il livello di nesting. */
"{-"       { livello_commento++; }
"-}"       { if (livello_commento > 0) livello_commento--; }

  /* Stampiamo solo se non siamo in un commento */
.          { if (livello_commento == 0) printf("%s", yytext); }
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
