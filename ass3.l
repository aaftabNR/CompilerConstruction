%{
int count = 0;
%}

%%
[Aa][a-zA-Z]* { count++; printf("Matched word: %s\n", yytext); } // Matches words starting with 'A'
.|\n         ; // Ignore other characters
%%

int main() {
    yylex();
    printf("Total words starting with 'A': %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
