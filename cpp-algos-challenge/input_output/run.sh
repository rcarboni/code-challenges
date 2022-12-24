g++-11 $1 -o cin_cout -O3 -Wshadow -Wall -march=native -fsanitize=address;
./cin_cout < input.txt