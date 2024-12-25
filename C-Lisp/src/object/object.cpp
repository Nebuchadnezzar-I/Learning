#include "object.h"

namespace Obj {


std::shared_ptr<Object> create_list(const std::vector<std::shared_ptr<Object>>& list) {
    return std::make_shared<Object>(Object{ObjList, list});
}


std::shared_ptr<Object> create_keyword(const std::string& keyword) {
    return std::make_shared<Object>(Object{ObjKeyword, keyword});
}


std::shared_ptr<Object> create_binary_op(const std::string& op) {
    return std::make_shared<Object>(Object{ObjBinaryOp, op});
}


std::shared_ptr<Object> create_integer(int value) {
    return std::make_shared<Object>(Object{ObjInteger, value});
}


std::shared_ptr<Object> create_float(double value) {
    return std::make_shared<Object>(Object{ObjFloat, value});
}


std::shared_ptr<Object> create_string(const std::string& str) {
    return std::make_shared<Object>(Object{ObjString, str});
}


std::shared_ptr<Object> create_symbol(const std::string& symbol) {
    return std::make_shared<Object>(Object{ObjSymbol, symbol});
}


} // Obj
