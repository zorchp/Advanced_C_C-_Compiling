获取预处理之后的结果, 写入 function.i 文件:

```bash
gcc -E -P function.c -o function.i
```

汇编阶段:

```bash
gcc -S function.c -o function-arm.s
```

使用交叉编译生成 Intel 架构的汇编代码:(32bits)

```bash
x86_64-elf-gcc -S -masm=att -m32 function.c -o function-x86-att.s
```

编译成目标obj文件

```bash
x86_64-elf-gcc -c -m32 function.c
```

查看反汇编

```bash
objdump -D function.o -M intel
```
