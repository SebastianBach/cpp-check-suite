echo "valgrind"


cd ..

mkdir build
cd build


cmake  -DUSE_VALGRIND=ON  ..
cmake --build .
ctest -T memcheck --output-on-failure
