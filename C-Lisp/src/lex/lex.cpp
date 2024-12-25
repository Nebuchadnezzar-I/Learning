#include "./lex.h"
#include <cctype>
#include <cstdint>
#include <cstring>
#include <iostream>

namespace Lex {

void lex_input(
    const char *source,
    std::vector<Token::TokenKind> &output
) {
    uint32_t cursor = 0;
    while (source[cursor] != '\0') {
        char ch = source[cursor];

        if (ch == ' ') {
            cursor++;
            continue;
        }

        if (isalpha(ch)) {
            int j = cursor;

            std::string ident;
            while (isalpha(source[j])) {
                ident += source[j];
                j++;
                cursor++;
            }

            output.push_back(Token::TokenKind {
                .kind = Token::SYMBOL,
                .val = ident.c_str()
            });

            cursor++;
            continue;
        }

        if (isdigit(ch)) {
            uint32_t j = cursor;

            std::string ident;
            while (isdigit(source[j])) {
                ident += source[j];
                j++;
                cursor++;
            }

            char* val = new char[ident.size() + 1];
            std::strcpy(val, ident.c_str());
            output.push_back(Token::TokenKind {
                .kind = Token::SYMBOL,
                .val = val
            });

            continue;
        }

        if (ch == '(') {
            output.push_back(Token::TokenKind {
                .kind = Token::LPAREN,
                .val = nullptr
            });

            cursor++;
            continue;
        }

        if (ch == ')') {
            output.push_back(Token::TokenKind {
                .kind = Token::RPAREN,
                .val = nullptr
            });

            cursor++;
            continue;
        }

        char* val = new char[2];
        val[0] = ch;
        val[1] = '\0';

        output.push_back(Token::TokenKind {
            .kind = Token::SYMBOL,
            .val = val
        });

        cursor++;
    }
}

}// Lex
