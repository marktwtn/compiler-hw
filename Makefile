all: scanner.l
	flex scanner.l
	gcc lex.yy.c

clean:
	rm lex.yy.c *.out
