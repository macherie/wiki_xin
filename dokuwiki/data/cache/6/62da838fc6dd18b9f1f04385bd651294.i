a:203:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"Deep in MTK Turnkey Solution Logging Tools";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:43;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:0:"";i:1;i:1;i:2;i:43;}i:2;i:43;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:43;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:43;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:52;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"1  Logging概述";}i:2;i:54;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:70;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:72;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:73;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1459:"  我们写C程序会用printf来打印程序的执行步骤；在Windows系统有事件查看器来看Windows NT内核的系统和安全日志；Linux内核有Kernel log以及配套的Log工具；而在Android系统里面也单独设计了一套日志系统方便应用程序的Debug。
  Logging，由于其简单快捷，行之有效,并且各种编程语言和操作系统都提供了对Logging的支持，以便跟踪程序行为，快速定位问题所在，所以其一直是调试过程中应用最普遍，使用频率最高的手法。但是，一个基于Android系统的手机平台，
  系统的各个部分都有不同的log机制，例如，Kernel部分沿用了Linux Kernel的Log机制；Android部分实现了4个buffer用来分别对Android应用（包含Native层的应用和Java层的应用）做 Logging；而搭配的modem则有另外的机制
  和工具进行Logging。当然，除此之外蓝牙，网络等等也有自己的机制。而对应的获取log的工具也是种类繁多的，这往往会给大家带来困扰，在什么时候用什么样的工具抓取哪些log呢？这事关问题处理的效率。
  本文将专注于Kernel/Android/Modem各个部分Log机制以及配套工具的使用，针对MTK Turnkey方案中用到的log工具做出简明介绍，以让大家了解各个Log工具的使用场景以及应用上的局限性，使大家能够在遇到问题的时候准确的拿到对
  应的Log来做分析。";}i:2;i:73;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:73;}i:14;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1546;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"2  Kernel log";}i:2;i:1548;}i:16;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1561;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1563;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1564;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:588:"  在开发Linux device Driver或者跟踪调试内核行为的时候经常要通过Log API来trace整个过程，Kernel API printk() 是整个Kernel Log机制的基础API，几乎所有的Log方式都是基于printk来实现的。利用printk，我们可以像
  开发C应用中printf接口一样打印log简单的方式，我们只要把需要打印的内容传给printk函数就可以了，如下：printk("This is just an example!!");当然使用printk还有一些需要注意的地方，在详细讲述之前我们先分析一下printk()实现，
  其流程大致如下图所示：";}i:2;i:1564;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1564;}i:21;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:21:":playgroud:6735:1.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:2160;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2193;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1106:"  从上图可以看出，printk的流程大致可以分为两步：
  1. 将所有Log输出到内核的Log buffer，该Log Buffer是一个循环缓冲区，其地址可以在内核中用log_buf变量访问。
  2. 根据设定的Log级别决定是否将Log输出到Console。所以我们打印的log会走向两个位置：
     1. Log Buffer,该Buffer的内容可以在user space通过/proc/kmsg来访问。
     2. Console,Console的实现可以有很多，目前我们用到的有UART Console和RAM Console。拿UART Console来说，通向UART Console的log会在对应的UART端口打印出来。而RAM Console也是我们一种重要的Debug手段。
     对于console log，不可避免的对系统的性能有损失，尤其是像UART Log这种收到硬件传输效率影响的。所以对于console log设置了两道关卡。第一个是对Log级别进行过滤，只能输出高优先级的log；第二个是为UART Console设置单独的开关，
     在不必要的时候可以将其关闭以提高系统性能。在这里我们提到了Log Level的概念，那什么是Log Level呢？
     ";}i:2;i:2193;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2193;}i:25;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3317;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"3  LOG 优先级";}i:2;i:3319;}i:27;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3335;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3337;}i:29;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1391:" 
 Log Level，也叫做Log优先级，为了能够区分各个Log的重要程度，printk机制设计了若干Log级别以作区分。当我们读取log buffer （adb shell cat /proc/kmsg）的时候可以看到如下的log，在每一行Log的前面有一对尖角号，
 里面包含一个数字，这个数字即为这行Log优先级。
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
 <6>[  644.916663] (0)[96:flush-179:0][BLOCK_TAG] BDI_Flush statistic in timeline
 <6>[  644.916682] (0)[96:flush-179:0][BLOCK_TAG] BDI_Flush [(PID):cnt] -- (  96
 完整的8个级别的定义可以参考下表，值越小级别越高：";}i:2;i:3337;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3337;}i:31;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-02_11_05_39.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:4764;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4831;}i:33;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1800:" 那优先级是怎么应用的呢？
 我们可以为将要打印的log指定优先级，举例如下，可以在我们要打印的log前面简单的添加上Log优先级的宏定义即可，这个优先级在printk API里面会去解析处理，以判断是否要打印到console中去。
 printk(KERN_ERR"This is an error message!!");如果不指定优先级会怎样呢？
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
 除此之外，我们还可以通过/proc/sys/kernel/printk设置console_loglevel来达到控制 console log 输出的目的，方法如下（修改这个参数需要有root权限）：";}i:2;i:4831;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4831;}i:35;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-02_11_08_55.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:6667;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6734;}i:37;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:293:" 上面黄色一行命令将console_loglevel设置8，即所有级别的log（因为定义的最低优先级的Log Level是7）都可以输出到console。当然通过这个命令也可以禁止一些低优先级的log输出到console，只要将 console_loglevel的值设置小一些即可。";}i:2;i:6734;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6734;}i:39;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7031;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"4  UART Console 的控制";}i:2;i:7033;}i:41;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7058;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:327:"
   对于UART Console单独设置了开关主要是因为其对系统性能的影响比较大，因为UART Console是同步的方式通过硬件以固定的传输速率印Log，如果Log量比较大的时候，印Log不可避免会花费系统较多的时间，这样就会引起较多的 Performance问题，如UI卡顿等。";}i:2;i:7060;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7390;}i:44;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:599:" 另外由 于往UART Console印Log会关闭中断，严重的时候可能会引起系统无法响应或者重启。也正因为此，我们在user版本上面默认是关闭UART Console Log的。那么如何在runtime控制UART Console 的打开和关闭呢？可以使用如下命令（执行该命令需要
 有root权限)
 D:\>adb shell "echo 1 > /sys/module/printk/parameters/disable_uart" 
 D:\>adb shell "echo 0 > /sys/module/printk/parameters/disable_uart"  
 通过将disable_uart参数设置为1来关闭UART Console，反之通过将disable_uart参数设置为0来打开UART Console。";}i:2;i:7390;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7390;}i:46;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8001;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"5  Android log";}i:2;i:8003;}i:48;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8017;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8019;}i:50;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:461:" 任 何一本讲述Android开发的教科书在讲如何用模拟器调试应用程序的时候都会用到Log类的Java API以及配套工具logcat或者DDMS。这是Android系统里面单独设计的一整套Log机制，与Kernel Log机制类似，也有优先级 (Priority) 的概念，虽然优先级的
 定义稍有不同。除此之外，还对Log添加了对应的TAG，以此来对Log的类别作区分。后面我们将详细讲述该Logging机制。";}i:2;i:8019;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8019;}i:52;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8486;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Android Logging System Architecture";}i:2;i:8488;}i:54;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8523;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:" ";}i:2;i:8525;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8527;}i:57;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:142:" Android Logging System对Java层以及Native层都提供了对应的API，我们通过下图先看一下Android Logging System整体架构。";}i:2;i:8527;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8527;}i:59;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-02_11_14_30.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:8673;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8740;}i:61;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1398:" 从上图我们可以看出
 1. 在 Kernel 层，设计了4个 Logger 设备及相应的驱动程序，这4个 Logger 设备分别采用了一块内存区域作为循环缓冲区，用于存放 main/system/event/radio log。详细的实现代码可以参考文件 kernel/drivers/staging/adroid/logger.c
 2. 在 Native 层封装了对 kernel log buffer 的写入操作，并且在写入前根据传入的TAG决定是否将log写入到 Radio Log Buffer。作为Library向上层提供API。详细的实现可以参考文件夹 system/core/liblog/ 下面的文件。
 3. 为了方便 Native 应用程序以及共享库的开发，提供了 macro 定义的 Log wrapper，这样在 Native 层可以直接使用 LOGV/LOGD/LOGI/LOGW/LOGE 以及相关的 API 打印 Log 到 Log Buffer. 详细的定义以及其他相关的 macro 可以参考文件 
 system/core/include/log/log.h
 4. 为了给 Java层提供接口，在 Native 层实现了JNI接口，为 Java 层服务。详细的实现可以参考文件夹 frameworks/base/core/jni/ 下面的 android_utils_Log.cpp 和 android_utils_EventLog.cpp 文件。
 5. 在 Java 层对 JNI 接口进行了封装，分别实现了 android.util.Log 和 android.util.EventLog 类，用于给 Java Application 以及 Java library 提供 Log 接口。详细的实现可以参考 frameworks/base/core/java/android/util/ 
 下面的 Log.java 和 EventLog.java 文件。";}i:2;i:8740;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8740;}i:63;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10156;}i:64;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:10158;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" 与优先级";}i:2;i:10161;}i:66;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10174;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10176;}i:68;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:126:" 和 Kernel Log 机制类似，Android Logging System 也有优先级的概念。相关的优先级定义可以参考下表。";}i:2;i:10176;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10176;}i:70;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-02_11_29_03.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:10306;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10373;}i:72;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:737:" 优先级的设置有两个用途，一是可以利用优先级来揭示Log的重要程度，自然越致命的信息越重要。二是Log工具可以根据不同的Log级别来过滤掉不关心的Log。
 搭配不同的Log级别，就衍生出了各个级别的Log API。
 例如，在Native层定义了如下的Macro，LOGV / LOGD / LOGI / LOGW / LOGE，用来打印不同级别的log。（此处举例的API并非 Native层定义的所有的API，请参考 system/core/include/log/log.h 文件查阅完整的定义）
 而在Java层的 android.util.Log 类则定义了 Log.v / Log.d / Log.i / Log.w / Log.e 接口，用于在Java层打印Log。更完整的API定义请参考文件 frameworks/base/core/java/android/util/Log.java。";}i:2;i:10373;}i:73;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10373;}i:74;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11120;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"6  Logging Tools";}i:2;i:11122;}i:76;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11138;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11140;}i:78;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:729:" 一个完整的日志系统除了Log保存机制以外，还要有Log查看机制。不管是Kernel Log还是Android Log都会将Log打印到buffer，那么Log工具则会将Buffer里面的Log拿出来做相应的处理，或者打印到终端，或者对Log做解析以及过滤 等等。而Kernel Log除了打印到
 buffer以外还会打印到Console，那么从console获取Log也是一种常见的方式。那到底都有哪些Log工具和方法呢？常用的Log工具和方法可以参考下表，有些可以抓取Kernel Log，有些可以抓取Android Log，有些则可以同时抓取两种Log。下表列出了各种工具和
 方法对Android Log和Kernel Log的支持情况，以及使用时需要注意的事项。";}i:2;i:11140;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11140;}i:80;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-02_11_31_09.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:11877;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:305:"
   在上面的表格中 kmsg/dmesg 和 UART Log 都是标准Linux Kernel支持的方式。而 logcat/DDMS 是Android提供的标准debug方式。MTKLogger是为了方便外场或者移动测试而开发的Target端后台工具，可以在手机后台将打印的 Log完整记录在SD Card存储空间。";}i:2;i:11944;}i:82;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12252;}i:83;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:49:" 后面我们将详细介绍每一种Log工具。";}i:2;i:12252;}i:84;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12252;}i:85;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12305;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"7  Kmsg";}i:2;i:12307;}i:87;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12314;}i:88;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12316;}i:89;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:599:" 在 前面 Kernel Log 章节我们有讲过，所有的 Kernel Log 都会输出到 Kernel 里面的一个循环的缓冲区 'log_buf'，为了能够方便的在 user space 读取 Kernel log，Kernel driver 里面将这个 buffer 映射到了 /proc 目录下的文件节点 /proc/kmsg。
 所以读取 /proc/kmsg 文件其实就是在访问 Kernel Log 的循环缓冲区。虽然 Log buffe的大小是固定的，但是可以通过不断的访问 /proc/kmsg 将所有的log都备份下来。如下是一个例子，我们可以通过 adb shell cat /proc/kmsg 不断的将log打印到
 shell里面。";}i:2;i:12316;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12316;}i:91;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-03_09_47_07.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:12923;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12990;}i:93;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:220:" 除此之外，还可以通过重定向将 Log 转存到文件中。例如，下面的命令将 kmsg buffer 的内容保存到windows D盘的 kernel_kmsg.log 文件中
 D:\> adb shell cat /proc/kmsg > d:\kernel_kmsg.log";}i:2;i:12990;}i:94;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12990;}i:95;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13216;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"8  应用范围";}i:2;i:13218;}i:97;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13233;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13235;}i:99;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:614:" 只要 adb shell 可以连接，并且有访问 /proc/kmsg 的权限，那么就可以通过访问 /proc/kmsg 的方式来读取Kernel log。但是，这并不适用于调试 Kernel BUG，因为当 Kernel 有 BUG 的时候 adb 连接首先会断掉，会导致无法录取有效的
 log分析问题。其适用的场合主要是跟踪调试内核的逻辑，或者监测硬件模块的内核行为等等。由于通过cat或者其他应用程序读取Log Buffer的时候可以不断的等待新的log，所以访问 /proc/kmsg 的方式适合长时间的录取log，一旦有新的log就可以被
 录制下来.";}i:2;i:13235;}i:100;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13235;}i:101;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13857;}i:102;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"9  使用限制";}i:2;i:13859;}i:103;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13874;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13876;}i:105;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:733:" 在访问 /proc/kmsg 的时候有一些限制，主要是:
 1. 由 于 Kernel log buffer 循环缓冲区只有一个读指针，所以当一个程序在读 buffer 的时候会不断的移动 buffer 的读指针，这样当有多个程序读取 buffer 的时候每个程序得到的log都不是完整的。所以当访问 /proc/kmsg 的时候务必
 保证没有其它程序读取 Kernel Log Buffer。
 2. /proc/kmsg的Owner是root，群组属于System，所以在user版本上面是无法通过adb shell读取 Kernel Log Buffer的。安装在手机上的应用也是无法读取这个buffer的。
 如果只是想看看当前 Log Buffer 里面的内容，而不是一直录 Log 下去，那么请参考下面的章节 “dmesg”。";}i:2;i:13876;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13876;}i:107;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:14621;}i:108;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"10  Dmesg";}i:2;i:14623;}i:109;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:14632;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14634;}i:111;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1018:" 前面 kmsg 的章节讲述了通过 /proc/kmsg 访问 Kernel log buffer 的方式，其主要限制是不能有多读者，即不能多个程序同时访问 Kernel Log Buffer，否则每一个访问程序得到的结果都是不完整的。但有些时候我们可能并不知道系统里面
 有哪些后台进程在读取 Kernel Log Buffer，这个时候我们如何获取到可信的 Kernel Log呢？系统（Android 或者大多数 Linux 发行版）里面还有另外一个工具，dmesg。dmesg是一个二进制可执行程序，我们可以在 adb shell 执行它，
 例如：adb shell dmesg
 上述命令会将整个Log Buffer 从头到尾dump到输出设备，然后就退出了。它不会操作读指针，它只根据写指针把从最旧的log到最新的log完完整整的输出来。所以这种方式也不会受到其它 Log Buffer 读者的影响。
 dmesg 的输出与 /proc/kmsg 的输出是一致的，区别是 dmesg dump 完 Kernel Log Buffer 就直接退出了。如下是dmesg 的输出。";}i:2;i:14634;}i:112;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14634;}i:113;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-04_16_44_58.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:15664;}i:114;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15731;}i:115;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1104:" dmesg 的使用场景与 /proc/kmsg 的场景是大致相同的，同样，不适合调试 Kernel BUG，当 Kernel 出现 BUG 的时候 dmesg 作为 user space 程序首先就无法正常执行了，所以没办法录取到有效的 log 来分析问题。
 其适用的场合主要是跟踪调试内核的逻辑，或者监测硬件模块的内核行为等等。dmesg 会完完整整的 dump 一次Kernel Log Buffer，所以不会丢失掉任何的Log。
 使用dmesg 来获取 Kernel Log 也有一些限制，如下：
 1. dmesg 只会一次性 dump Kernel log buffer，所以只能得到当下的 log 部分，由于 Log buffer 的大小是有限制的，在很短的时间内就可能把旧的 Log 覆盖掉，所以有可能来不及抓到旧的部分，如果 Log 量比较大，那么能够抓到的
  Log 时间就很短了。所以不适合Log 量比较大的情况，也不适合长时间跟踪内核行为。
 2. dmesg 的执行需要有 root 权限才行。所以 Android user 版本是无法使用这个工具的。如果需要长时间录取 Log，那就需要访问 /proc/kmsg 的方式。";}i:2;i:15731;}i:116;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15731;}i:117;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:16849;}i:118;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"11  UART log";}i:2;i:16851;}i:119;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16863;}i:120;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16865;}i:121;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:2781:"  /proc/kmsg 文件节点映射 Kernel Log Buffer，或者 dmesg dump Kernel Log Buffer 实际都是直接从 Buffer 里面获取 Log。在 Kernel Log 章节有讲过，所有的 Kernel Log 都会一字不漏的全部写入的 Buffer 中，所以通过访问
  Log Buffer 的方式获取的 Kernel Log 是最完整的。在Kernel Log 章节也有提到 Kernel Log 除了输出到 Buffer 之外，还会将一部分 Log 输出的到 Console。所以通过 UART 也是可以获取 Kernel Log的。（具体输出哪些 Log 
  取决于设定的 log level。更详细的信息请参考 Kernel Log 章节。）
  UART 用于 Logging 是极其广泛的，除了 Linux Kernel 默认将其作为 Console 以外，系统其它的部分，如 bootloader 的 Debug 也和 UART Log 紧密相关。所以 UART Log 对于整个系统的 Debug，尤其是开机和关机流程至关重要。
  但是Phone 或者 Tablet 通常都不会留出直接的 UART 接口，而只是在电路板上面留出 UART 测试点，所以抓取 UART Log 就会相对麻烦一点，首先就要准备 UART cable 以及搭建抓取 UART Log 的环境.
  UART Cable:  UART Cable 的样子通常如下所示，一头的 USB 插口内部内置了 USB 转 UART 的芯片，可以在 PC 端模拟一个 UART COM 口。而另一头通常为了方便通常做成夹子或者钩子的方式，也可以直接焊接在板子的焊点上面。
  但是有一点务必要注意：UART Cable 一定要是 1.8V 标准的，否则会抓不到 UART Log。
  UART Port 配置:
  抓取 UART Log 的时候应该把 UART Cable 连接到哪一个 UART Port呢？这取决于 Preloader 里面的客制化。
  对于 ABS Turnkey 的软件包，UART Port 的配置在下面的两个文件中。（如果以下两个文件同时存在请以 cust_bldr.mak 中的配置为准）
  alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 
  alps/mediatek/custom/$PROJECT/preloader/inc/cust_bldr.h
  在alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 文件中可以修改 CFG_UART_LOG 定义，默认是UART1，波特率921600。
  CFG_LOG_BAUDRATE :=921600 
  CFG_UART_LOG :=UART1
  在alps/mediatek/custom/$PROJECT/preloader/cust_bldr.mak 文件中可以直接修改宏定义。如下所示：
  #define CFG_LOG_BAUDRATE (921600) 
  #define CFG_UART_LOG     (UART2)
  对于AOSP Turnkey 的软件包，UART Port 的定义在文件 alps/bootable/bootloader/preloader/custom/$PROJECT/cust_bldr.mak 中。
  CFG_LOG_BAUDRATE :=921600 
  CFG_UART_LOG :=UART1
  NOTE：修改 UART Port 的配置之后重新编译 Preloader 即可。
  另外一点需要注意的是在 preloader 代码里面配置的 uart port 是从 UART1 开始的，但是 PCB layout 的标号有可能是从 UART0 开始的，要注意两边的对应关系。";}i:2;i:16865;}i:122;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16865;}i:123;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:19694;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"12 如何通过 UART 执行 Linux Native 程序？";}i:2;i:19696;}i:125;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:19746;}i:126;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19748;}i:127;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:284:"  此方法仅适用 ENG 版本。必须同时连接好UART RX/TX。
  在UART串口终端不断的敲回车键就可以敲出命令提示符，如下，这就相当于在串口终端里面拿到了 Linux的shell，在这个shell里面可以执行任何shell命令，如top，ps等等";}i:2;i:19748;}i:128;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19748;}i:129;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-04_16_52_21.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:20038;}i:130;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20105;}i:131;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:65:"  如下图所示就是在 UART Shell 里面执行 top 的结果:";}i:2;i:20105;}i:132;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20105;}i:133;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-04_16_53_12.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:20174;}i:134;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20241;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20241;}i:136;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:20243;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"13  如何通过 UART 抓取 Android Log？";}i:2;i:20245;}i:138;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:20288;}i:139;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20290;}i:140;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:471:" 1： 此方法仅适用 ENG 版本。 
 2： 必须同时连接好UART RX/TX。
 同上，如果执行的 Native 程序是 logcat，那么 Android main log 就可以同时被抓取在UART终端上面。如下是执行 "logcat -v time &" 的结果，注意末尾的&符号，务必要加上它，不然由于 logcat会阻塞住shell，
 就会导致无法再输入其它任何命令了。从下图我们可以看出，UART log 和 Android Log 已经被抓在一起了。";}i:2;i:20290;}i:141;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20290;}i:142;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-04_16_56_01.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:20771;}i:143;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20838;}i:144;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:540:" NOTE：有时候 Log 比较多，我们输入进去的命令可能会被其他 Log 打断，我们可以不用管它，完整输入完命令之后敲回车键即可。（UART 的输入和输出是分开的，印 Log 并不会影响输入的命令）
 注: UART Log 对分析问题的帮助是很大的，能够弥补其它 Log 工具的不足。但是 UART Port 受到波特率的限制，如果 Log 量比较大就会导致 Log 丢失。
 由于UART Log对Performance有影响，如果是 Debug Performance问题则无法依赖UART Log。";}i:2;i:20838;}i:145;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20838;}i:146;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:21386;}i:147;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"14  Last_kmsg";}i:2;i:21388;}i:148;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:21401;}i:149;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21403;}i:150;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1178:" 讲 last_kmsg 首先就要再讲 RAM Console。在 Kernel Log 章节我们有讲过 Kernel Log 除了输出到 Kernel Log Buffer 以外还会输出到 Console，在 MTK Turnkey 方案里面 Log Console 有两个，一个是 UART Console，
 一个是RAM Console。RAM Console 设备驱动同样在 RAM 里面实现了一个 Ring Buffer。那为何有了 Kernel Log Buffer 还要再另外实现一个 RAM Console 的 Buffer 呢？是否多此一举？对于这个问题首先要搞清楚
 RAM Console 设计的初衷。举 一个例子，重启问题的分析。当 Linux Kernel 出现 BUG 的时候，后走入 panic flow，这个时候由于 Kernel 出现了严重的问题，Native 程序全部都无法运行，adbd 也无法响应 adb 连接请求，
 这个时候想透过读取 Kernel Log Buffer 来看 Kernel Log 是不可能的。那怎么办？由于 Console Log 是不需要下任何命令就可以查看的，所以可以抓取 UART Log 分析，但是抓 UART Log 就要飞线，就会比较麻烦，有没有一种
 简单的方法可以让我们知道系统大概发生了什么事情呢？那就是 RAM Console Log。下图所示是 RAM Console 的工作原理:";}i:2;i:21403;}i:151;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21403;}i:152;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:55:":playgroud:6735:screenshot_from_2016-03-04_16_58_47.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:22593;}i:153;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22660;}i:154;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1953:" 其大致的工作流程如下：
 1. 当系统开机初始化好 RAM Console Buffer 的时候就会开始进行 Logging，关于如何 Logging 的部分可以再参考一下 printk 那幅图。 
 2. 一旦系统发生严重异常就会发生重启。 
 3. 重启后系统启动又会开始初始化 RAM Console Buffer，在初始化 RAM Console Buffer 之前 Buffer 里面还保存了重启前的 Log 信息，在初始化的时候可以先将重启前的 Log 备份到另外一个 Buffer。 
 4. 备份的 Buffer 可以通过 cat /proc/last_kmsg 来访问其中的内容。
 通过上述的机制我们就可以在重启后通过 /proc/last_kmsg 来查看重启前发生了什么事情。
 RAM Console 机制在 MTK Turnkey 方案中是一直打开的，它主要可以帮助我们理清两件事情：
    1. 系统是否发生了重启。因为 /proc/last_kmsg 只有重启之后才会存在，所以只要 /proc/last_kmsg 存在我们就知道系统重启过了。（不是所有的重启都是异常重启） 
    2. 如果系统重启了，我们可以根据 /proc/last_kmsg 的内容查看重启前系统都做了什么事情。
    当然我们在 RAM Console header 里面还记录了 CPU hotplug 的情况以及 Hardware Watchdog Timeout Flow 的执行情况，以帮助 Debug 问题。
  last_kmsg 能够保存的信息比较少，这主要受制于 Internal SRAM 的大小。那为什么一定要放在 Internal SRAM 呢？
  在早期的平台，如 MT6589，系统重启的时候会将 DRAM 内容复位，这导致了 RAM Console Buffer 无法放在外部 DRAM。 Internal SRAM 位于 CPU 内部，是比较稳定的 module，可以 Cover 到 
  DRAM 不稳定的问题。所以虽然在 MT6572 以及之后的平台可以支持重启的时候保持住 DRAM 的内容，但是也没有在外部 DRAM 来实现 RAM Console。
  所以，last_kmsg 的内容通常都会很少，约 7KB 左右，用来作为 Debug 问题时候的参考。";}i:2;i:22660;}i:155;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22660;}i:156;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:24643;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"15  Logcat";}i:2;i:24645;}i:158;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:24655;}i:159;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24657;}i:160;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1439:" 用法
 命令格式如下，在<option>可以指定一些选项，比如输出格式，指定 buffer 等；而在<filter-spec>中可以指定过滤规则。
 [adb] logcat [<option>] ... [<filter-spec>] ...
 logcat 可以作为 adb command 来执行，利用 target 上面的 adb daemon 来操作 log buffer。 
 adb logcat -v threadtime
 也可以通过 adb 建立的 shell，在 shell 里面执行 target 上面的 logcat 程序来操作 log buffer。
 adb shell logcat -v threadtime
 
 常用操作
 详细的使用方式请参考 Android Developer 上面的介绍，这里仅对常用操作进行举例。
 1. 如何抓取有效 log？
 adb logcat -v threadtime > main_log.txt
 此种方式为最常用的抓取方式，会将 log 的 PID，TID，TAG 以及时间戳都打印在一行 log 里面。优先使用此种方式抓取 log，一定不要仅仅敲 adb logcat 来抓取 log，adb logcat 仅仅会将一些基本的信息打印出来，
 缺少时间戳信息对于分析问题是困难的。
 2. 如何仅仅抓取某个 TAG 的 Log？
 可以使用<filter-spec>来过滤某一些 log，<filter-spec>的格式是 <TAG>:<Priority>.
 adb logcat -v threadtime ActivityManager:D *:S
 上面的命令可以仅打印 ActivityManager 等于和高于 debug 级别的log，它指定了 ActivityManager 最低 Log 级别为 debug，用 * 来匹配其他所有 TAG，并将其它所有 TAG 设置为 silent 级别，即不输出任何Log";}i:2;i:24657;}i:161;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24657;}i:162;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:26134;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"16  MTKlogger";}i:2;i:26136;}i:164;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:26149;}i:165;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26151;}i:166;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1627:" MTKLogger 是 MediaTek 开发的一个 target 端 Logging 工具，它由几个 daemon 以及一个 UI Application 构成。其中 daemon 负责不断的将 Log Buffer 里面的新 Log 复制到 sdcard 上面，而 UI Application
 则可以控制 Daemon 的打开和关闭，占用 sdcard 空间的大小，某一种 Log 的抓取和关闭等等。
 MTKLogger 是一个在移动测试当中应用非常广泛的工具，它不需要连接 PC 即可抓取各种 Log，包括 android log，kernel log，bluetooth log， network log 以及 modem log。
 在 eng 版本上面，Laucher 桌面有一个 MTKLogger 的 应用图标，点击就可以进入 MTKLogger 应用
 但是这个图标在 user 版本上是不会出现的，所以在 user 版本上面需要从工模里面来打开 MTKLogger，进入工模的默认方法实在拨号界面输入 *#*#3646633#*#*，具体方式需要根据工模的客制化入口来进入。进入工模之后在 Log 
 and Debugging 页面就可以找到 MTKLogger了。如下所示：
 进入 MTKLogger 之后就可以看到如下的主界面，上面显示了如下信息：
 1. 运行时间。从打开 MTKLogger 开始录制 Log 开始到目前一共录制了多长时间。 
 2. 各个 Log 的录制状态，如下所示表示 Mobilelog/ModemLog/NetworkLog 都处于录制状态，如果某种 log 没有录制则会显示为灰色。 
 3. storage的使用状态。显示了storage的使用空间和剩余空间。 
 4. 快捷按钮。从左到右依次为 TagLog 按钮，启动/停止按钮，清除 Log 按钮。 
 5. 详细配置按钮，点击按钮可以进入详细配置页面。";}i:2;i:26151;}i:167;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:26151;}i:168;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:27804;}i:169;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"17  如何在User版本中使用串口(Uart)";}i:2;i:27806;}i:170;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:27850;}i:171;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:221:"
   alps/mediatek/config/common/autoconfig/kconfig/USER
   如果版本一致的话，应当是这个文件的37行
   CONFIG_COMLINE=”console=ttyMT3,921600n1 loglevel=0”
   您把最后的loglevel = 8 即可.";}i:2;i:27852;}i:172;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28073;}i:173;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:51:" 抓UART Log的时候会看到类似下面的Log。";}i:2;i:28073;}i:174;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28073;}i:175;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:196:"   [   25.986567].(1)[324:Binder_1][usktrk] socket close[10422]
   [   25.987748].(1)[324:Binder_1]BOOTPROF:     25987.740155:BOOT_Animation:END
   [   25.988616].(1)[324:Binder_1]";}i:2;i:28128;}i:176;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"<<";}i:2;i:28324;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" printk console disable ";}i:2;i:28326;}i:178;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:">>";}i:2;i:28350;}i:179;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:511:"
   要关闭此功能，可以进行如下操作:
   有三种种方法可以重新打开UART log：
   1. 在超级终端窗口按下键盘的任何一个按键就可以让UART log继续吐。此种方式需要UART的TX和RX都要连接好。
   2. 通过修改proc参数的方式： adb shell echo 1 > /proc/mtprintk
   3. 通过设置system property: 
    使用： UART:command: setprop persist.uartconsole.enable 1
          ADB Shell: adb shell setprop persist.uartconsole.enable 1";}i:2;i:28352;}i:180;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28863;}i:181;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28863;}i:182;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:28865;}i:183;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"18  如何在Uart 上抓取上层LOG";}i:2;i:28867;}i:184;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:28903;}i:185;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28905;}i:186;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:182:"  Uart 上进行输入，实际就是开启了一个sh 对接起来，所以绝对不能在uart 上输入一个长命令(不可中断)，否则uart 将被卡住，不能再输入。";}i:2;i:28905;}i:187;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28905;}i:188;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:190:"    抓取上层log, 我们通常需要call logcat, 但logcat 是不可中断的，将导致uart 不能再输入。
    处理的方法即将logcat 转入后台执行，如下操作即可:";}i:2;i:29091;}i:189;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:29281;}i:190;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:283:"  Main log: logcat -v time &
  Radio log: logcat -v time -b radio &
  Event log: logcat -v time -b events &
  如果想关闭上层log, 直接ps 查阅前面开启的logcat process pid, 然后kill -9 pid 杀掉即可。
  注意一定要带“&”，否则将block 住uart输入";}i:2;i:29281;}i:191;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:29281;}i:192;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:29576;}i:193;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"19  如何开启Uart 的控制台(console/sh)";}i:2;i:29578;}i:194;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:29623;}i:195;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:29625;}i:196;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:275:"  Uart 控制台的开启，决定于System property ro.debuggable，默认如果ro.debuggable=1 则开启(Eng 版本)，User 版本ro.debuggable=0 则关闭。
  想在User 版本中打开，需要更新alps/mediatek/config/mt65xx/init.rc, 在init.rc 的触发器代码：";}i:2;i:29625;}i:197;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:29625;}i:198;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:208:"    on property:ro.debuggable=1
    start console
   后面增加:
   on property:ro.debuggable=0
   start console 
   然后重新编译bootimage 即可， ./mk [project_name] new bootimage ";}i:2;i:29906;}i:199;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:30115;}i:200;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:30:" 
               ";}i:2;i:30115;}i:201;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30151;}i:202;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:30151;}}