%{
#include <stdio.h>
%}

%%
[0-9]+    { printf("Number: %s\n", yytext); }
[a-zA-Z]+ { printf("Word: %s\n", yytext); }
\n        { /* ignore newlines */ }
.         { printf("Unknown character: %s\n", yytext); }
%%

int main(void) {
    yylex();
    return 0;
}
