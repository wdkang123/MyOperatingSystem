# MacOS BigSur 手写操作系统
在MacOS下(当前是BigSur)  通过java打包 C/C++和汇编 写的一个简单的操作系统 （附带学习笔记和代码）



# 1.起源背景

大学时学了《操作系统》结果无意间听到 在清华大学 这门课竟然要手写一个操作系统

其实手写一个操作系统 是每一个编程爱好者的梦想吧！



当时一搜书籍 大家都推荐**《30自制操作系统》**

事实上 我个人觉得 这本书不错 但是还差点意思 里边有很多作者打包好的工具 帮助你来完成 

当时我只有mac 没有win 这点就很难受 （mac的工具包我也下载了 奈何macos版本太高了 已经运行不了了）



看到了win版本的 我励志要在mac上实现（其实也没什么区别 大同小异吧）

结果真的是处处碰壁 前几节还好 磕磕绊绊用 dd 这些命令搞出来了

到了c和汇编配合的时候 我就蒙了 为此卡住了好久

后来看到了课程（老师的环境也是macos） 又看到了一些希望



可惜老师是要借助Ubuntu系统 来回切换

在乌班图上编译完成 再导入到macos 通过java打包 最后运行

这点让我很不舒服（··· 只是想纯纯的在macos上编译）

再一番折腾后 终于发现了用交叉变异的环境 解决了这个麻烦



# 2.需要前置

- c/c++ 基础知识
- 汇编基础
- Makfile最好听过
- 一台mac （我当前是X86架构的BigSur）
- 当然·· 操作系统的基础知识 这个是必备的
- 原来老师的课程地址是：https://study.163.com/course/introduction.htm?courseId=1003169025 搭配食用更加



# 3.硬件软件需求

- MacOS X86架构（x新版的arm架构的我没有 所以大家自行测试)

- VirtualBox

- C/C++环境 （Xcode必装）

  

01-java汇编最小操作系统

02-读写软盘

03-突破512字节的限制

04-保护模式

代码图片上传

05-保护模式超强寻址

06-C语言结合汇编

07-C语言绘制系统界面

08-C语言调色板(绘制系统界面)

09-绘制字体

10-绘制鼠标

11-建立中断

12-处理键盘中断

13-内核实现鼠标中断

14-挪动鼠标

15-内核管理检测可用内存

16-内核管理解析内存状态

17-内存管理算法实现

18-图层分层技术

19-编译自动化(久违了)

20-图层叠加优化

21-MessageBox

22-突破连续读取72个扇区

23-消除闪烁计数器闪烁

24-消除闪烁鼠标闪烁

25-定时器功能

26-光标闪烁

27-修改分辨率

28-输入文本和移动窗体

29-进程切换

30-进程互相切换

31-进程自动切换

32-挂起和恢复

33-多任务多窗口

34-进程优先级

35-控制台

36-Tab键切换窗口

37-切换窗口键盘输入

38-shift键响应

39-caps键响应

40-进程消息通讯和回车键处理

41-mem第一个控制台程序

42-cls

43-dir命令和写入文件

44-运行简单程序(无文档)

45-C语言开发APP

46-系统与应用内存隔离

47-系统与应用内存交叉

48-让内核从错误中恢复

49-进程优先级转换

50-防范缓冲区溢出和死循环

51-创建窗口api

52-窗口图形绘制

53-关闭窗口api

54-鼠标操作窗体

55-内核时钟和更多颜色

56-多窗口多进程

57-无限控制台进程

58-不锁死控制台启动进程

59-LDT局部描述表

60-文件api

61-毕业了 三个小程序



# 5.部分截图

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/01-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/05-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/10-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/10-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/20-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/30-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/40-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/50-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/55-img01.png?raw=true)

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/61-img01.png?raw=true)

# 6.后记

原来老师的文章链接有一些挂掉了 后边看情况在补吧

同时项目当中所有代码我都在MacOS BigSur （X86）下编译通过、且运行通过了 

并且在虚拟机测试运行没有问题（有一些章节有小bug 比如打字会出现一些莫名符号 都不要紧 在后边会修复）



不得不佩服清华大学的学生（泛指所有好大学）

一个学期的操作系统课 竟然能写一个有模有样的操作系统

内心真的是佩服不已

同时也真的感到自己能力的不足 与清北的学生不是一点点的差距



努力吧

长风破浪会有时 直挂云帆济沧海