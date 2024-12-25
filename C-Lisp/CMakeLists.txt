cmake_minimum_required(VERSION 3.14)
project(c_lisp)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(c_lisp_lib
    src/lib.cpp
    src/lex/lex.cpp
    src/token/token.cpp
    src/helper/helper.cpp
    src/object/object.cpp
    src/parser/parser.cpp
)

add_executable(c_lisp_app
    src/main.cpp
)
target_link_libraries(c_lisp_app
    c_lisp_lib
)

# Include GoogleTest for testing
include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
FetchContent_MakeAvailable(googletest)

# Enable testing
enable_testing()

# Add the test directory
add_subdirectory(test)
