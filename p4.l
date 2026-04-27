%{
#include <stdio.h>
#include <stdlib.h>

int comment = 0;
int state = 1;
int yywrap(void);
%}

%%

"//".*\n {comment++;}
"/*" {state = 0;}
"*/" {if(state == 0)
	comment++;
      state = 1;
     }
.|\n {if(state == 1)
	fprintf(yyout, "%s", yytext);
     }

%%

int main() {
	char inpfile[500], outfile[500];
	printf("Enter input file name: ");
	scanf("%s", inpfile);
	printf("Enter output file name: ");
	scanf("%s", outfile);
	yyin = fopen(inpfile, "r");
	yyout = fopen(outfile, "w");
	yylex();
	printf("Total no. of comment lines is: %d\n", comment);
	return 0;
}

int yywrap(void) {
	return 1;
}
