
%{
    extern FILE *yyin;
%}

lower [a-z]
upper [A-Z]
space [ s]

%%

{lower} {printf("%c", yytext[0] - 32);}
{upper} {printf("%c", yytext[0] + 32);}
{space} {printf(" ");}
. ;

%%

int yywrap(){
    return 1;
}

int main(int argc, char *argv[]){
    FILE *fp = fopen(argv[1],"r+");
    yyin = fp;

    yylex();

    fclose(fp);
    return 0;
}
    