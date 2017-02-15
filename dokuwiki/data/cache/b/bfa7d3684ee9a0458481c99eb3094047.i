a:18:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"设置编译环境前注意";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:660:"  1. 如果您之前已经安装过了编译环境，比如已经有高通平台的编译环境，或者MTK平台的其他OS版本，如 KK版本的。
     您就可以跳过 “MT6735编译时需要安装的工具” 步骤，然后检查openjdk1.7是否已经安装
  2. 如果您的 OpenJDK 版本已经是1.7版本了，可以通过：java -version 命令查看jdk的版本
     您也可以跳过 “MT6735编译时需要安装的工具” 和 “OpenJdk1.7 安装” 步骤，直接进行编译
  3. 编译过程中如果出现错误类似于库文件或者工具找不到的情况，可以参考 “编译过程中出现的错误以及解决方法”  ";}i:2;i:39;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:711;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"MTK6735 编译时需要安装的工具";i:1;i:2;i:2;i:711;}i:2;i:711;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:711;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:651:"
1. Ubuntu 12.04 64bit 系统
   sudo apt-get update
   sudo apt-get install -y git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 g++-multilib mingw32 tofrodos libgl1-mesa-dev python-markdown libxml2-utils xsltproc zlib1g-dev:i386

2.Ubuntu 14.04 64bit 系统      
   sudo apt-get update
   sudo apt-get install bison g++-multilib git
   sudo apt-get install gperf libxml2-utils make python-networkx zlib1g-dev:i386 zip build-essential
   
   To build KK，JB on Ubuntu 14.04
   sudo apt-get install flex mingw32 tofrodos libswitch-perl
   ";}i:2;i:760;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1439;}i:9;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"OpenJdk1.7 安装";i:1;i:2;i:2;i:1439;}i:2;i:1439;}i:10;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1439;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:229:"  安装步骤如下:
    sudo apt-get update
    sudo apt-get install openjdk-7-jdk
  如果之前您安装了jdk1.6 需要执行以下步骤
    sudo update-alternatives --config java
    sudo update-alternatives --config javac";}i:2;i:1467;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1717;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:48:"编译过程中出现的错误以及解决方法";i:1;i:2;i:2;i:1717;}i:2;i:1717;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1717;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:436:"1. 编译过程中出现: gcc: error trying to exec 'cc1plus': execvp: No such file or directory
   解决方法:
     sudo apt-get update
     sudo apt-get  install g++
   
2. xmllint: command not found
   解决方法:
     sudo apt-get update
     sudo apt-get  install libxml2-utils
   
3. 如果编译过程中还有其他的类似的错误的，您可以百度以下把对应的库文件或者需要的工具安装上就可以了.";}i:2;i:1776;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1776;}i:17;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1776;}}