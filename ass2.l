
%{
    int c=0,k=0,l=0,i=0,s=0;
%}


alpha [a-zA-Z]
digit [0-9]
comment "//".*
keyword (if|else|for|while|switch|case|break|continue|return|int|float|double|string|boolean)
identifier {alpha}({alpha}|{digit})*
line \n
space [ ]

%%

{comment} {c++;}
{keyword} {k++;}
{identifier} {i++;}
{line} {l++;}
{space} {s++;}
. ;

%%

int yywrap(){
    return 1;
}

int main(int argc, char *argv[]){
    
    yylex();
    if(l>0){
        l+=1;
    }
    printf("Comments: %d\n",c);
    printf("Keywords: %d\n",k);
    printf("Identifiers: %d\n",i);
    printf("Lines: %d\n",l);
    printf("Spaces: %d\n",s);
    printf("Words: %d\n",i+k+c);

    return 0;   
}
