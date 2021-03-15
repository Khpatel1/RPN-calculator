%option noyywrap

%{
#include <stdio.h>
#include <math.h>

#define YY_DECL int yylex()

#include "y.tab.h"

%}
digit		[0-9]
integer		{digit}+
real		({digit}+[.]{digit}*)|({digit}*[.]{digit}+)
exp		({integer}|{real})[eE]{integer}
exp2		({integer}|{real})[eE][+-]{integer}
exp3		[+-]({integer}|{real})[eE][+-]{integer}
integer2	[+-]({integer}|{real})

%%

[ \t]	; // ignore all whitespace
[0-9]+\.[0-9]+ 	{yylval.float_val = atof(yytext); return FLOAT;}
[0-9]+		{yylval.int_val = atoi(yytext); return INT;}
\n		{return NEWLINE;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"*"		{return MULTIPLY;}
"**"	{return POWER;}
"/"		{return DIVIDE;}
"("		{return LEFT;}
")"		{return RIGHT;}
"sin"	{return SIN;}
"cos"	{return COS;}
"tan"	{return TAN;}
{exp}		{yylval.float_val = atof(yytext); return FLOAT;}
{exp2}		{yylval.float_val = atof(yytext); return FLOAT;}
{exp3}		{yylval.float_val = atof(yytext); return FLOAT;}
{integer2}	{yylval.float_val = atof(yytext); return FLOAT;}
.		{fprintf(stderr, "Invalid character %s\n", yytext);}
%%