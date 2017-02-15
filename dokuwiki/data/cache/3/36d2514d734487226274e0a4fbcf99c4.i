a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"APQ8096编译";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:28;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"编译错误";i:1;i:3;i:2;i:28;}i:2;i:28;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:28;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"错误1. error writing to /tmp/ccu89tUy.s: No space left on device
参考";}i:2;i:50;}i:8;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:45:"http://www.cnblogs.com/hahawgp/p/3601942.html";i:1;N;}i:2;i:123;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" 或
";}i:2;i:168;}i:10;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:94:"http://sharadchhetri.com/2014/02/25/fatal-error-error-writing-tmpccwajc9z-s-space-left-device/";i:1;N;}i:2;i:173;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:267;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:84:"
这是由于/tmp已满，解决方法如下：
rm -fr /tmp/*
umount /tmp
mount -a

";i:1;N;i:2;N;}i:2;i:274;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:366;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:366;}}