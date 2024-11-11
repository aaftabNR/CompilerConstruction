%{
int count = 0;
%}

%%
[aA][a-zA-Z]*[aA] { count++; printf("Matched word: %s\n", yytext); } // Matches words starting and ending with 'a'/'A'
.|\n                ; // Ignore other characters
%%

int main() {
    yylex();
    printf("Total words beginning and ending with 'a': %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
