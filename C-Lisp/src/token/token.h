#ifndef TOKEN_H
#define TOKEN_H


#include "../helper/helper.h"


namespace Token {


enum Token {
    LPAREN,
    RPAREN,
    KEYWORD,
    BINARYOP,
    INTEGER,
    FLOAT,
    STRING,
    SYMBOL
};


struct TokenKind {
    Token kind;
    const char *val;
};


void is_keyword(char *ident, Helper::ResponseType resp);
char* token_to_text(Token token);


} // Token
#endif // TOKEN_H
