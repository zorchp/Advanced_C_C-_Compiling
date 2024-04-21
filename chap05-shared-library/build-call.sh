gcc -fPIC my_sin.c -shared -o libsin.dylib

gcc main.c -L./ -o a.out

./a.out
