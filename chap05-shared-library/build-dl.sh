gcc -fPIC my_sin.c -shared -o libsin.dylib

gcc runtime-dynamic-load.c

./a.out
