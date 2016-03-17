.PHONY: all clean

all: scanner.l
	flex scanner.l
	gcc lex.yy.c

clean:
	rm -f lex.yy.c *.out
