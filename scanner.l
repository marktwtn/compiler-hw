%{

%}

%%

char|int|short|long|float|double|void { printf("\nData type\n"); }
return { printf("\nReturn token\n"); }

%%

int main(void){
  yylex();
}

int yywrap(){
  return 1;
}
