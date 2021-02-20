# java和汇编 编写一个最小的操作系统

# 1.简介

由之前的最小内核 将其转换为二进制 再成为十六进制

```java
private int[] imgContent = new int[]{
     0xeb,0x4e,0x90,0x48,0x45,0x4c,0x4c,0x4f,0x49,0x50,0x4c,0x00,0x02,0x01,0x01,0x00,0x02,0xe0,        0x00,0x40,0x0b,0xf0,0x09,0x00,0x12,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x40,0x0b,0x00,0x00,0x00,0x00,0x29,
    0xff,0xff,0xff,0xff,0x48,0x45,0x4c,0x4c,0x4f,0x2d,0x4f,0x53,0x20,0x20,0x20,0x46,0x41,0x54,0x31,0x32,        0x20,0x20,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8,0x00,0x00,0x8e,
        0xd0,0xbc,0x00,0x7c,0x8e,0xd8,0x8e,0xc0,0xbe,0x74,0x7c,0x8a,
     0x04,0x83,0xc6,0x01,0x3c,0x00,0x74,0x09,0xb4,0x0e,0xbb,0x0f,0x00,0xcd,0x10,0xeb,0xee,0xf4,0xeb,0xfd
    };
```

这段十六进制的代码中设置了一些初始化的数据 然后调用bios中断 将某个缓冲区中的字符打印到屏幕上去

然后进去了一个死循环 实际上 这段代码是由汇编实现 接着将汇编转换为16进制 再将其放到imgContent中

最后让java程序生成虚拟软盘

实际上 汇编是这么写的：

```assembly
org  0x7c00;

jmp  entry
db   0x90
DB   "OSKERNEL"
DW   512
DB   1
DW   1
DB   2
DW   224
DW   2880
DB   0xf0
DW   9
DW   18
DW   2
DD   0
DD   2880
DB   0,0,0x29
DD   0xFFFFFFFF
DB   "MYFIRSTOS  "
DB   "FAT12   "
RESB  18

entry:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    mov  si, msg

putloop:
    mov  al, [si]
    add  si, 1
    cmp  al, 0
    je   fin
    mov  ah, 0x0e
    mov  bx, 15
    int  0x10
    jmp  putloop

fin:
    HLT
    jmp  fin

msg:
    DB    0x0a,  0x0a
    db    "hello, world"
    db    0x0a
    db    0
```



上面的汇编代码 实际上就实现了将hello, world 打印到屏幕上 然后进入死循环的功能 

## 1.1 org

上面的程序第一句是 org 0x7c00,

org 的意思是origin 中文意思是“起始 起源” 

org 后面的7c00 是物理内存地址 

假设物理内存是一个byte类型的大数组 例如byte[] memory, 如果你有2G内容 换算成字节就是2097152 也就相当于memory数组有2097152字节 

于是当虚拟机上电 然后new一块内存 byte[] memory = new byte[2097152]

org 0x7c00 的意思是将本汇编编译后的二进制数据从memory[0x7c00]处写入memory.



## 1.2 jmp

jmp entry 中的jmp 其实就是c语言中的语句goto, jmp entry 其实是让cpu跳转到entry 处，执行entry下面的代码，如果entry是一个函数名字的话，jmp entry 相当于调用entry函数，类比于java就是函数调用：entry();



## 1.3 db

从db 0x90 到 RESB 18 这段代码做一些初始化工作 

jmp entry 对应的机器代码 长度是3字节 

那么db 0x90 的意思就是 memory[0x7c00+3] = 0x90 也就是说db 0x90 实际上做的是赋值操作 

db 0x90 表示将给定位置处的一个字节赋予数值0x90 赋值的内存位置就在0x7c00+3处



## 1.4 msg:

```assembly
msg:
DB 0x0a, 0x0a
db “hello, world”
db 0x0a
```

相当于 `C语言的 char* msg = “\n\nhello,world\n”`



## 1.5 int

调用一个中断 中断其实就是一个函数调用 

我们在写c语言或java程序时 往往需要调用一些系统库函数 例如printf, 或java的System.out.print. 

中断就是bios提供给汇编语言的库函数，这些库函数都放入到一个数组里，int 0x10 意思是在库函数数组中取出第0x10个库函数，然后执行该库函数的代码



## 1.6 put loop:

```
putloop:
mov al, [si]
add si, 1
cmp al, 0
je fin
mov ah, 0x0e
mov bx, 15
int 0x10
jmp putloop

就相当于C语言：
do {
char al = *si;
si++;
if (al == 0) {
goto fin
}

printf(“%c”, al);
} while(true);
```



# 2.进行编译

将这段代码 进行汇编:

```shell
nasm boot.asm -o boot.bat
```

得到了 boo.bat

```
b800 008e d08e d88e c0be 217c 8a04 83c6
013c 0074 09b4 0ebb 0f00 cd10 ebee f4eb
fd0a 0a68 656c 6c6f 2c20 776f 726c 640a
00
```

将这段放入到java工程中的imgContent中去

```java
public class OperatingSystem {
    private int[] imgContent = new int[]{
        0xeb,0x4e,0x90,0x48,0x45,0x4c,0x4c,0x4f,0x49,0x50,0x4c,0x00,0x02,0x01,0x01,0x00,0x02,0xe0,
        0x00,0x40,0x0b,0xf0,0x09,0x00,0x12,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x40,0x0b,0x00,0x00,0x00,0x00,0x29,
        0xff,0xff,0xff,0xff,0x48,0x45,0x4c,0x4c,0x4f,0x2d,0x4f,0x53,0x20,0x20,0x20,0x46,0x41,0x54,0x31,0x32,
        0x20,0x20,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8,0x00,0x00,0x8e,
        0xd0,0xbc,0x00,0x7c,0x8e,0xd8,0x8e,0xc0,0xbe,0x74,0x7c,0x8a,
        0x04,0x83,0xc6,0x01,0x3c,0x00,0x74,0x09,0xb4,0x0e,0xbb,0x0f,0x00,0xcd,0x10,0xeb,0xee,0xf4,0xeb,0xfd
    };

    private ArrayList<Integer> imgByteToWrite = new ArrayList<Integer>();

    private void readKernelFromFile(String fileName) {
        File file = new File(fileName);
        InputStream in = null;

        try {
            in = new FileInputStream(file);
            int tempbyte;
            while ((tempbyte = in.read()) != -1) {
                imgByteToWrite.add(tempbyte);
            }
        } catch(IOException e) {
            e.printStackTrace();
            return;
        }

        imgByteToWrite.add(0x55);
        imgByteToWrite.add(0xaa);
        imgByteToWrite.add(0xf0);
        imgByteToWrite.add(0xff);
        imgByteToWrite.add(0xff);

    }

    public OperatingSystem(String s) {
    /*  for (int i = 0; i < imgContent.length; i++) {
            imgByteToWrite.add(imgContent[i]);
        }

        imgByteToWrite.add(0x0a);
        imgByteToWrite.add(0x0a);
        for (int j = 0; j < s.length(); j++) {
            imgByteToWrite.add((int)s.charAt(j));
        }
        imgByteToWrite.add(0x0a);

        int len = 0x1fe;
        int curSize = imgByteToWrite.size();
        for (int k = 0; k < len - curSize; k++) {
            imgByteToWrite.add(0);
        }

        //0x1fe-0x1f: 0x55, 0xaa
        //0x200-0x203: f0 ff  ff
        imgByteToWrite.add(0x55);
        imgByteToWrite.add(0xaa);
        imgByteToWrite.add(0xf0);
        imgByteToWrite.add(0xff);
        imgByteToWrite.add(0xff);
      */

        readKernelFromFile("boot.bat");

        int len = 0x168000;
        int curSize = imgByteToWrite.size();
        for (int l = 0; l < len - curSize; l++) {
            imgByteToWrite.add(0);
        }

    }

    public void makeFllopy()   {
        try {
            DataOutputStream out = new DataOutputStream(new FileOutputStream("system.img"));
            for (int i = 0; i < imgByteToWrite.size(); i++) {
                out.writeByte(imgByteToWrite.get(i).byteValue());
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        OperatingSystem op = new OperatingSystem("hello, this is my first line of my operating system code");
        op.makeFllopy();
    }
}
```

运行后 得到了一个 system.img

将其导入到VitrualBox中 运行

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/01-img01.png?raw=true)