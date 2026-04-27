%{
#include <stdio.h>
#include <stdlib.h>

int id=0, digit=0, key=0, op=0;

int yylex();
void yyerror(char *s);
int yywrap(void);
extern FILE *yyin;
%}
%token DIGIT ID KEY OP

%%

input:DIGIT input {digit++;}
|ID input {id++;}
|KEY input {key++;}
|OP input {op++;}
|DIGIT {digit++;}
|ID {id++;}
|KEY {key++;}
|OP {op++;}
;

%%

int main() {
	FILE *myFile = fopen("p5_input.c", "r");
	if(!myFile) {
		printf("File is not found!");
		return -1;
	}

	yyin = myFile;
	do {
		yyparse();
	} while(!feof(yyin));
	printf("Digits = %d\n", digit);
	printf("Keywords = %d\n", key);
	printf("Identifiers = %d\n", id);
	printf("Operators = %d\n", op);
	return 0;
}

void yyerror(char *s) {
	printf("Error\n");
	exit(-1);
}

int yywrap(void) {
	return 1;
}
