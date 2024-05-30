option(ENABLE_COVERAGE "Coverage" OFF)

if(ENABLE_COVERAGE)
    message(STATUS "enable coverage")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage -fprofile-arcs -ftest-coverage")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage -fprofile-arcs -ftest-coverage")
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/coverage)
endif()
