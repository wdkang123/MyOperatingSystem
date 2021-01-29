# 在mac下通过交叉编译：C语言结合汇编

# 1.安装

因为mac和linux不一样 在mac的gcc和ld等工具 不能够通用

这个时候我们就需要安装交叉编译的环境

下面我提供了两种方式（踩过坑）：

（1）brew （再之前系统时正常安装）

（2）port （在我升级了 BigSur 后）之前通过brew安装的在新系统失效了 所以我用port成功安装

理论山来说 brew 和 port 都是管理工具 安装也没有什么大的区别 看个人喜好了

brew 和 port的安装 我就不说了 自己下载后安装好就OK



# 1.1 方法一 brew 安装

（更新brew是必须的）如果你是比较新的系统的话

```
brew install i386-elf-binutils
brew install i386-elf-gcc
```



# 1.2 方法二 port 安装

```
port search i386-elf-gcc
sudo port install i386-elf-gcc
```



# 2.编译

## 整体思路

整体思路就是

（1）汇编写的部分 我们通过 nasm 将汇编代码进行编译

（2） C语言的部分 我们通过gcc编译 并对其链接

（3） 将gcc生成的文件进行反汇编 就得到了汇编代码

（4）将（1）的汇编代码 和（3）反汇编后的代码进行结合

（5）将这个汇编文件进行编译 成可执行文件

## 编译

`nasm -f elf32 -o foo.o foo.asm`

`i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o bar.o bar.c`

## 反汇编

objconv这个工具怎么安装 自己到网上找教程

项目中我已经放了我编译好的 和源码文件了 到时候可以直接编译自己的版本 或者 直接使用

`./objconv -fnasm bar.o -o bar.asm`

## 链接

`i386-elf-ld -m elf_i386 foo.o bar.o -o foobar`

主要是环境配好就行

后面会很多次用这些命令 慢慢就熟悉了



















