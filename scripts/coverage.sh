echo "coverage"

cd ..

mkdir build
cd build

cmake -DENABLE_COVERAGE=ON ..
cmake --build . -j 
ctest 

cd ..
gcovr -r . --html --html-details -o build/coverage/coverage.html