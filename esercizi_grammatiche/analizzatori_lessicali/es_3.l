%{
#include <stdio.h>

// Indica il livello di annidamento di un commento.
// Se == 0, non siamo in un commento.
// Se  > 0, siamo in un commento.
unsigned int livello_commento = 0;
%}

%%
  /* Rimuoviamo da '//' fino alla fine della linea */
"//".*     {}

  /* Quando troviamo l'inizio di un commento incrementiamo il livello di nesting. */
"/*"       { livello_commento++; }
  /* Quando troviamo la fine di un commento decrementiamo il livello di nesting. */
"*/"       { if (livello_commento > 0) livello_commento--; }

  /* Stampiamo solo se NON siamo in un commento */
.          { if (livello_commento == 0) printf("%s", yytext); }
%%

int yywrap() {
  return 1;
}

int main(void) {
  yylex();
  return 0;
}
