gcc -fPIC my_sin.c -shared -o libsin.so -lm

gcc main.c libsin.so -o a.out

LD_LIBRARY_PATH=. ./a.out
