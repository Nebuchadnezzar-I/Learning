#include "./token.h"

namespace Token {

void is_keyword(char *ident, Helper::ResponseType resp) {

}

char* token_to_text(Token token) {
    switch (token) {
        case Token::INTEGER: return "INTIGER";
        case Token::SYMBOL: return "SYMBOL";
        case Token::LPAREN: return "LPAREN";
        case Token::RPAREN: return "RPAREN";
        default: return "ILLEGAL";
    }
}

}// Token
