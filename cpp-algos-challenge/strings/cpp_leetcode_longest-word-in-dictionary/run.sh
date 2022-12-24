mkdir -p ./bin;
g++-11 $1 -o ./bin/main -O3 -Wshadow -Wall -march=native;
./bin/main