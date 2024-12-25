#include "gtest/gtest.h"
#include <cstdint>
#include <gtest/gtest.h>
#include "../src/lex/lex.h"

TEST(LexerTest, SimpleTokens) {
    const char* input = "(+ 1 2)";
    std::vector<Token::TokenKind> comp_tokens;
    Lex::lex_input(input, comp_tokens);

    std::vector<Token::TokenKind> expected_tokens {
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "+" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "1" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "2" },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
    };

    uint8_t idx = 0;
    for (Token::TokenKind &current_token : expected_tokens) {
        if (
            current_token.kind != comp_tokens[idx].kind ||
            current_token.val != comp_tokens[idx].val
        ) {
            testing::AssertionFailure();
        }

        idx++;
    }

    testing::AssertionSuccess();
}

TEST(LexerTest, ComplexSyntax) {
    const char* input = "((define r 10)(define pi 314)-(* pi (* r r)))";
    std::vector<Token::TokenKind> comp_tokens;
    Lex::lex_input(input, comp_tokens);

    std::vector<Token::TokenKind> expected_tokens {
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "define" },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "r" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "10" },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "define" },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "pi" },
        Token::TokenKind { .kind = Token::INTEGER, .val = "314" },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "*" },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "pi" },
        Token::TokenKind { .kind = Token::LPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "*" },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "r" },
        Token::TokenKind { .kind = Token::SYMBOL, .val = "r" },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
        Token::TokenKind { .kind = Token::RPAREN, .val = nullptr },
    };

    uint8_t idx = 0;
    for (Token::TokenKind &current_token : expected_tokens) {
        if (
            current_token.kind != comp_tokens[idx].kind ||
            current_token.val != comp_tokens[idx].val
        ) {
            testing::AssertionFailure();
        }

        idx++;
    }

    testing::AssertionSuccess();
}
