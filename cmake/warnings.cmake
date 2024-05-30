option(ENABLE_WARNINGS "Enable strict warnings." OFF)

if(ENABLE_WARNINGS)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        add_compile_options(-Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Wold-style-cast -Wunused -Wpedantic -Wconversion -Werror)
    endif()
endif()
