#ifndef OBJECT_H
#define OBJECT_H


#include <memory>
#include <string>
#include <variant>
#include <vector>
#include "../token/token.h"


namespace Obj {


enum ObjectType {
    ObjList,
    ObjKeyword,
    ObjBinaryOp,
    ObjInteger,
    ObjFloat,
    ObjString,
    ObjSymbol
};


struct Object {
    ObjectType type;
    std::variant<std::string, int, double, std::vector<std::shared_ptr<Object>>> data;
};


std::shared_ptr<Object> create_list(const std::vector<std::shared_ptr<Object>>& list);
std::shared_ptr<Object> create_keyword(const std::string& keyword);
std::shared_ptr<Object> create_binary_op(const std::string& op);
std::shared_ptr<Object> create_integer(int value);
std::shared_ptr<Object> create_float(double value);
std::shared_ptr<Object> create_string(const std::string& str);
std::shared_ptr<Object> create_symbol(const std::string& symbol);


} // Object
#endif // OBJECT_H
