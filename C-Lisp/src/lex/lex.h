#ifndef LEX_H
#define LEX_H


#include <vector>
#include "../token/token.h"

namespace Lex {

void lex_input(
    const char *source,
    std::vector<Token::TokenKind> &output
);

} // Lex
#endif // LEX_H
