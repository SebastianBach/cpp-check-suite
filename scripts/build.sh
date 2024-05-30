echo "build"

cd ..

mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release   ..
cmake --build . -j 
ctest 
