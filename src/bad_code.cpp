#include <cstdlib>
#include <future>
#include <iostream>
#include <limits>
#include <string>

// CPPCHECK: arg should be reference
void print(std::string msg)
{
    std::cout << msg << "\n";
}

void print_cnt(int user_args)
{
    std::cout << "Number of args: " << user_args << "\n";
}

int main(int argc, const char* argv[])
{
    int user_args;

    bool many_args = argc - 1;

    if (many_args)
        print("Many args");

    if (argc < 2)
    {
        // TIDY, UBSAN: access uninitialized variable
        print_cnt(user_args);

        // FORMAT: using tabs
		print("no args given");
        return 1;
    }
    else
    {
        user_args = argc - 1;
        print_cnt(user_args);
        print("command line args given");
    }

    // TIDY: magic number
    unsigned int maxArgsToPrint = std::min(argc, 10);

    // WARNING: comparison of integers of different signedness
    for (unsigned int i = 1; i < maxArgsToPrint; ++i)
    {
        // ASAN, VALGRIND: memory leak
        auto* str = new std::string{argv[i]};

        print(*str);
    }

    if (argc > maxArgsToPrint)
        print("and some more...");
}
