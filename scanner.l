%{
int yyecho();
%}

/* If the rule section does not scan '\n',
   then yylineno will remain the same.*/
%option yylineno

%x COMMENT_S
%x COMMENT_M

letter [a-zA-Z]
digit  [0-9]

%%

[ \t]*"//"      { BEGIN COMMENT_S; }
[ \t]*"/*"      { BEGIN COMMENT_M; }
<COMMENT_S>"\n" { BEGIN 0; }
<COMMENT_S>.    {;}
<COMMENT_M>"*/" { BEGIN 0; }
<COMMENT_M>.    {;}

\n { ; }
[ \t]+ { ; }
# { yyecho(); }
include { yyecho(); }
{letter}+\.h { yyecho(); }
char |
int |
short |
long |
float |
double |
void { yyecho(); }
return { yyecho(); }
"+" |
"-" |
"*" |
"/" |
"=" |
";" |
"(" |
")" |
"{" |
"}" |
"," |
"'" |
"<" |
">" { yyecho(); }
[[:alpha:]]* { yyecho(); }
0 |
[1-9]{digit}* { yyecho(); }
. { printf("Scanner did not scan this character.\n");
    yyecho(); }

%%

// yylex() is the function of lexical analyzer.
int main(void){
  yylex();
  return 0;
}

// 'return 1' means the input is ended.
int yywrap(){
  return 1;
}

// I define this function for easier code reading.
int yyecho(){
  printf("%-3d : ", yylineno);
  printf("%s", yytext); // It can be replaced by 'ECHO;'.
  printf("\n");
}
