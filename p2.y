%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(char *s);
int yywrap(void);
%}
%token NUM
%left '+''-'
%left '*''/'

%%

input:exp {printf("Result = %d\n", $$); exit(0);};
exp:exp'+'exp {$$ = $1 + $3;}
|exp'-'exp {$$ = $1 - $3;}
|exp'*'exp {$$ = $1 * $3;}
|exp'/'exp {if($3 == 0) {
		printf("Divide by Zero Error\n");
		exit(0);
	    }
	    else $$ = $1 / $3;
	   }
|'('exp')' {$$ = $2;}
|NUM {$$ = $1;}
;

%%

int main() {
	printf("Enter an expression: ");
	yyparse();
	return 0;
}

void yyerror(char *s) {
	printf("Error\n");
	exit(-1);
}

int yywrap(void) {
	return 1;
}
