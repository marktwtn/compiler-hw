all: scanner.l
	flex scanner.l
	gcc lex.yy.c
