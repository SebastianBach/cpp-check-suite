option(USE_VALGRIND "Valgrind" OFF)

if(USE_VALGRIND)
    message(STATUS "Use Valgrind for testing")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
    set(MEMORYCHECK_COMMAND "/usr/bin/valgrind")
    set(MEMORYCHECK_COMMAND_OPTIONS "--leak-check=full --show-leak-kinds=all --track-origins=yes --error-exitcode=1 --log-file=/dev/stdout --suppressions=${PROJECT_SOURCE_DIR}/valgrind.supp")
    include(CTest)
endif()
