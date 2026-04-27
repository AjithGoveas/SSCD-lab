%{
#include <stdio.h>
#include <ctype.h>

int operand[10], op=0, opr=0, top=-1;
char operator[10], stack[10];
%}

%%

[0-9]+ {operand[op++] = atoi(yytext);}
"+" {operator[opr++] = '+';}
"-" {operator[opr++] = '-';}
"*" {operator[opr++] = '*';}
"/" {operator[opr++] = '/';}
"(" {stack[++top] = '(';}
")" { if(stack[top] == '(') stack[top--];}
"\n" {return 0;}

%%

int main() {
	printf("Enter the input: ");
	yylex();
	if((op == opr+1) && (top == -1)) {
		printf("Vaild\n");
		printf("Total no. of operands: %d\n", op);
		printf("The operands are: ");
		for(int i = 0; i < op; i++)
			printf("%d\t", operand[i]);
		printf("\n");
		printf("Total no. of operators: %d\n", opr);
		printf("The operators are: ");
		for(int i = 0; i < opr; i++)
			printf("%c\t", operator[i]);
		printf("\n");
	} else {
		printf("Invalid\n");
	}
	return 0;
}

int yywrap(void) {
	return 1;
}
