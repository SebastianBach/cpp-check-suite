echo "asan"

cd ..

mkdir build
cd build

cmake -DENABLE_ASAN=ON ..
cmake --build . 
ctest --output-on-failure

