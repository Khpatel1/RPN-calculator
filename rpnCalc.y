%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	int int_val;
	float float_val;
}

%token<int_val> INT
%token<float_val> FLOAT
%token PLUS MINUS MULTIPLY POWER DIVIDE LEFT RIGHT SIN COS TAN
%token NEWLINE
%left PLUS MINUS
%left MULTIPLY DIVIDE


%type<int_val> exp
%type<float_val> float_exp

%start start

%%

start: 
	   | start line
;

line: NEWLINE
    | float_exp NEWLINE { printf("Result: %g\n", $1);}
    | exp NEWLINE { printf("Result: %i\n", $1); } 
    
;

float_exp: FLOAT                 		 { $$ = $1; }
	  | float_exp float_exp PLUS	 	 { $$ = $1 + $2; }
	  | float_exp float_exp MINUS	 	 { $$ = $1 - $2; }
	  | float_exp float_exp MULTIPLY	 { $$ = $1 * $2; }
	  | float_exp float_exp DIVIDE	 { $$ = $1 / $2; }
	  | LEFT float_exp RIGHT		 { $$ = $2; }
	  | exp float_exp PLUS	 	 { $$ = $1 + $2; }
	  | exp float_exp MINUS		 { $$ = $1 - $2; }
	  | exp float_exp MULTIPLY		 { $$ = $1 * $2; }

	  | exp float_exp DIVIDE		 { $$ = $1 / $2; }
	  | float_exp exp PLUS	 	 { $$ = $1 + $2; }
	  | float_exp exp MINUS 		 { $$ = $1 - $2; }
	  | float_exp exp MULTIPLY		 { $$ = $1 * $2; }
	  | float_exp exp POWER			{ $$ = pow($1, $2); }
	  | float_exp exp DIVIDE	 	 { $$ = $1 / $2; }
	  | exp exp DIVIDE			 { $$ = $1 / (float)$2; }
	  | float_exp SIN	 	 { $$ = sin($1); }
	  | float_exp COS	 	 { $$ = cos($1); }
	  | float_exp TAN	 	 { $$ = tan($1); }	  
	  | exp exp float_exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | exp float_exp exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | exp float_exp float_exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | float_exp exp exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | float_exp exp float_exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | float_exp float_exp exp MULTIPLY		 { $$ = $1 * $2 * $3; }
	  | float_exp float_exp float_exp MULTIPLY		 { $$ = $1 * $2 * $3; }
;

exp: INT				{ $$ = $1; }
	  | exp exp PLUS		{ $$ = $1 + $2; }
	  | exp exp MINUS		{ $$ = $1 - $2; }
	  | exp exp MULTIPLY		{ $$ = $1 * $2; }
	  | exp exp exp MULTIPLY		{ $$ = $1 * $2 * $3; }
	  | exp exp POWER		{ $$ = pow($1, $2); }
	  | LEFT exp RIGHT		{ $$ = $2; }
	  | exp SIN		{$$ = sin($1);}
	  | exp COS		{$$ = cos($1);}
	  | exp TAN		{$$ = tan($1);}	  
;


%%

int main() {
   char startmessage[] = "\tTOKEN IDS:";
   char input_mssg[] = "Enter problem:";
   printf("%s\n", startmessage);
   
    printf(" int: \t\t%2d\n", INT);
    printf(" float: \t%2d\n", FLOAT);
    printf(" '+': \t\t%2d\n", PLUS);
    printf(" '-': \t\t%2d\n", MINUS);
    printf(" '*': \t\t%2d\n", MULTIPLY);
	printf(" '**': \t\t%2d\n", POWER);
    printf(" '/': \t\t%2d\n", DIVIDE);
	printf(" '(': \t\t%2d\n", LEFT);
	printf(" ')' \t\t%2d\n", RIGHT);
	printf(" sin: \t\t%2d\n", SIN);
	printf(" cos: \t\t%2d\n", COS);
	printf(" tan: \t\t%2d\n", TAN);
	printf(" enter: \t%2d\n", NEWLINE);
	printf("-------------------------\n");
	printf("%s\n", input_mssg);
	
	yyin = stdin;

	do { 
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	
	;
}
