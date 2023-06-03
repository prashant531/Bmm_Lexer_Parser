%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(char *);
extern char*yytext;
int count=0; 
%}



%token EOL END

%left ADD SUB MUL DIV EXP
%token DOT EXP LEFT_PAREN RIGHT_PAREN
%token EQUAL INEQUAL LESS GREATER LESS_EQUAL_TO GREATER_EQUAL_TO
%token AND OR NOT XOR
%token COMMA SEMICOLON COLON
%token DOUBLEVAR SINGLEVAR INTVAR STRINGVAR STRING
%token STOP RETURN REM GOTO IF THEN DIM DATA FOR GOSUB LET PRINT NEXT STEP TO READ INPUT DEF
%token FUNCTION ID STR
%token INT


%%

program:
    statements INT END EOL
    ;

statements:
    statement
    | statements statement
    ;

statement:
    INT type EOL    { count+=1;}
    ;

type:
    DATA data          {printf("data\n");}
    | DEF def        {printf("def\n");}
    | DIM dim       {printf("dim\n");}
    | FOR for       {printf("for\n");}
    | GOSUB INT        {printf("gosub\n");}
    | GOTO INT      {printf("goto\n");}
    | if         {printf("if\n");}
    | LET let       {printf("let\n");}
    | INPUT input   {printf("input\n");}
    | PRINT print   {printf("print\n");}
    | REM rem       {printf("rem\n");}
    | RETURN        {printf("return\n");}
    | STOP          {printf("stop\n");}              
    | NEXT next         {printf("next\n");}
    
    ;

rem:
    comment
    | rem comment    
    ; 

comment:    
    | ID
    | STR
    | STOP | RETURN | REM | GOTO | IF | THEN | DIM | DATA | FOR | GOSUB | LET | PRINT | NEXT | STEP | TO | READ | INPUT | DEF
    | END | ADD | SUB | MUL | DIV | EXP | DOT | EXP | LEFT_PAREN | RIGHT_PAREN | EQUAL 
    | INEQUAL | LESS | GREATER | LESS_EQUAL_TO | GREATER_EQUAL_TO | AND | OR | NOT | XOR
    | COMMA | SEMICOLON | COLON
    | DOUBLEVAR | SINGLEVAR | INTVAR | STRINGVAR | STRING
    | FUNCTION | ID | STR | INT | 
    ;
next:
    INT
    | ID
    ;
  
    

dim:
    declaration
    | dim COMMA declaration
    ;    

declaration:
    ID LEFT_PAREN maxsubscripts RIGHT_PAREN
    ;

maxsubscripts:
    expr	
    | INT
    | ID
    | maxsubscripts COMMA INT
    
    ;

def:
    FUNCTION EQUAL expr
    | FUNCTION LEFT_PAREN ID RIGHT_PAREN EQUAL expr
    ;

expr:
    term
    | expr ADD term
    | expr SUB term
    ;

term:
    factor
    | term MUL factor
    | term DIV factor
    ;

factor:
    power
    | factor EXP power
    ;

power:
    SUB INT
    | INT
    | INT DOT INT
    | ID
    | declaration
    | LEFT_PAREN expr RIGHT_PAREN
    ;


data:
    value
    | data COMMA value
    ;

value:
    INT
    | INT DOT INT    
    | STRING
    ;

if:
    IF conds THEN INT
    ;

conds:
    cond
    | conds AND cond
    | conds OR cond
    | conds NOT cond
    | conds XOR cond


cond:
    string relop string
    |  expr relop expr 
    ;

string:
    STRINGVAR
    | STRING
    ;

relop:
    EQUAL
    | INEQUAL
    | LESS
    | GREATER
    | LESS_EQUAL_TO
    | GREATER_EQUAL_TO
    ;
let:
    STRINGVAR EQUAL string
    | numvar EQUAL expr
    ;
numvar:
    ID
    | declaration 
    | DOUBLEVAR
    | INTVAR
    | SINGLEVAR
    ;

input:
    var
    | input COMMA var
    | 
    ;

var:
    INTVAR
    | declaration
    | SINGLEVAR
    | DOUBLEVAR
    | STRINGVAR
    | ID
    ;

print:
    expression delimiter print
    | expression delimiter
    | expression     
    ;

expression:
    expr
    | string
    ;

delimiter:
    COMMA
    | SEMICOLON
    ;

for:
    numvar EQUAL expr TO expr STEP expr
    | numvar EQUAL expr TO expr 
    ;

%%

int err=0;
void yyerror(char *msg) {    
 	err=1; 
        fprintf(stderr, "Error: at line no. %d\n",count+1);       
    
}

int main() {
    yyparse();
    if(err==0)
    {
    	printf("NO ERRORS\n"); 
    }
    return 0;
}
