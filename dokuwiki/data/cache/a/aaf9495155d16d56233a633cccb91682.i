a:57:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5;}i:5;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:6;}i:6;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:15:"shu.yin@sim.com";i:1;s:6:"尹姝";}i:2;i:8;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" 2013/12/10";}i:2;i:34;}i:8;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:45;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:47;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:48;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Android 编译环境安装";i:1;i:1;i:2;i:48;}i:2;i:48;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:48;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:90;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"安装 Java 6";i:1;i:2;i:2;i:90;}i:2;i:90;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:90;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:90;}i:17;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:17:"ubuntu:安装java";i:1;s:13:"安装 Java 6";}i:2;i:116;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:151;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:151;}i:20;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:20:"ubuntu:安装openjdk";i:1;s:14:"安装open JDK";}i:2;i:153;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:192;}i:22;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:194;}i:23;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"安装依赖包 (Ubuntu 12.04)";i:1;i:2;i:2;i:194;}i:2;i:194;}i:24;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:194;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:387:"
$ sudo apt-get install git gnupg flex bison gperf build-essential \
  zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
  libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos \
  python-markdown libxml2-utils xsltproc zlib1g-dev:i386
$ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
";i:1;s:4:"bash";i:2;N;}i:2;i:241;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:241;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:"这里注意非android2.3.6代码编译，下面命令不需要去配置，否则编译的时候会报错，(找不到gcc路径";}i:2;i:643;}i:28;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:770;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:")
";}i:2;i:773;}i:30;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:775;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:" 如果要编译 android2.3.6 代码，还需要如下配置 ";}i:2;i:777;}i:32;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:838;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:840;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:846;}i:35;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:286:"
$ sudo apt-get install linux-libc-dev:i386 libc6-dev:i386 lib32z1-dev imagemagick \
  gcc-4.4 g++-4.4 g++-4.4-multilib
$ sudo mv /usr/bin/gcc /usr/bin/gcc-bak
$ sudo mv /usr/bin/g++ /usr/bin/g++-bak
$ sudo ln -s /usr/bin/gcc-4.4 /usr/bin/gcc
$ sudo ln -s /usr/bin/g++-4.4 /usr/bin/g++
";i:1;s:4:"bash";i:2;N;}i:2;i:846;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:846;}i:37;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1147;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" 如果要安装高通编译工具 Hexagon，还需要安装： ";}i:2;i:1149;}i:39;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1213;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1215;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1221;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:34:"
$ sudo apt-get install ia32-libs
";i:1;s:4:"bash";i:2;N;}i:2;i:1221;}i:43;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1270;}i:44;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"编译问题";i:1;i:2;i:2;i:1270;}i:2;i:1270;}i:45;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1270;}i:46;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1293;}i:47;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:45:"编译问题：Can't locate Switch.pm in @INC";i:1;i:3;i:2;i:1293;}i:2;i:1293;}i:48;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1293;}i:49;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1293;}i:50;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1348;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"解决方法：";}i:2;i:1350;}i:52;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1365;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"
sudo apt-get install libswitch-perl";}i:2;i:1367;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1403;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1403;}i:56;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1403;}}