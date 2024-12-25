#include "./lib.h"
#include "parser/parser.h"

int main() {
    say_hello();

    // const char* input = "(format t)";
    // std::vector<Token::TokenKind> comp_tokens;

    // Lex::lex_input(input, comp_tokens);

    std::vector<Token::TokenKind> expected_tokens {
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "+" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "1" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "2" },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
    };

    Parser::parse_list(expected_tokens);

    return 0;
}
