%{
#include <stdio.h>

%}

%start declare
%token TYPE VAR NUM

%%

declare: TYPE VAR '(' { printf("\ntest\n"); }
  ;

%%

int main(void){
  yyparse();
  return 0;
}

int yyerror(char *s){
  fprintf(stderr, "%s\n", s);
}
