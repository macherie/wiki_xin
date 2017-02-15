a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:55:"解决ubuntu16.04 LTS编译android6.0版本报错问题";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:156:"Ubuntu 16.04 LTS 按照通常的 android 编译环境配置, 编译 android 4.4 是可以通过(需配置 JDK1.6), 但是编译 android 6.0 版本会抛出 ";}i:2;i:72;}i:5;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:228;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"clang: error: linker command failed with exit code 1";}i:2;i:229;}i:7;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:281;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" 的错误.";}i:2;i:282;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:293;}i:10;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:89:"
<H1>解决方法</B></font></H1>
<font size="4px"><B>安装依赖包</B></font><BR><BR>
";}i:2;i:301;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:253:"
sudo apt-get install git-core gnupg flex bison gperf build-essential \ 
zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \ 
lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \ 
libgl1-mesa-dev libxml2-utils xsltproc unzip m4
";i:1;N;i:2;N;}i:2;i:403;}i:12;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:406:"
<BR><BR>
<font size="4px"><B>修改代码</B></font><BR><BR>
文件: art/build/Android.common_build.mk<BR><BR>
将 <BR><BR>
<font size="4px"><font color="red"><B>ifneq</B></font> ($(WITHOUT_HOST_CLANG),<font color="red"><B>true</B></font>)</font><BR><BR>
修改为<BR>
<BR>
<font size="4px"><font color="red"><B>ifeq</B></font> ($(WITHOUT_HOST_CLANG),<font color="red"><B>false</B></font>)</font><BR><BR>
";}i:2;i:672;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1088;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1088;}}