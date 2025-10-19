main: main.c lex.yy.c y.tab.h y.tab.c
	gcc main.c lex.yy.c -o $@

lex.yy.c: es_7.l y.tab.h
	flex es_7.l

y.tab.h: es_7.y
	yacc -d es_7.y
