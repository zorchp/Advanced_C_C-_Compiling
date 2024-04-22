## 控制符号可见性的方法之一

构建共享库:

```bash
gcc -fPIC -shared sharedLibExports.cc -o libshared.so
```

查看动态库的符号:

```bash
nm libshared.so -D

                 w __cxa_finalize@GLIBC_2.2.5
                 w __gmon_start__
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
                 U puts@GLIBC_2.2.5
0000000000001119 T _Z7myfunc1v
0000000000001133 T _Z7myfunc2v
000000000000114d T _Z7myfunc3v
0000000000001167 T _Z8printMsgv
```

> -D 表示 dynamic

加上控制符号可见性的选项之后, 动态库的符号不再可见:

```bash
gcc -fPIC -shared sharedLibExports.cc -o libshared.so -fvisibility=hidden -fvisibility-inlines-hidden
```

```bash
nm libshared.so -D

w __cxa_finalize@GLIBC_2.2.5
w __gmon_start__
w _ITM_deregisterTMCloneTable
w _ITM_registerTMCloneTable
U puts@GLIBC_2.2.5
```

## 方法二, 使用函数签名的修饰选项

```cc
#if 1
#define FOR_EXPORT __attribute__ ((visibility("hidden")))
#else
#define FOR_EXPORT
#endif

void FOR_EXPORT printMsg(){
    printf("running the function exported from the shared library\n");
}
```

```bash

                 w __cxa_finalize@GLIBC_2.2.5
                 w __gmon_start__
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
                 U puts@GLIBC_2.2.5
0000000000001119 T _Z7myfunc1v
0000000000001133 T _Z7myfunc2v
000000000000114d T _Z7myfunc3v
```

## 方法三, 使用编译控制宏
在 h 文件和 cc 文件都试过, 没用, 感觉是 pragma 的问题. 

```cc
#pragma visibility push(hidden)
void myfunc1();
#pragma visibility pop
```
