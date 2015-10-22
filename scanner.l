%{
int lineNum=0;
%}

%%

\n {lineNum++;printf("\n");}
# { ECHO; }
include { ECHO; }
\<[a-zA-Z]*/.h\> { ECHO; }
char|int|short|long|float|double|void { ECHO; }
return { ECHO; }

%%

int main(void){
  yylex();
}

int yywrap(){
  return 1;
}
