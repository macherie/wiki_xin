a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"FreeScale 编译时需要安装的工具";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:498:"
1. sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev

2. sudo apt-get install libsdl1.2-dev xterm sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 help2man make gcc g++ desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc

3. Ubuntu 12.04  系统
   $ sudo apt-get install uboot-mkimage
4. Ubuntu 14.04  系统 
   $ sudo apt-get install u-boot-tools
   ";}i:2;i:52;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:573;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"FreeScale 编译命令";i:1;i:2;i:2;i:573;}i:2;i:573;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:573;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:417:" 1.配置参数，搭建环境变量
   MACHINE=imx6ulevk source fsl-setup-release.sh -b build -e fb
   其中imx6ulevk为平台的conf，build目录是编译的目录，由于该项目不带屏幕 -e 后面的参数随意
 2.编译
   运行完上面的命令，会自动进入到build目录，编译命令如下:
   bitbake core-image-base
 3.等待编译成功后，生成的文件在build/temp/deloy/images下
   ";}i:2;i:607;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:607;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:607;}}