%{

%}

%%

char|int|short|long|float|double|void { printf("\nData type\n"); }

%%

int main(void){
  yylex();
}

int yywrap(){
  return 1;
}
