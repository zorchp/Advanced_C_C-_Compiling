gcc -fPIC my_sin.c -shared -o libsin.so -lm

gcc runtime-dynamic-load.c

LD_LIBRARY_PATH=. ./a.out
