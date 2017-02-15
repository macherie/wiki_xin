a:34:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"1.编译:";i:1;i:4;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1;}i:3;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:32:"
source cbsdk_build.sh make -j4
";i:1;N;i:2;N;}i:2;i:22;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"添加的代码路径:";}i:2;i:63;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:91;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"
CBSDK_141209_for_can/vendor/simcom/CBSDK/
";i:1;N;i:2;N;}i:2;i:91;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:91;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"客户APK替换的位置";}i:2;i:144;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:174;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:111:"
HomeBox.apk  HomeBoxInstaller.apk
CBSDK_141209_for_can/vendor/simcom/CBSDK/packages/thirdparty/msm8610_CBSDK/
";i:1;N;i:2;N;}i:2;i:174;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:174;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"代码生成";}i:2;i:295;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:313;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:36:"
CBSDK_141209_for_can/target_files/
";i:1;N;i:2;N;}i:2;i:313;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:313;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:129:"下载工具SaharaFirehouseDL, config  -  密码1  -  load,然后改路径, 填写9008的端口号(com号), 出来直接点下载";}i:2;i:359;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:494;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:68:"
smb://192.167.100.225/share/项目分类/homebox/SaharaFirehouseDL
";i:1;N;i:2;N;}i:2;i:494;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:494;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"SVN拉下来的2.1或者2.3 CBSDK直接拷贝进下面的目录:";}i:2;i:572;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:642;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"
vendor/simcom/
";i:1;N;i:2;N;}i:2;i:642;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:668;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"2.搭建编译环境:";i:1;i:4;i:2;i:668;}i:2;i:668;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:668;}i:27;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1851:"
Environment Building
2.1. Install Ubuntu
Install Ubuntu 12.04 LTS 64bits on your computer.
2.2. Install necessary packages
$ sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev
libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline-gplv2-dev
lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils
xsltproc
2.3. Make bash as the default shell
sudo dpkg-reconfigure dash
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh
2.4. Install JDK
Mothed 1
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update
sudo apt-get install sun-java6-jdk
Mothed 2
2.4.1 Download Java SE 1.6.0 Update 45
Download the jdk-6u45-linux-x64.bin file that version is Java SE 1.6.0 Update 45 from
http://www.oracle.com.
2.4.2 Enter the file directory
2.4.3 Changes the file mode
Chmod a+x jdk-6u45-linux-x64.bin
2.4.4 Run the programe to unpack
./jdk-6u45-linux-x64.bin
2.4.5 Create directory and copy
mkdir -p /usr/lib/jvm/
sudo mv jdk1.6.0_45 /usr/lib/jvm/
2.4.6 Set environment variables
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_45/bin/javac 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_45/bin/java 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws 1
vi ~/.bashrc
Add following codes:
4export PATH=$PATH:/usr/lib/jvm/jdk1.6.0_45/bin/
2.4.7 Check the JDK version
$java -version
Make sure it displays as follow.
java version "1.6.0_45"
Java(TM) SE Runtime Environment (build 1.6.0_45-b06)
There is another method to install JDK.Skip if JDK is already.
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update
sudo apt-get install sun-java6-jdk
Caution: If OpenJDK has been installed, remove it.
";i:1;N;i:2;N;}i:2;i:701;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2562;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"3.服务器";i:1;i:4;i:2;i:2562;}i:2;i:2562;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:2562;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:42:"
172.19.2.76
用户名xtqt
密码  空格
";i:1;N;i:2;N;}i:2;i:2585;}i:32;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2637;}i:33;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2637;}}