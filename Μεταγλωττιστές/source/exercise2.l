%{
#include <stdio.h>
#include <string.h>

void validate(char* type, char* name, int expected) {
    if (strlen(name) != expected) {
        printf("ΑΠΟΡΡΙΨΗ: Το '%s' πρέπει να έχει %d γράμματα, αλλά έχει %ld.\n", type, expected, strlen(name));
        return;
    }

    for (int i = 0; i < strlen(name); i++) {
        for (int j = i + 1; j < strlen(name); j++) {
            if (name[i] == name[j]) {
                printf("ΑΠΟΡΡΙΨΗ: Το όνομα '%s' έχει διπλότυπα γράμματα.\n", name);
                return;
            }
        }
    }

    printf("ΑΠΟΔΟΧΗ: %s %s\n", type, name);
}
%}

%%

"σημείο "[A-Z]+      { validate("σημείο", yytext + 13, 1); }
"ευθεία "[A-Z]+      { validate("ευθεία", yytext + 13, 2); }
"τρίγωνο "[A-Z]+     { validate("τρίγωνο", yytext + 15, 3); }
"τετράγωνο "[A-Z]+   { validate("τετράγωνο", yytext + 19, 4); }
"πεντάγωνο "[A-Z]+   { validate("πεντάγωνο", yytext + 19, 5); }
"εξάγωνο "[A-Z]+     { validate("εξάγωνο", yytext + 15, 6); }
"επτάγωνο "[A-Z]+    { validate("επτάγωνο", yytext + 17, 7); }
"οκτάγωνο "[A-Z]+    { validate("οκτάγωνο", yytext + 17, 8); }

[ \t\n]+
.                   { printf("ΣΦΑΛΜΑ: Μη έγκυρη δομή ή λέξη '%s'\n", yytext); }

%%

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}