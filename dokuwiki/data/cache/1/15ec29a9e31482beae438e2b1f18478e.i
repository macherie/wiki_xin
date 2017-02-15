a:144:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1526:"Deep in MTK Turnkey Solution Logging Tools
1  Logging概述
我 们写C程序会用printf来打印程序的执行步骤；在Windows系统有事件查看器来看Windows NT内核的系统和安全日志；Linux内核有Kernel log以及配套的Log工具；而在Android系统里面也单独设计了一套日志系统方便应用程序的Debug。
Logging，由于其简单快捷，行之有效，并且各种编程语言和操作系统都提供了对Logging的支持，以便跟踪程序行为，快速定位问题所在，所以其一直是调试过程中应用最普遍，使用频率最高的手法。
但 是，一个基于Android系统的手机平台，系统的各个部分都有不同的log机制，例如，Kernel部分沿用了Linux Kernel的Log机制；Android部分实现了4个buffer用来分别对Android应用（包含Native层的应用和Java层的应用）做 Logging；而搭配的modem则有另外的机制和工具进行Logging。当然，除此之外蓝牙，网络等等也有自己的机制。
而对应的获取log的工具也是种类繁多的，这往往会给大家带来困扰，在什么时候用什么样的工具抓取哪些log呢？这事关问题处理的效率。
本 文将专注于Kernel/Android/Modem各个部分Log机制以及配套工具的使用，针对MTK Turnkey方案中用到的log工具做出简明介绍，以让大家了解各个Log工具的使用场景以及应用上的局限性，使大家能够在遇到问题的时候准确的拿到对 应的Log来做分析。
2  Kernel log";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1527;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1527;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:"在开发Linux device Driver或者跟踪调试内核行为的时候经常要通过Log API来trace整个过程，Kernel ";}i:2;i:1533;}i:6;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:1652;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:288:" printk() 是整个Kernel Log机制的基础API，几乎所有的Log方式都是基于printk来实现的。
利用printk，我们可以像开发C应用中printf接口一样印log，最简单的方式，我们只要把需要打印的内容传给printk函数就可以了，如下：
printk(";}i:2;i:1655;}i:8;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1943;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"This is just an example!!";}i:2;i:1944;}i:10;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1969;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:149:");
当然使用printk还有一些需要注意的地方，在详细讲述之前我们先分析一下printk()实现，其流程大致如下图所示：";}i:2;i:1970;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2119;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2119;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2453:"从上图可以看出，printk的流程大致可以分为两步：
1. 将所有Log输出到内核的Log buffer，该Log Buffer是一个循环缓冲区，其地址可以在内核中用log_buf变量访问。
2. 根据设定的Log级别决定是否将Log输出到Console。
所以我们打印的log会走向两个位置：
1. Log Buffer，该Buffer的内容可以在user space通过/proc/kmsg来访问。
2. Console，Console 的实现可以有很多，目前我们用到的有UART Console和RAM Console。拿UART Console来说，通向UART Console的log会在对应的UART端口打印出来。而RAM Console也是我们一种重要的Debug手段。
对 于console log，不可避免的对系统的性能有损失，尤其是像UART Log这种收到硬件传输效率影响的。所以对于console log设置了两道关卡。第一个是对Log级别进行过滤，只能输出高优先级的log；第二个是为UART Console设置单独的开关，在不必要的时候可以将其关闭以提高系统性能。
在这里我们提到了Log Level的概念，那什么是Log Level呢？
LOG 优先级
Log Level，也叫做Log优先级，为了能够区分各个Log的重要程度，printk机制设计了若干Log级别以作区分。当我们读取log buffer （adb shell cat /proc/kmsg）的时候可以看到如下的log，在每一行Log的前面有一对尖角号，里面包含一个数字，这个数字即为这行Log优先级。
<6>[  641.908202] (0)[130:healthd]healthd: battery l=26 l2=50 v=3859 t=30.0 h=2
<4>[  641.908685] (0)[64:bat_thread_kthr][0x4]=0x9b [0x5]=0x4 [0x6]=0x70
<6>[  641.914564] (0)[130:healthd]healthd: battery l=26 l2=50 v=3859 t=30.0 h=2
<4>[  643.716514] (0)[0:swapper/0][printk_delayed:start]
<4>[  643.717113] (0)[0:swapper/0][WDK], local_bit:0x0, cpu:0,RT[643706704575]
<4>[  643.717120] (0)[0:swapper/0][WDK], local_bit:0x1, cpu:0, check bit0x:1,RT[6
<4>[  643.717127] (0)[0:swapper/0][WDK]: kick Ex WDT,RT[643706714498]
<4>[  643.717134] (0)[0:swapper/0][thread:86][RT:643706722652] 2013-01-01 00
<4>[  643.721143] (0)[0:swapper/0][printk_delayed:done]
<7>[  644.916496] (0)[0:swapper/0][ccci/ctl] (1)get_txpower(0): 16
<7>[  644.916520] (0)[0:swapper/0][ccci/ctl] (1)get_txpower(1): 16
<7>[  644.916540] (0)[0:swapper/0][ccci/ctl] (1)get_txpower(2): 16
<6>[  644.916663] (0)[96:flush-179:0][BLOCK_TAG] BDI_Flush statistic in timeline
<6>[  644.916682] (0)[96:flush-179:0][BLOCK_TAG] BDI_Flush [(PID):cnt] ";}i:2;i:2121;}i:15;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:4574;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:" (  96
完整的8个级别的定义可以参考下表，值越小级别越高：
宏定义
级别
描述
KERN_EMERG
";}i:2;i:4576;}i:17;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4693;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<0>";}i:2;i:4694;}i:19;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4697;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"
紧急信息，此信息会引起系统崩溃
KERN_ALERT
";}i:2;i:4698;}i:21;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4756;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<1>";}i:2;i:4757;}i:23;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4760;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"
提示要马上采取某些行动
KERN_CRIT
";}i:2;i:4761;}i:25;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4806;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<2>";}i:2;i:4807;}i:27;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4810;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:"
关键信息，通常有严重的软件或者硬件问题发生了
KERN_ERR
";}i:2;i:4811;}i:29;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4888;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<3>";}i:2;i:4889;}i:31;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4892;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"
通常用来报告错误，例如设备驱动通常会用来报告硬件操作失败等
KERN_WARNING
";}i:2;i:4893;}i:33;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4995;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<4>";}i:2;i:4996;}i:35;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4999;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:"
警告信息，用来警告那些并不会造成严重的系统异常的问题
KERN_NOTICE
";}i:2;i:5000;}i:37;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5092;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<5>";}i:2;i:5093;}i:39;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5096;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"
用于正常但是值得注意的情况，比如大量安全相关的log
KERN_INFO
";}i:2;i:5097;}i:41;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5181;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<6>";}i:2;i:5182;}i:43;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5185;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:97:"
信息，许多驱动程序都会在硬件启动的时候使用这个级别打印Log
KERN_DEBUG
";}i:2;i:5186;}i:45;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5283;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"<7>";}i:2;i:5284;}i:47;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5287;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:333:"
用于调试信息的打印
那优先级是怎么应用的呢？
我们可以为将要打印的log指定优先级，举例如下，可以在我们要打印的log前面简单的添加上Log优先级的宏定义即可，这个优先级在printk API里面会去解析处理，以判断是否要打印到console中去。
printk(KERN_ERR";}i:2;i:5288;}i:49;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5621;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"This is an error message!!";}i:2;i:5622;}i:51;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:5648;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1630:");
如果不指定优先级会怎样呢？
如果在印Log的时候不指定Log的优先级，printk会为这行Log采用默认的优先级。通常系统默认的优先级是4，即warning级别。
系统默认的优先级可以通过读取/proc文件来得到，如下所示，其中读回来的第2个参数即为未指定Log Level的时候printk默认的Log级别。
D:\>adb shell cat /proc/sys/kernel/printk 
6       4       1       6                 
/proc/sys/kernel/printk里面的参数意义是什么？
前面我们使用cat读取了/proc/sys/kernel/printk里面的内容，读取的这4个数字的含义分别是：
1. 第一个参数表示console log level，即只有优先级大于这个级别的Log才可以打印到Console。
2. 第二个参数表示默认Log级别，即打印Log未明确指定Log level的时候默认采用的Log级别。
3. 第三个参数表示最小可用的Log Level，用于do_syslog()系统调用。
4. 第四个参数表示默认的Console Log Level，未找到使用的地方。
Console Log 输出控制
从前面的图例以及讲述都有提到，console_loglevel 决定了哪些级别的log可以输出到console。而console_loglevel的值可以通过 /proc/sys/kernel/printk 来读取出来。
除此之外，我们还可以通过/proc/sys/kernel/printk设置console_loglevel来达到控制 console log 输出的目的，方法如下（修改这个参数需要有root权限）：
D:\>adb shell cat /proc/sys/kernel/printk         
6       4       1       6                         
D:\>adb shell ";}i:2;i:5649;}i:53;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7279;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"echo 8 > /proc/sys/kernel/printk";}i:2;i:7280;}i:55;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:7312;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1140:"  
D:\>adb shell cat /proc/sys/kernel/printk         
8       4       1       6                         
上 面黄色一行命令将console_loglevel设置8，即所有级别的log（因为定义的最低优先级的Log Level是7）都可以输出到console。当然通过这个命令也可以禁止一些低优先级的log输出到console，只要将 console_loglevel的值设置小一些即可。
UART Console 的控制
对 于UART Console单独设置了开关主要是因为其对系统性能的影响比较大，因为UART Console是同步的方式通过硬件以固定的传输速率印Log，如果Log量比较大的时候，印Log不可避免会花费系统较多的时间，这样就会引起较多的 Performance问题，如UI卡顿等。另外由于往UART Console印Log会关闭中断，严重的时候可能会引起系统无法响应或者重启。
也正因为此，我们在user版本上面默认是关闭UART Console Log的。
那么如何在runtime控制UART Console 的打开和关闭呢？可以使用如下命令（执行该命令需要有root权限）：
D:\>adb shell ";}i:2;i:7313;}i:57;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8453;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"echo 1 > /sys/module/printk/parameters/disable_uart";}i:2;i:8454;}i:59;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8505;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"   
D:\>adb shell ";}i:2;i:8506;}i:61;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8526;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"echo 0 > /sys/module/printk/parameters/disable_uart";}i:2;i:8527;}i:63;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8578;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:134:"   
通过将disable_uart参数设置为1来关闭UART Console，反之通过将disable_uart参数设置为0来打开UART Console。";}i:2;i:8579;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8713;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8713;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:651:"3  Android log
任 何一本讲述Android开发的教科书在讲如何用模拟器调试应用程序的时候都会用到Log类的Java API以及配套工具logcat或者DDMS。这是Android系统里面单独设计的一整套Log机制，与Kernel Log机制类似，也有优先级 (Priority) 的概念，虽然优先级的定义稍有不同。除此之外，还对Log添加了对应的TAG，以此来对Log的类别作区分。后面我们将详细讲述该Logging机制。
Android Logging System Architecture
Android Logging System对Java层以及Native层都提供了对应的API，我们通过下图先看一下Android Logging System整体架构。";}i:2;i:8715;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9366;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9366;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:743:"从上图我们可以看出
1. 在 Kernel 层，设计了4个 Logger 设备及相应的驱动程序，这4个 Logger 设备分别采用了一块内存区域作为循环缓冲区，用于存放 main/system/event/radio log。详细的实现代码可以参考文件 kernel/drivers/staging/adroid/logger.c
2. 在 Native 层封装了对 kernel log buffer 的写入操作，并且在写入前根据传入的TAG决定是否将log写入到 Radio Log Buffer。作为Library向上层提供API。详细的实现可以参考文件夹 system/core/liblog/ 下面的文件。
3. 为了方便 Native 应用程序以及共享库的开发，提供了 macro 定义的 Log wrapper，这样在 Native 层可以直接使用 LOGV/LOGD/LOGI/LOGW/LOGE 以及相关的 ";}i:2;i:9368;}i:71;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:10111;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:644:" 打印 Log 到 Log Buffer. 详细的定义以及其他相关的 macro 可以参考文件 system/core/include/log/log.h 
4. 为了给 Java层提供接口，在 Native 层实现了JNI接口，为 Java 层服务。详细的实现可以参考文件夹 frameworks/base/core/jni/ 下面的 android_utils_Log.cpp 和 android_utils_EventLog.cpp 文件。
5. 在 Java 层对 JNI 接口进行了封装，分别实现了 android.util.Log 和 android.util.EventLog 类，用于给 Java Application 以及 Java library 提供 Log 接口。详细的实现可以参考 frameworks/base/core/java/android/util/ 下面的 Log.java 和 EventLog.java 文件。
";}i:2;i:10114;}i:73;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:10758;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2072:" 与优先级
和 Kernel Log 机制类似，Android Logging System 也有优先级的概念。相关的优先级定义可以参考下表。
优先级
含义
描述
V
Verbose
仅在eng版本中打印，在user和userdebug版本都不会打印。最低优先级。
D
Debug
Debug信息，常用于应用程序的调试。
I
Information
用于打印通知信息的Log。
W
Warning
用于打印警告信息。
E
Error
用于打印一般的错误信息。
F
Fatal
表示信息会引起致命性的错误。
S
Silent
最高优先级，主要用于logcat过滤Log，S优先级所有Log都不会输出。
优先级的设置有两个用途，一是可以利用优先级来揭示Log的重要程度，自然越致命的信息越重要。二是Log工具可以根据不同的Log级别来过滤掉不关心的Log。
搭配不同的Log级别，就衍生出了各个级别的Log API。
例如，在Native层定义了如下的Macro，LOGV / LOGD / LOGI / LOGW / LOGE，用来打印不同级别的log。（此处举例的API并非 Native层定义的所有的API，请参考 system/core/include/log/log.h 文件查阅完整的定义）
而在Java层的 android.util.Log 类则定义了 Log.v / Log.d / Log.i / Log.w / Log.e 接口，用于在Java层打印Log。更完整的API定义请参考文件 frameworks/base/core/java/android/util/Log.java。
4  Logging Tools
一个完整的日志系统除了Log保存机制以外，还要有Log查看机制。不管是Kernel Log还是Android Log都会将Log打印到buffer，那么Log工具则会将Buffer里面的Log拿出来做相应的处理，或者打印到终端，或者对Log做解析以及过滤 等等。而Kernel Log除了打印到buffer以外还会打印到Console，那么从console获取Log也是一种常见的方式。
那到底都有哪些Log工具和方法呢？常用的Log工具和方法可以参考下表，有些可以抓取Kernel Log，有些可以抓取Android Log，有些则可以同时抓取两种Log。下表列出了各种工具和方法对Android Log和Kernel Log的支持情况，以及使用时需要注意的事项。";}i:2;i:10761;}i:75;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12833;}i:76;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12833;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1254:"Android Log
Kernel Log
NOTE
kmsg
NO
YES
需要adb连接
dmesg
NO
YES
需要adb连接
UART Log
YES
YES
需要UART Cable连接
last_kmsg
NO
YES
在MTK Turnkey方案中默认开启
MTKLogger
YES
YES
需要SD卡存储 (内置或者外置均可)
logcat
NO
YES
需要adb连接
DDMS
NO
YES
需要adb连接
在上面的表格中 kmsg/dmesg 和 UART Log 都是标准Linux Kernel支持的方式。而 logcat/DDMS 是Android提供的标准debug方式。MTKLogger是为了方便外场或者移动测试而开发的Target端后台工具，可以在手机后台将打印的 Log完整记录在SD Card存储空间。
后面我们将详细介绍每一种Log工具。
5  Kmsg
在 前面 Kernel Log 章节我们有讲过，所有的 Kernel Log 都会输出到 Kernel 里面的一个循环的缓冲区 'log_buf'，为了能够方便的在 user space 读取 Kernel log，Kernel driver 里面将这个 buffer 映射到了 /proc 目录下的文件节点 /proc/kmsg。
所以读取 /proc/kmsg 文件其实就是在访问 Kernel Log 的循环缓冲区。虽然 Log buffe的大小是固定的，但是可以通过不断的访问 /proc/kmsg 将所有的log都备份下来。
如下是一个例子，我们可以通过 adb shell cat /proc/kmsg 不断的将log打印到shell里面。";}i:2;i:12835;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14089;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14089;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5656:"除此之外，还可以通过重定向将 Log 转存到文件中。例如，下面的命令将 kmsg buffer 的内容保存到windows D盘的 kernel_kmsg.log 文件中
D:\> adb shell cat /proc/kmsg > d:\kernel_kmsg.log
应用范围
只要 adb shell 可以连接，并且有访问 /proc/kmsg 的权限，那么就可以通过访问 /proc/kmsg 的方式来读取Kernel log。但是，这并不适用于调试 Kernel BUG，因为当 Kernel 有 BUG 的时候 adb 连接首先会断掉，会导致无法录取有效的 log 分析问题。
其适用的场合主要是跟踪调试内核的逻辑，或者监测硬件模块的内核行为等等。
由于通过 cat 或者其他应用程序读取 Log Buffer 的时候可以不断的等待新的 log，所以访问 /proc/kmsg 的方式适合长时间的录取 log，一旦有新的 log 就可以被录制下来
使用限制
在访问 /proc/kmsg 的时候有一些限制，主要是
1. 由 于 Kernel log buffer 循环缓冲区只有一个读指针，所以当一个程序在读 buffer 的时候会不断的移动 buffer 的读指针，这样当有多个程序读取 buffer 的时候每个程序得到的log都不是完整的。所以当访问 /proc/kmsg 的时候务必保证没有其它程序读取 Kernel Log Buffer。
2. /proc/kmsg 的 Owner 是 root，群组属于 System，所以在 user 版本上面是无法通过 adb shell 读取 Kernel Log Buffer 的。安装在手机上的应用也是无法读取这个 buffer 的。
如果只是想看看当前 Log Buffer 里面的内容，而不是一直录 Log 下去，那么请参考下面的章节 “dmesg”。
编者按
此方式并不仅仅限于 Android 系统，/proc/kmsg 是 Linux 内核标准实现的部分，所以任何采用了 Linux 内核的系统都可以用这种方式获取 Kernel Log
6  Dmesg
前面 kmsg 的章节讲述了通过 /proc/kmsg 访问 Kernel log buffer 的方式，其主要限制是不能有多读者，即不能多个程序同时访问 Kernel Log Buffer，否则每一个访问程序得到的结果都是不完整的。
但有些时候我们可能并不知道系统里面有哪些后台进程在读取 Kernel Log Buffer，这个时候我们如何获取到可信的 Kernel Log呢？
系统（Android 或者大多数 Linux 发行版）里面还有另外一个工具，dmesg。dmesg是一个二进制可执行程序，我们可以在 adb shell 执行它，例如：
adb shell dmesg
上述命令会将整个 Log Buffer 从头到尾 dump 到输出设备，然后就退出了。它不会操作读指针，它只根据写指针把从最旧的 log 到最新的 log 完完整整的输出来。所以这种方式也不会受到其它 Log Buffer 读者的影响。
dmesg 的输出与 /proc/kmsg 的输出是一致的，区别是 dmesg dump 完 Kernel Log Buffer 就直接退出了。如下是 dmesg 的输出。
应用场景
dmesg 的使用场景与 /proc/kmsg 的场景是大致相同的，同样，不适合调试 Kernel BUG，当 Kernel 出现 BUG 的时候 dmesg 作为 user space 程序首先就无法正常执行了，所以没办法录取到有效的 log 来分析问题。
其适用的场合主要是跟踪调试内核的逻辑，或者监测硬件模块的内核行为等等。
dmesg 会完完整整的 dump 一次 Kernel Log Buffer，所以不会丢失掉任何的 Log。
使用限制
使用 dmesg 来获取 Kernel Log 也有一些限制，如下：
1. dmesg 只会一次性 dump Kernel log buffer，所以只能得到当下的 log 部分，由于 Log buffer 的大小是有限制的，在很短的时间内就可能把旧的 Log 覆盖掉，所以有可能来不及抓到旧的部分，如果 Log 量比较大，那么能够抓到的 Log 时间就很短了。所以不适合 Log 量比较大的情况，也不适合长时间跟踪内核行为。
2. dmesg 的执行需要有 root 权限才行。所以 Android user 版本是无法使用这个工具的。
如果需要长时间录取 Log，那就需要访问 /proc/kmsg 的方式。
编者按
此方式并不仅仅限于 Android 系统，绝大多数的 Linux 发行版都内置了这个应用程序。所以大多数采用 Linux 内核的系统都可以使用此工具。
7  UART Log
/proc/kmsg 文件节点映射 Kernel Log Buffer，或者 dmesg dump Kernel Log Buffer 实际都是直接从 Buffer 里面获取 Log。在 Kernel Log 章节有讲过，所有的 Kernel Log 都会一字不漏的全部写入的 Buffer 中，所以通过访问 Log Buffer 的方式获取的 Kernel Log 是最完整的。
在 Kernel Log 章节也有提到 Kernel Log 除了输出到 Buffer 之外，还会将一部分 Log 输出的到 Console。所以通过 UART 也是可以获取 Kernel Log的。（具体输出哪些 Log 取决于设定的 log level。更详细的信息请参考 Kernel Log 章节。）
UART 用于 Logging 是极其广泛的，除了 Linux Kernel 默认将其作为 Console 以外，系统其它的部分，如 bootloader 的 Debug 也和 UART Log 紧密相关。所以 UART Log 对于整个系统的 Debug，尤其是开机和关机流程至关重要。
但是 Phone 或者 Tablet 通常都不会留出直接的 UART 接口，而只是在电路板上面留出 UART 测试点，所以抓取 UART Log 就会相对麻烦一点，首先就要准备 UART cable 以及搭建抓取 UART Log 的环境。
UART Cable
UART Cable 的样子通常如下所示，一头的 USB 插口内部内置了 USB 转 UART 的芯片，可以在 PC 端模拟一个 UART COM 口。而另一头通常为了方便通常做成夹子或者钩子的方式，也可以直接焊接在板子的焊点上面。
但是有一点务必要注意：UART Cable 一定要是 1.8V 标准的，否则会抓不到 UART Log。";}i:2;i:14091;}i:81;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19747;}i:82;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19747;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1473:"UART Port 配置
抓取 UART Log 的时候应该把 UART Cable 连接到哪一个 UART Port呢？这取决于 Preloader 里面的客制化。
对于 ABS Turnkey 的软件包，UART Port 的配置在下面的两个文件中。（如果以下两个文件同时存在请以 cust_bldr.mak 中的配置为准）
alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 
alps/mediatek/custom/$PROJECT/preloader/inc/cust_bldr.h
在 alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 文件中可以修改 CFG_UART_LOG 定义，默认是UART1，波特率921600。
CFG_LOG_BAUDRATE :=921600 
CFG_UART_LOG :=UART1
在 alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 文件中可以直接修改宏定义。如下所示：
#define CFG_LOG_BAUDRATE (921600) 
#define CFG_UART_LOG         (UART2)
对于 AOSP Turnkey 的软件包，UART Port 的定义在文件 alps/bootable/bootloader/preloader/custom/$PROJECT/cust_bldr.mak 中。
CFG_LOG_BAUDRATE :=921600 
CFG_UART_LOG :=UART1
NOTE：修改 UART Port 的配置之后重新编译 Preloader 即可。
另外一点需要注意的是在 preloader 代码里面配置的 uart port 是从 UART1 开始的，但是 PCB layout 的标号有可能是从 UART0 开始的，要注意两边的对应关系。
UART 测试点
为了搭建环境首先就要根据 PCB Layout 找到正确的 UART 测试点位置，并将 UART RX/TX 以及 GND 信号飞线出来。（至少要飞线出 UART TX 以及 GND 信号。）如下图所示：";}i:2;i:19771;}i:84;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21244;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21244;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:601:"NOTE: 务必保证飞线的 UART 测试点与 Preloader 中配置的 UART Port 是一致的，否则是抓不到 UART Log 的。
硬件环境搭建
首先要使用 UART Cable 将 PC 与 Target （Phone 或者 Tablet 等）连接起来。务必正确连接 UART Cable 和 UART 测试点的 RX/TX，如下图所示：
串口终端配置
PC 端抓取 UART Log 需要有相应的软件来配合，硬件环境搭建好之后就需要设置 PC 端的 Log 终端。在设置 Log 终端之前首先要确认 UART Cable 在 PC 端对应的 COM Port 是多少。可以在设备管理器里面查看，如下：";}i:2;i:21264;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21865;}i:88;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21865;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:154:"常用的串口终端有 HyperTerminal（超级终端），Putty，TeraTerm等等，下面以 Putty 为例简单说明一下相关的配置。
在 PuTTY ";}i:2;i:21867;}i:90;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:22021;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:156:" Serial 页面配置 Serial line/Speed (Baudrate)/Data Bits/Stop Bits/Parity/Flow control 参数，其中 Parity 和 Flow Control 都要设置为None。 ";}i:2;i:22023;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22179;}i:93;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22179;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"然后回到 Putty ";}i:2;i:22197;}i:95;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:22216;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:156:" Session 页面，勾选 Connection Type 为 Serial，点击 Open 按钮即可抓取 UART Log。
如果需要将 UART Log 保存到文件还需要在 PuTTY ";}i:2;i:22218;}i:97;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:22374;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" Session ";}i:2;i:22376;}i:99;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:22385;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:104:" Logging 页面进行设置，可以选择将所有的 session 输出都保存到指定的 Log 文件。";}i:2;i:22387;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22491;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22491;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:740:"下面的截图是成功抓取 UART Log 的 PuTTY 界面：
小技巧：如何通过 UART 执行 Linux Native 程序？
此方法仅适用 ENG 版本。 
必须同时连接好UART RX/TX。
在 UART 串口终端不断的敲回车键就可以敲出命令提示符，如下，这就相当于在串口终端里面拿到了 Linux 的 shell，在这个 shell 里面可以执行任何 shell 命令，如 top，ps 等等
如下图所示就是在 UART Shell 里面执行 top 的结果：
小技巧：如何通过 UART 抓取 Android Log？
此方法仅适用 ENG 版本。 
必须同时连接好UART RX/TX。 
同上，如果执行的 Native 程序是 logcat，那么 Android main log 就可以同时被抓取在 UART 终端上面。如下是执行 ";}i:2;i:22510;}i:104;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:23250;}i:105;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"logcat -v time &";}i:2;i:23251;}i:106;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:23267;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:237:" 的结果，注意末尾的 & 符号，务必要加上它，不然由于 logcat 会阻塞住 shell，就会导致无法再输入其它任何命令了。
从下图我们可以看出，UART log 和 Android Log 已经被抓在一起了。";}i:2;i:23268;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23505;}i:109;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23505;}i:110;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5047:"NOTE：有时候 Log 比较多，我们输入进去的命令可能会被其他 Log 打断，我们可以不用管它，完整输入完命令之后敲回车键即可。（UART 的输入和输出是分开的，印 Log 并不会影响输入的命令）
编者按
UART Log 对分析问题的帮助是很大的，能够弥补其它 Log 工具的不足。但是 UART Port 受到波特率的限制，如果 Log 量比较大就会导致 Log 丢失。
另外由于 UART Log 对 Performance 有影响，如果是 Debug Performance 问题则无法依赖 UART Log。
8  Last_kmsg
讲 last_kmsg 首先就要再讲 RAM Console。在 Kernel Log 章节我们有讲过 Kernel Log 除了输出到 Kernel Log Buffer 以外还会输出到 Console，在 MTK Turnkey 方案里面 Log Console 有两个，一个是 UART Console，一个是RAM Console。
RAM Console 设备驱动同样在 RAM 里面实现了一个 Ring Buffer。那为何有了 Kernel Log Buffer 还要再另外实现一个 RAM Console 的 Buffer 呢？是否多此一举？对于这个问题首先要搞清楚 RAM Console 设计的初衷。
举 一个例子，重启问题的分析。当 Linux Kernel 出现 BUG 的时候，后走入 panic flow，这个时候由于 Kernel 出现了严重的问题，Native 程序全部都无法运行，adbd 也无法响应 adb 连接请求，这个时候想透过读取 Kernel Log Buffer 来看 Kernel Log 是不可能的。那怎么办？
由于 Console Log 是不需要下任何命令就可以查看的，所以可以抓取 UART Log 分析，但是抓 UART Log 就要飞线，就会比较麻烦，有没有一种简单的方法可以让我们知道系统大概发生了什么事情呢？那就是 RAM Console Log。
下图所示是 RAM Console 的工作原理。
其大致的工作流程如下：
1. 当系统开机初始化好 RAM Console Buffer 的时候就会开始进行 Logging，关于如何 Logging 的部分可以再参考一下 printk 那幅图。 
2. 一旦系统发生严重异常就会发生重启。 
3. 重启后系统启动又会开始初始化 RAM Console Buffer，在初始化 RAM Console Buffer 之前 Buffer 里面还保存了重启前的 Log 信息，在初始化的时候可以先将重启前的 Log 备份到另外一个 Buffer。 
4. 备份的 Buffer 可以通过 cat /proc/last_kmsg 来访问其中的内容。
通过上述的机制我们就可以在重启后通过 /proc/last_kmsg 来查看重启前发生了什么事情。
应用场景
RAM Console 机制在 MTK Turnkey 方案中是一直打开的，它主要可以帮助我们理清两件事情：
1. 系统是否发生了重启。因为 /proc/last_kmsg 只有重启之后才会存在，所以只要 /proc/last_kmsg 存在我们就知道系统重启过了。（不是所有的重启都是异常重启） 
2. 如果系统重启了，我们可以根据 /proc/last_kmsg 的内容查看重启前系统都做了什么事情。
当然我们在 RAM Console header 里面还记录了 CPU hotplug 的情况以及 Hardware Watchdog Timeout Flow 的执行情况，以帮助 Debug 问题。（如果想了解相关的信息还请联系我们）
设计限制
last_kmsg 能够保存的信息比较少，这主要受制于 Internal SRAM 的大小。那为什么一定要放在 Internal SRAM 呢？
在早期的平台，如 MT6589，系统重启的时候会将 DRAM 内容复位，这导致了 RAM Console Buffer 无法放在外部 DRAM。 
Internal SRAM 位于 CPU 内部，是比较稳定的 module，可以 Cover 到 DRAM 不稳定的问题。所以虽然在 MT6572 以及之后的平台可以支持重启的时候保持住 DRAM 的内容，但是也没有在外部 DRAM 来实现 RAM Console。
所以，last_kmsg 的内容通常都会很少，约 7KB 左右，用来作为 Debug 问题时候的参考。
误区与疑问
为什么在 mtklog 目录下也会有 last_kmsg 文件？
last_kmsg 在分析重启问题的时候可以作为一个参考，所以如果在 mtklogger 里面打开了 MobileLog 之后，每次 MobileLog 启动的时候都会将 /proc/last_kmsg 抓取到 mtklog 目录下面去。
我在 mtklog 目录看到了 last_kmsg，系统发生了异常么？
通过前面的描述我们知道存在 last_kmsg 表示系统重启过，但是重启并不意味着异常。举个例子，我们执行 adb reboot 也会存在 last_kmsg。或者在长按电源键的对话框里面实现了 Reboot 菜单，这样的重启属于正常重启，但是同样都会有 last_kmsg.
请不要把 last_kmsg 和 异常重启 画等号！
mtklog 目录下有很多 last_kmsg，系统重启了很多次么？
mobile log 每启动一次都会抓一次 last_kmsg，所以当看到很多 last_kmsg 时有可能仅仅是 mobilelog 停止/启动了很多次而已。
编者按
last_kmsg 是 debug 重启问题，尤其是系统莫名其妙重启问题的一种辅助手段，但是也请不要将 last_kmsg 与异常重启问题画上等号。
9  Logcat
Logcat 是 Android SDK 里面提供的命令行下的 Logging 工具，用法简单，使用方便，相关的介绍可以参考 Android Developer 链接: ";}i:2;i:23507;}i:111;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:51:"http://developer.android.com/tools/help/logcat.html";i:1;N;}i:2;i:28554;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:122:"
用法
命令格式如下，在<option>可以指定一些选项，比如输出格式，指定 buffer 等；而在<filter-";}i:2;i:28605;}i:113;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"spec";}i:2;i:28727;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:">中可以指定过滤规则。
[adb] logcat [<option>] ";}i:2;i:28731;}i:115;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:28787;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" [<filter-";}i:2;i:28790;}i:117;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"spec";}i:2;i:28800;}i:118;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:">] ";}i:2;i:28804;}i:119;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:28807;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:848:"
logcat 可以作为 adb command 来执行，利用 target 上面的 adb daemon 来操作 log buffer。 
adb logcat -v threadtime
也可以通过 adb 建立的 shell，在 shell 里面执行 target 上面的 logcat 程序来操作 log buffer。
adb shell logcat -v threadtime
常用操作
详细的使用方式请参考 Android Developer 上面的介绍，这里仅对常用操作进行举例。
1. 如何抓取有效 log？
adb logcat -v threadtime > main_log.txt
此种方式为最常用的抓取方式，会将 log 的 PID，TID，TAG 以及时间戳都打印在一行 log 里面。优先使用此种方式抓取 log，一定不要仅仅敲 adb logcat 来抓取 log，adb logcat 仅仅会将一些基本的信息打印出来，缺少时间戳信息对于分析问题是困难的。
2. 如何仅仅抓取某个 TAG 的 Log？
可以使用<filter-";}i:2;i:28810;}i:121;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"spec";}i:2;i:29658;}i:122;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:">来过滤某一些 log，<filter-";}i:2;i:29662;}i:123;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"spec";}i:2;i:29696;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:525:">的格式是 <TAG>:<Priority>.
adb logcat -v threadtime ActivityManager:D *:S
上面的命令可以仅打印 ActivityManager 等于和高于 debug 级别的log，它指定了 ActivityManager 最低 Log 级别为 debug，用 * 来匹配其他所有 TAG，并将其它所有 TAG 设置为 silent 级别，即不输出任何 Log
10 DDMS
DDMS (Dalvik Debug Monitor Server) 是 Android SDK 中的一个 debug 工具，提供了 UI 窗口，可以在 eclipse 中打开，也可以单独使用。
详情请参考下面的链接：
";}i:2;i:29700;}i:125;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:54:"http://developer.android.com/tools/debugging/ddms.html";i:1;N;}i:2;i:30225;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:30279;}i:127;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:52:"http://developer.android.com/tools/help/monitor.html";i:1;N;}i:2;i:30280;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1650:"
11  MTKLogger
MTKLogger 是 MediaTek 开发的一个 target 端 Logging 工具，它由几个 daemon 以及一个 UI Application 构成。其中 daemon 负责不断的将 Log Buffer 里面的新 Log 复制到 sdcard 上面，而 UI Application 则可以控制 Daemon 的打开和关闭，占用 sdcard 空间的大小，某一种 Log 的抓取和关闭等等。
MTKLogger 是一个在移动测试当中应用非常广泛的工具，它不需要连接 PC 即可抓取各种 Log，包括 android log，kernel log，bluetooth log， network log 以及 modem log。
MTKLogger
在 eng 版本上面，Laucher 桌面有一个 MTKLogger 的 应用图标，点击就可以进入 MTKLogger 应用
但是这个图标在 user 版本上是不会出现的，所以在 user 版本上面需要从工模里面来打开 MTKLogger，进入工模的默认方法实在拨号界面输入 *#*#3646633#*#*，具体方式需要根据工模的客制化入口来进入。进入工模之后在 Log and Debugging 页面就可以找到 MTKLogger 了。如下所示：
主界面
进入 MTKLogger 之后就可以看到如下的主界面，上面显示了如下信息：
1. 运行时间。从打开 MTKLogger 开始录制 Log 开始到目前一共录制了多长时间。 
2. 各个 Log 的录制状态，如下所示表示 Mobilelog/ModemLog/NetworkLog 都处于录制状态，如果某种 log 没有录制则会显示为灰色。 
3. storage的使用状态。显示了storage的使用空间和剩余空间。 
4. 快捷按钮。从左到右依次为 TagLog 按钮，启动/停止按钮，清除 Log 按钮。 
5. 详细配置按钮，点击按钮可以进入详细配置页面。";}i:2;i:30332;}i:129;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:31982;}i:130;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:31982;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:222:"[Description]
如何在User版本开启串口(Uart)，开启输入控制台，抓取上层Log
 
[Keyword]
User Uart Log Logcat 输入 控制台 串口
 
[Solution]
(1) 如何在User版本中使用串口(Uart)
 *Android ";}i:2;i:31984;}i:132;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:2:"GB";}i:2;i:32206;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" 2.3 ";}i:2;i:32208;}i:134;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:2:"GB";}i:2;i:32213;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:".MP ";}i:2;i:32215;}i:136;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:2:"GB";}i:2;i:32219;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1827:".TDD.MP GB2.MP GB2.TDD.MP
  alps/mediatek/config/common/autoconfig/kconfig/USER
  如果版本一致的话，应当是这个文件的37行
  CONFIG_COMLINE=”console=ttyMT3,921600n1 loglevel=0”
  您把最后的loglevel = 8 即可
  
 *Android GB3.MP GB3.TDD.MP
  手法1：直接用ENG 版本的lk 替换掉user 版本的lk, 即重新download eng 版本的lk 即可。
  手法2:  alps/bootable/bootloader/lk/app/mt_boot/mt_boot.c 里面的 178 行，找到printk.disable_uart=1 改成 printk.disable_uart=0
          然后重新编译lk, download lk 即可。
  
 *Android ICS 4.0/JB 4.1
  如果是必须开机即需要抓取User 版本的Uart log, 请提交eservice 申请默认开启uart 的xlog 执行档
  否则可以直接在adb shell 中输入aee -k 6, 后面的6即kernel printk 的Log等级，您可以选择不同的等级
  
 *Android JB 4.2 以及以后版本
  手法1：直接用ENG 版本的lk 替换掉user 版本的lk, 即重新download eng 版本的lk 即可。
  手法2: alps/bootable/bootloader/lk/app/mt_boot/mt_boot.c 里面的 178 行，找到printk.disable_uart=1 改成 printk.disable_uart=0
          然后重新编译lk, download lk 即可。
  手法3: 如果只是临时将uart log 打开用于测试，请到我司DMS 上查询文档: Enable UART Log in user build.pptx
  
 * 注意事项: 由于uart log 的打印对系统的性能造成严重影响, 在JB9.MP 以及以后版本, 在开机完成后默认关闭了uart log, 以提高系统性能. 从uart log 中可以看到如：
   抓UART Log的时候会看到类似下面的Log。
   [   25.986567].(1)[324:Binder_1][usktrk] socket close[10422]
   [   25.987748].(1)[324:Binder_1]BOOTPROF:     25987.740155:BOOT_Animation:END
   [   25.988616].(1)[324:Binder_1]";}i:2;i:32221;}i:138;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"<<";}i:2;i:34048;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" printk console disable ";}i:2;i:34050;}i:140;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:">>";}i:2;i:34074;}i:141;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1738:"
 
   要关闭此功能，可以进行如下操作:
   有三种种方法可以重新打开UART log：
   1. 在超级终端窗口按下键盘的任何一个按键就可以让UART log继续吐。此种方式需要UART的TX和RX都要连接好。
   2. 通过修改proc参数的方式： adb shell echo 1 > /proc/mtprintk
   3. 通过设置system property: 
    使用： UART:command: setprop persist.uartconsole.enable 1
              ADB Shell: adb shell setprop persist.uartconsole.enable 1
  
(2) 如何开启Uart 的控制台(console/sh)
 Uart 控制台的开启，决定于System property ro.debuggable，默认如果ro.debuggable=1 则开启(Eng 版本)，User 版本ro.debuggable=0 则关闭。
 想在User 版本中打开，需要更新alps/mediatek/config/mt65xx/init.rc, 在init.rc 的触发器代码：
   on property:ro.debuggable=1
    start console
 后面增加:
   on property:ro.debuggable=0
    start console 
 然后重新编译bootimage 即可， ./mk [project_name] new bootimage 
 
(3) 如何在Uart 上抓取上层LOG
 Uart 上进行输入，实际就是开启了一个sh 对接起来，所以绝对不能在uart 上输入一个长命令(不可中断)，否则uart 将被卡住，不能再输入。
 抓取上层log, 我们通常需要call logcat, 但logcat 是不可中断的，将导致uart 不能再输入。
 处理的方法即将logcat 转入后台执行，如下操作即可:
 Main log: logcat -v time &
 Radio log: logcat -v time -b radio &
 Event log: logcat -v time -b events &
 如果想关闭上层log, 直接ps 查阅前面开启的logcat process pid, 然后kill -9 pid 杀掉即可。
 注意一定要带“&”，否则将block 住uart输入";}i:2;i:34076;}i:142;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:35814;}i:143;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:35814;}}