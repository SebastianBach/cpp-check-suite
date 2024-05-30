echo "full checks"

cd ..

if [ -d "build" ]; then
    rm -rf "build"
fi

echo -e "\n\n ---> Release:"
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release   ..
cmake --build . -j 
ctest -VV

cd ..
rm -rf build

mkdir build
cd build


echo -e "\n\n ---> WARNINGS:"
cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_WARNINGS=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
cmake --build . 


echo -e "\n\n ---> CPP CHECK:"
cppcheck --project=compile_commands.json --cppcheck-build-dir=./temp/cppcheck --error-exitcode=1 --enable=all

cd ..


echo -e "\n\n ---> CLANG FORMAT:"
clang-format --dry-run -Werror --style=file src/bad_code.cpp


echo -e "\n\n ---> CLANG TIDY:"

rm -rf build
mkdir build
cd build

cmake -DENABLE_CLANG_TIDY=ON ..
cmake --build . 


echo -e "\n\n ---> UBSAN:"

cd ..
rm -rf build
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_UBSAN=ON ..
cmake --build . -j 
ctest --output-on-failure

echo -e "\n\n ---> ASAN:"

cd ..
rm -rf build
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_ASAN=ON ..
cmake --build . -j 
ctest --output-on-failure



echo -e "\n\n --> VALGRIND:"

cd ..
rm -rf build
mkdir build
cd build

cmake  -DUSE_VALGRIND=ON  ..
cmake --build .
ctest -T memcheck --output-on-failure 


echo -e "\n\n --> Coverage:"

cd ..
rm -rf build
mkdir build
cd build

cmake -DENABLE_COVERAGE=ON ..
cmake --build . -j 
ctest 

cd ..
gcovr -r . --html --html-details -o build/coverage/coverage.html
