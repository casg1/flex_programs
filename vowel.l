%{
#include <stdio.h>
%}

DIGIT [0-9]
LETTER [a-zA-Z]
IDENTIFIER {LETTER}({LETTER}|{DIGIT})*
CONSTANT {DIGIT}+
WS [ \t\n]

%%
{WS}+        /* Ignore whitespace */

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"  { printf("\n %s is a Keyword", yytext); }
{IDENTIFIER} { printf("\n %s is an Identifier", yytext); }
{CONSTANT}   { printf("\n %s is a Constant", yytext); }
"+"          { printf("\n%s is an Operator", yytext); }
"-"          { printf("\n%s is an Operator", yytext); }
"*"          { printf("\n%s is an Operator", yytext); }
"/"          { printf("\n%s is an Operator", yytext); }
"("          { printf("\n%s is a Left Parenthesis", yytext); }
")"          { printf("\n%s is a Right Parenthesis", yytext); }
"{"          { printf("\n%s is a Left Brace", yytext); }
"}"          { printf("\n%s is a Right Brace", yytext); }
";"          { printf("\n%s is a Semicolon", yytext); }
","          { printf("\n%s is a Comma", yytext); }
"."          { printf("\n%s is a Dot", yytext); }
"="          { printf("\n%s is an Assignment Operator", yytext); }
"&"          { printf("\n%s is an Address Operator", yytext); }
"^"          { printf("\n%s is a Bitwise XOR Operator", yytext); }
"%"          { printf("\n%s is a Modulus Operator", yytext); }
"$"          { printf("\n%s is a Dollar Sign", yytext); }
"#"          { printf("\n%s is a Hash", yytext); }
"@"          { printf("\n%s is an At Sign", yytext); }
"!"          { printf("\n%s is a Logical NOT Operator", yytext); }
":"          { printf("\n%s is a Colon", yytext); }
"|"          { printf("\n%s is a Bitwise OR Operator", yytext); }
"<"          { printf("\n%s is a Less Than Operator", yytext); }
">"          { printf("\n%s is a Greater Than Operator", yytext); }
"?"          { printf("\n%s is a Question Mark", yytext); }
"++"         { printf("\n%s is an Increment Operator", yytext); }
"--"         { printf("\n%s is a Decrement Operator", yytext); }
"=="         { printf("\n%s is an Equal To Operator", yytext); }
"!="         { printf("\n%s is a Not Equal To Operator", yytext); }
"<="         { printf("\n%s is a Less Than or Equal To Operator", yytext); }
">="         { printf("\n%s is a Greater Than or Equal To Operator", yytext); }
"&&"         { printf("\n%s is a Logical AND Operator", yytext); }
"||"         { printf("\n%s is a Logical OR Operator", yytext); }
"<<="        { printf("\n%s is a Left Shift Assignment Operator", yytext); }
">>="        { printf("\n%s is a Right Shift Assignment Operator", yytext); }
"+="         { printf("\n%s is a Plus Assignment Operator", yytext); }
"-="         { printf("\n%s is a Minus Assignment Operator", yytext); }
"*="         { printf("\n%s is a Multiply Assignment Operator", yytext); }
"/="         { printf("\n%s is a Divide Assignment Operator", yytext); }
"%"          { printf("\n%s is a Modulo Assignment Operator", yytext); }
"^="         { printf("\n%s is a Bitwise XOR Assignment Operator", yytext); }
"&="         { printf("\n%s is a Bitwise AND Assignment Operator", yytext); }
"|="         { printf("\n%s is a Bitwise OR Assignment Operator", yytext); }
"<<"         { printf("\n%s is a Left Shift Operator", yytext); }
">>"         { printf("\n%s is a Right Shift Operator", yytext); }
[ \t\n]      /* Ignore whitespace */
.            { printf("\n%s is an Unknown Token", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1; // Indicates we're finished with the input
}