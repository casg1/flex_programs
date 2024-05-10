/******************************/
/* File: tiny.flex            */
/* Lex specification for TINY */
/******************************/

%{
#include "globals.h"
#include "util.h"
#include "scan.h"
#include "util.c"
/* lexeme of identifier or reserved word */
char tokenString[MAXTOKENLEN+1];
%}

digit       [0-9]
number      {digit}+
letter      [a-zA-Z]
identifier  {letter}+
newline     \n
whitespace  [ \t]+

/* This tells flex to read only one input file */
%option noyywrap

%%

"if"            {return IF;}
"else"          {return ELSE;}
"int"           {return INT;}
"return"        {return RETURN;}
"void"          {return VOID;}
"while"         {return WHILE;}
"="             {return EQ;}
"=="            {return ASSIGN;}
"<"             {return LT;}
">"             {return GT;}
"<="            {return LE;}
">="            {return GE;}
"|="            {return INEQ;}
"+"             {return PLUS;}
"-"             {return MINUS;}
"*"             {return TIMES;}
"/"             {return OVER;}
"("             {return LPAREN;}
")"             {return RPAREN;}
"["             {return LBRACK;}
"]"             {return RBRACK;}
"{"             {return LCBRACK;}
"}"             {return RCBRACK;}
";"             {return SEMI;}
","             {return COMMA;}
"*/"            {return ECOMM;}
{number}        {return NUM;}
{identifier}    {return ID;}
{newline}       {lineno++;}
{whitespace}    {/* skip whitespace */}
"/*"                   {
                          while (1) {
                              char c = input();
                              if (c == '*') {
                                  char next = input();
                                  if (next == '/') break; // End of multi-line comment
                                  unput(next); // Put back the character
                              }
                          }
                       }
.               {return ERROR;}

%%

TokenType getToken(void)
{ static int firstTime = TRUE;
  TokenType currentToken;
  if (firstTime)
  { firstTime = FALSE;
    lineno++;
    yyin = fopen("c-.txt", "r+");
    yyout = fopen("result.txt","w+");
listing = yyout;
  }
  currentToken = yylex();
  strncpy(tokenString,yytext,MAXTOKENLEN);

    fprintf(listing,"\t%d: ",lineno);
    printToken(currentToken,tokenString);

  return currentToken;
}

int main()
{
	printf("welcome to the flex scanner: ");
	while(getToken())
	{
		printf("a new token has been detected...\n");
	}
	return 1;
}

