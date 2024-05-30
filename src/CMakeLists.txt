
add_executable(bad_code_app)

target_sources(bad_code_app PRIVATE bad_code.cpp)

add_test(NAME test_no_args COMMAND bad_code_app)
set_tests_properties(test_no_args PROPERTIES WILL_FAIL TRUE)

add_test(NAME test_args COMMAND bad_code_app "arg a" "arg b" "arg c")



option(ENABLE_CLANG_TIDY "CLANG-TIDY" OFF)

if(ENABLE_CLANG_TIDY)
    message(STATUS "Enable clang-tidy")
    set_target_properties(
        bad_code_app
        PROPERTIES
        CXX_CLANG_TIDY "clang-tidy"
    )
endif()

