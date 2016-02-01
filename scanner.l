%{
int lineNum=1;
%}

%%

\n { lineNum++; }
[ \t] ;
# { printf("%d : ",lineNum);
    ECHO;
    printf("\n"); }
include { printf("%d : ",lineNum);
          ECHO;
          printf("\n"); }
\<[a-zA-Z]*\.h\> { printf("%d : ",lineNum);
                   ECHO;
                   printf("\n"); }
char|int|short|long|float|double|void { printf("%d : ",lineNum);
                                        ECHO;
                                        printf("\n"); }
return { printf("%d : ",lineNum);
         ECHO;
         printf("\n"); }

%%

int main(void){
  yylex();
}

int yywrap(){
  return 1;
}
