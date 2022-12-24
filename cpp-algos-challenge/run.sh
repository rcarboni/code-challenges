g++-11 $1 -o main -O3 -Wshadow -Wall -march=native -fsanitize=address;
./main < input.txt