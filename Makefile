.PHONY: all clean

all: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c

lex.yy.c: scanner.l
	flex scanner.l

y.tab.c: parser.y
	byacc -d parser.y

clean:
	rm -f lex.yy.c y.tab.* *.out
