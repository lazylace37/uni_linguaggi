#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *
#show: codly-init.with()

#set document(
  title: "Esercizi su Analizzatori lessicali e sintattici",
  author: "Gioele Vuaran (matricola 167222)",
)
#set text(
  font: "Libertinus Serif",
  ligatures: false,
)
#show raw: set text(font: "DejaVu Sans Mono", size: 8pt)
#set page(
  paper: "a4",
  numbering: "1",
)
#show link: underline

#set heading(numbering: "1.")

#align(
  center,
  text(18pt, weight: "bold", "Esercizi su Analizzatori lessicali e sintattici"),
)
#v(18pt, weak: true)
#align(
  center,
  text(18pt, weight: "medium", "Linguaggi di Programmazione"),
)
#v(18pt, weak: true)

#align(
  center,
  box(inset: (top: 20pt), {
    text(15pt, weight: "semibold", "Gioele Vuaran")
  }),
)
#align(
  center,
  box(inset: (bottom: 20pt), {
    text(15pt, weight: "semibold", "(matricola 167222)")
  }),
)
#v(6pt, weak: true)

#align(
  center,
  box(inset: (y: 20pt), {
    text(
      12pt,
      "Ultimo aggiornamento: "
        + text(
          datetime.today().display(),
        ),
    )
  }),
)

#box(
  inset: (y: 80pt),
  [Nota: per una visualizzazione più efficace, gli esercizi sono stati anche
    caricati in un repository Git all'indirizzo
    #link("https://github.com/lazylace37/uni_linguaggi")],
),

#pagebreak()

= Analizzatori lessicali

== Esercizio 3

#codly(
  languages: codly-languages,
  header: [es_3.l],
  lang-format: none,
  zebra-fill: none,
)
```c
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
```

#pagebreak()

== Esercizio 1

#codly(
  languages: codly-languages,
  header: [es_1.l],
  lang-format: none,
  zebra-fill: none,
)
```c
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
```

#pagebreak()

= Analizzatori sintattici

== Esercizio 3

#codly(
  languages: codly-languages,
  header: [es_3.y],
  lang-format: none,
  zebra-fill: none,
)
```c
%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>

// Nodo dell'albero sintattico.
struct node_t {
  // Indica il tipo di token. yytoken_kind_t è una enum contenente i token
  // specificati con %token.
  yytoken_kind_t token_type;

  // Il valore di un nodo può essere uno tra:
  // - un intero, per le costanti numeriche (NUMBER)
  // - una stringa, per gli identificatori (IDENTIFIER)
  // - un sottoalbero. Per gli operatori binari left e right contengono i
  // puntatori ai nodi figli, per quelli unari si usa solo left.
  union {
    int value;
    char *text;
    struct {
      struct node_t *left;
      struct node_t *right;
    };
  };
};

typedef struct node_t node_t;

/* Crea un nuovo nodo di tipo `token_type` con figli `left` e `right` */
node_t *new_node(yytoken_kind_t token_type, node_t *left, node_t *right) {
  node_t *node = malloc(sizeof(node_t));
  node->token_type = token_type;
  node->left = left;
  node->right = right;
  return node;
}

/* Crea un nuovo nodo di tipo `IDENTIFIER` con valore `text` */
node_t *new_identifier_node(char *text) {
  node_t *node = malloc(sizeof(node_t));
  node->token_type = IDENTIFIER;
  node->text = text;
  return node;
}

/* Crea un nuovo nodo di tipo `NUMBER` con valore `value` */
node_t *new_number_node(int value) {
  node_t *node = malloc(sizeof(node_t));
  node->token_type = NUMBER;
  node->value = value;
  return node;
}

const char *token_to_string(yytoken_kind_t token) {
  switch (token) {
  case IDENTIFIER:
    return "ID";
  case NUMBER:
    return "NUMBER";
  case OP_PLUS:
    return "+";
  case OP_MINUS:
    return "-";
  case OP_TIMES:
    return "*";
  case OP_DIVIDE:
    return "/";
  case OP_EXP:
    return "**";
  case F_SIN:
    return "sin";
  case F_COS:
    return "cos";
  case F_TAN:
    return "tan";
  default:
    return "";
  }
}

/* Funzione ricorsiva per stampare un albero sintattico */
void print_tree_rec(node_t *root, int level) {
  for (int i = 0; i < level; i++)
    printf("\t");

  switch (root->token_type) {
  case IDENTIFIER:
    printf("%s: [%s]\n", token_to_string(root->token_type), root->text);
    break;
  case NUMBER:
    printf("%s: [%d]\n", token_to_string(root->token_type), root->value);
    break;

  case F_SIN:
  case F_COS:
  case F_TAN:
    printf("%s\n", token_to_string(root->token_type));
    print_tree_rec(root->left, level + 1);
    break;

  default:
    printf("%s\n", token_to_string(root->token_type));
    print_tree_rec(root->left, level + 1);
    print_tree_rec(root->right, level + 1);
    break;
  }
}

/* Stampa un albero sintattico */
void print_tree(node_t *root) { return print_tree_rec(root, 0); }

void free_tree(node_t *root) {
  if (root == NULL)
    return;

  switch (root->token_type) {
  case IDENTIFIER:
    free(root->text);
    break;
  case NUMBER:
    break;

  case F_SIN:
  case F_COS:
  case F_TAN:
  case OPAREN:
    free_tree(root->left);
    break;

  default:
    free_tree(root->left);
    free_tree(root->right);
    break;
  }

  free(root);
}
%}

// Modifichiamo YYTYPE:
// - `number` per NUMBER
// - `string` per IDENTIFIER
// - `*node` per puntare ad un nodo dell'albero sintattico
%union {
  int number;
  char *string;
  struct node_t *node;
}

// Il simbolo non terminale `exp` è di tipo puntatore a `struct node_t`
%type <node> exp

// Il terminale IDENTIFIER è di tipo stringa
%token <string> IDENTIFIER

// Il terminale NUMBER è di tipo intero
%token <number> NUMBER

%token OP_PLUS
%token OP_MINUS
%token OP_TIMES
%token OP_DIVIDE

%token OP_EXP

%token F_SIN
%token F_COS
%token F_TAN

%token OPAREN
%token CPAREN

// Tutti tranne OP_EXP associano a sinistra.
%left OP_PLUS OP_MINUS
%left OP_TIMES OP_DIVIDE  // Prodotto e divisione hanno priorità più alta di somma e sottrazione
%left F_SIN F_COS F_TAN
%right OP_EXP             // L'esponente ha priorità più alta

%%
input:
     | input line
;

line: '\n'             {}
    | exp '\n'         { print_tree($1); free_tree($1); }
;

exp: NUMBER            { $$ = new_number_node($1); }
   | IDENTIFIER        { $$ = new_identifier_node($1); }

   | exp OP_PLUS exp   { $$ = new_node(OP_PLUS, $1, $3); }
   | exp OP_MINUS exp  { $$ = new_node(OP_MINUS, $1, $3); }
   | exp OP_TIMES exp  { $$ = new_node(OP_TIMES, $1, $3); }
   | exp OP_DIVIDE exp { $$ = new_node(OP_DIVIDE, $1, $3); }

   | exp OP_EXP exp    { $$ = new_node(OP_EXP, $1, $3); }

   | F_SIN exp         { $$ = new_node(F_SIN, $2, NULL); }
   | F_COS exp         { $$ = new_node(F_COS, $2, NULL); }
   | F_TAN exp         { $$ = new_node(F_TAN, $2, NULL); }

   | OPAREN exp CPAREN { $$ = $2; /*$$ = new_node(OPAREN, $2, NULL);*/ }
;
```

#codly(
  languages: codly-languages,
  header: [es_3.l],
  lang-format: none,
  zebra-fill: none,
)
```c
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
```

#pagebreak()

== Esercizio 7

#codly(
  languages: codly-languages,
  header: [es_7.y],
  lang-format: none,
  zebra-fill: none,
)
```c
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

%left OP_PLUS OP_MINUS
%left OP_TIMES

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
```

#pagebreak()

#codly(
  languages: codly-languages,
  header: [es_7.l],
  lang-format: none,
  zebra-fill: none,
)
```c
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
```
