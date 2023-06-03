# Bmm_Lexer_Parser

## Summary
This project aims to build a compiler for a simple programming language called B--. It utilizes Flex and Bison to create a lexical analyzer and syntax analyzer capable of recognizing B-- source code. The compiler provides helpful error messages for identifying syntax errors in B-- sample code.

## File Structure
```
.
├── README.md
├── bmm_parser.y
├── bmm_scanner.l
├── correct_sample.bmm
├── incorrect_sample.bmm
```

## Prerequisites

Download

- [Bison](https://www.gnu.org/software/bison/)
- [Flex](https://github.com/westes/flex)
- [Make](https://www.gnu.org/software/software.html)

## Assumptions
- \n is not considered as a space but as a character
- all other assumptions are intuitive

## How to run ?
- Enter following commands into terminal
    ```
    lex BMM_Scanner.l
    yacc -d BMM_Parser.y
    cc lex.yy.c y.tab.c -o Compiler    
    ./.Compiler<CorrectSample.bmm
    ./.Compiler<IncorrectSample.bmm
    ```


# BMM_Scanner.l
- Tokenized all the variable names, keywords, special characters and numbers.
- It will print all the tokens in the terminal in the the orser scanned.

# BMM_Parser.y
- This program contains the BNF grammar rules for the compiler.
- If there is any error in syntax it will stop parsing after prompting error message "Syntax Error".
- If there is no syntax error all the scanning and parsing will be printed in terminal and Success message will be prompted in the end.

# CorrectSample.bmm
- Contains correct code free from any kind of syntax errors.

# IncorrectSample.bmm
- Contains synatx error in line 180 (conatins PRIN instead of PRINT)

## Authors
- Prashant Singh (@prashant531)
- Aditya Patil (@Nerditya)