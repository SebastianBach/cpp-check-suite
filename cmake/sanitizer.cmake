
# https://clang.llvm.org/docs/AddressSanitizer.html

option(ENABLE_ASAN "AddressSanitizer" OFF)

if(ENABLE_ASAN)
    message(STATUS "enable AddressSanitizer")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fno-omit-frame-pointer -g -O0")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address")
endif()

# https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html

option(ENABLE_UBSAN "UndefinedBehaviorSanitizer" OFF)

if(ENABLE_UBSAN)
    message(STATUS "enable UndefinedBehaviorSanitizer")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=undefined -g -O0 -fno-sanitize-recover")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=undefined")
endif()
