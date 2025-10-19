main: main.c lex.yy.c y.tab.h y.tab.c
	gcc main.c lex.yy.c -o $@

lex.yy.c: es_3.l y.tab.h
	flex es_3.l

y.tab.h: es_3.y
	yacc -d es_3.y
