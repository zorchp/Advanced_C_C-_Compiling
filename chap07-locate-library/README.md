## 命名规则

### 静态库

```c
lib + <library name> + .a
```

### 动态库

```c
lib + <library name> + .so + <library version information>
```

其中, 版本信息为:

```c
<M>.<m>.<p>
M: 主版本号major
m: 次版本号minor
p: 修订版本号patch
```

动态库的 soname(别名)

```c
lib + <library name> + .so + <library major version digit(s)>
```

通过指定的链接器选项将 soname 字符串写入 so 库中.

```bash
$ gcc -shared my_sin.o -Wl,-soname,libsin.so.1 -o libsin.so.1.1.1
$ readelf -d libsin.so.1.1.1

Dynamic section at offset 0x2e50 contains 21 entries:
  Tag        Type                         Name/Value
 0x000000000000000e (SONAME)             Library soname: [libsin.so.1]
 0x000000000000000c (INIT)               0x1000
```

## 定位规则

通过 `-L` 和 `-l` 构建过程中库文件的路径

- -L 仅在装载时候有用, 目录路径添加到-L 链接器选项的后面, 并传递给链接器
- -l 在装载和运行阶段都起作用 将库文件名(链接器名称) 添加到-l 参数后面, 并传递给链接器

例子:

```bash
gcc -shared my_sin.o  -o libsin.so -lm
gcc main.c -L./  -lsin
LD_LIBRARY_PATH=. ./a.out
```

定位顺序首先是预加载库:
LD_PRELOAD 环境变量, 或者采用文件 `/etc/ld.so.preload`
然后是 rpath 或者 runpath
然后是 LD_LIBRARY_PATH,
然后是 ldconfig 缓存, 位置在 `/etc/ld.so.cache`

```bash
$ strings /etc/ld.so.cache
```

最后是默认的库文件:

- `/lib`
- `/usr/lib/`

注意没有`/usr/local/lib`

注意最好使用-L 和-l 来链接库文件, 而不是直接写死(不管是相对路径还是绝对路径)
这样只要在工作目录下执行, 就都能找到对应的so 库, 看下面的两种例子:

```bash
$ ldd demoMinusL
	linux-gate.so.1 (0xf7f91000)
	libdynamiclinkingdemo.so => ./deploy/libdynamiclinkingdemo.so (0xf7f88000)
	libc.so.6 => /lib32/libc.so.6 (0xf7d4d000)
	/lib/ld-linux.so.2 (0xf7f93000)

$ ldd demoNoMinusL
	linux-gate.so.1 (0xf7faa000)
	../deploy/libdynamiclinkingdemo.so => not found
	libc.so.6 => /lib32/libc.so.6 (0xf7d69000)
	/lib/ld-linux.so.2 (0xf7fac000)
```
