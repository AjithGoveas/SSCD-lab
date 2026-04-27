%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);
int yywrap(void);
%}
%token A B NL

%%

input:S NL {printf("Valid String\n"); exit(0);};
S:A S | B;

%%

void yyerror(char *s) {
	printf("Error\n");
	exit(-1);
}

int main() {
	printf("Enter an expression: ");
	yyparse();
	return 0;
}

int yywrap(void) {
	return 1;
}
