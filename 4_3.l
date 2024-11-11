%{
#include <ctype.h>
FILE *output;
%}

%%
[A-Z] { fputc(tolower(*yytext), output); } // Convert uppercase to lowercase
[a-z] { fputc(toupper(*yytext), output); } // Convert lowercase to uppercase
.     { fputc(*yytext, output); }          // Write non-alphabetic characters as is
\n    { fputc('\n', output); }
%%

int main() {
    FILE *input = fopen("input.txt", "r");
    output = fopen("output.txt", "w");

    if (input == NULL || output == NULL) {
        printf("Error opening file.\n");
        return 1;
    }

    yyin = input; // Redirect Lex to read from input file
    yylex();

    fclose(input);
    fclose(output);

    printf("Case conversion completed. Check 'output.txt' for results.\n");
    return 0;
}

int yywrap() {
    return 1;
}
