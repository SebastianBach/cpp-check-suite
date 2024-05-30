echo "ubsan"

cd ..

mkdir build
cd build


cmake -DENABLE_UBSAN=ON ..
cmake --build .
ctest --output-on-failure -VV

