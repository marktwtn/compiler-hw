%{
int yyecho();

int lineNum=1;
%}

%x COMMENT_S
%x COMMENT_M

letter [a-zA-Z]
digit  [0-9]

%%

[ \t]*"//" { BEGIN COMMENT_S; }
[ \t]*"/*" { BEGIN COMMENT_M; }
<COMMENT_S>\n { BEGIN 0; }
<COMMENT_S>. {;}
<COMMENT_M>"*/" { BEGIN 0; }
<COMMENT_M>. {;}

\n { lineNum++; }
[ \t]+ ;
# { yyecho(); }
include { yyecho(); }
{letter}+\.h { yyecho(); }
char|int|short|long|float|double|void { yyecho(); }
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
[<] |
[>] { yyecho(); }
[[:alpha:]]* { yyecho(); }
0 |
[1-9]{digit}* { yyecho(); }
. { printf("Scanner did not scan this\n");
    yyecho(); }

%%

// yylex() is the function of lexical analyzer.
int main(void){
  yylex();
}

// 'return 1' means the input is ended.
int yywrap(){
  return 1;
}

// I define this function for easier code reading.
int yyecho(){
  printf("%-3d : ",lineNum);
  printf("%s",yytext); // In the rule section, it can be replaced by 'ECHO;'.
  printf("\n");
}
