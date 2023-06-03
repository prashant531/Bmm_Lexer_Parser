# Team Members
- Aditya Dinesh Patil 2021CSB1062
- Prashant Singh 2021CSB1124

# BMM_Scanner.l
# BMM_Parser.y
# CorrectSample.bmm
# IncorrectSample.bmm

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