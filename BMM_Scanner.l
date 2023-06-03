%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

%}

%%
"\n"        {printf("END_OF_LINE\n");return EOL;}
" "         {}

[0-9]+      { printf("INT(%s)\n", yytext);return INT;}

"."         {printf("DOT\n");return DOT;}
"+"         { printf("ADD_OP\n"); return ADD;}
"-"         { printf("SUB_OP\n"); return SUB;}
"*"         { printf("MUL_OP\n"); return MUL;}
"/"         { printf("DIV_OP\n"); return DIV;}
"^"         { printf("EXP_OP\n"); return EXP;}
"("         { printf("LEFT_PAREN\n"); return LEFT_PAREN;}
")"         { printf("RIGHT_PAREN\n"); return RIGHT_PAREN;}
"="         { printf("EQUAL_OP\n"); return EQUAL;}
"<>"        { printf("NOT_EQUAL_OP\n"); return INEQUAL;}
"<="        { printf("LESS_THAN_OR_EQUAL_OP\n"); return LESS_EQUAL_TO;}
">="        { printf("GREATER_THAN_OR_EQUAL_OP\n"); return GREATER_EQUAL_TO;}
"<"         { printf("LESS_THAN_OP\n"); return LESS;}
">"         { printf("GREATER_THAN_OP\n"); return GREATER;}
"AND"       { printf("AND_OP\n"); return AND;}
"OR"        { printf("OR_OP\n"); return OR;}
"NOT"       { printf("NOT_OP\n"); return NOT;}
"XOR"       { printf("XOR_OP\n"); return XOR;}
","         { printf("COMMA\n"); return COMMA;}
";"         { printf("SEMICOLON\n"); return SEMICOLON;}
":"         { printf("COLON\n"); return COLON;}
[A-Z][0-9]?\#         { printf("DOUBLE_TYPE\n"); return DOUBLEVAR;}
[A-Z][0-9]?\%         { printf("DOUBLE_TYPE\n"); return INTVAR;}
[A-Z][0-9]?\!         { printf("SINGLE_TYPE\n"); return SINGLEVAR;}
[A-Z][0-9]?\$     { printf("STRING_TYPE\n"); return STRINGVAR;}
\"([^\"\\\r\n]*(\\.[^\"\\\r\n]*)*)\"       {printf("STRING_LITERAL\n");return STRING;}
"LET"       { printf("LET\n"); return LET;}
"REM"       { printf("REM\n"); return REM;}
"STOP"     { printf("STOP\n"); return STOP;}
"PRINT"     { printf("PRINT\n"); return PRINT;}
"INPUT"     { printf("INPUT\n"); return INPUT;}
"IF"        { printf("IF\n"); return IF;}
"THEN"      { printf("THEN\n"); return THEN;}
"GOTO"      { printf("GOTO\n"); return GOTO;}
"GOSUB"     { printf("GOSUB\n"); return GOSUB;}
"RETURN"    { printf("RETURN\n"); return RETURN;}
"END"       { printf("END\n"); return END;}
"DATA"      { printf("DATA\n"); return DATA;}
"READ"      { printf("READ\n"); return READ;}
"DEF"       { printf("DEF\n"); return DEF;}
"DIM"       { printf("DIM\n"); return DIM;}
"FOR"       { printf("FOR\n"); return FOR;}
"TO"        { printf("TO\n"); return TO;}
"STEP"      { printf("STEP\n"); return STEP;}
"NEXT"      { printf("NEXT\n"); return NEXT;}
FN[A-Z]     { printf("Function\n"); return FUNCTION;}
[A-Z]       { printf("ID\n"); return ID;}
[A-Z]+      { printf("ID(%s)\n", yytext); return STR;}


%%

int yywrap()
{
    return 1; 
}
