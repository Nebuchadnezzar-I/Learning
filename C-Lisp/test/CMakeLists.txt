add_executable(test_runner
    test.cpp
)

target_link_libraries(test_runner
    c_lisp_lib
    GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(test_runner)
