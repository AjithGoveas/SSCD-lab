%{
#include "p5.tab.h"

extern int yylval;
%}

%%

[\+\-\*\/=] {
		printf("Operator is %s\n", yytext);
		return OP;
	    }
[0-9]+	    {
		yylval = atoi(yytext);
		printf("Digit is %d\n", yylval);
		return DIGIT;
	    }
"void"|"int"|"char"|"bool"|"float"|"for"|"do"|"while"|"if"|"else"|"return"|"main"|"printf"|"#include<".*">" {
		printf("Keyword is %s\n", yytext);
		return KEY;
	    }
[a-zA-Z_][a-zA-Z0-9_]* {
		printf("Identifier is %s\n", yytext);
		return ID;
	    }
. ;

%%
