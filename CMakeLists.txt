cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project(bad_code CXX)
enable_testing()


include(cmake/warnings.cmake)
include(cmake/sanitizer.cmake)
include(cmake/coverage.cmake)
include(cmake/valgrind.cmake)

add_subdirectory(src)
