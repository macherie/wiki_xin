a:84:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"Android添加pppoe拨号功能";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:89:"在android下有自带拨号用的pppd,位于/system/bin下，另外还需要移植pppoe.";}i:2;i:45;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:135;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:135;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"1.pppoe的移植";i:1;i:2;i:2;i:135;}i:2;i:135;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:135;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:135;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:97:"用开源的rp-pppoe来编译生成pppoe client端执行程序。
附件是rp-pppoe-3.10代码。";}i:2;i:164;}i:11;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:29:":android:rp-pppoe-3.10.tar.gz";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:261;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:295;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:295;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"把代码解压放在extern/下面，编写Android.mk，见附件：";}i:2;i:297;}i:15;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:23:":android:android_mk.doc";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:365;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"
编译后生成system/xbin/pppoe，push到机器内，adb push pppoe /system/xbin/pppoe";}i:2;i:393;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:481;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:483;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"2.kernel侧添加pppoe支持";i:1;i:2;i:2;i:483;}i:2;i:483;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:483;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:483;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"CONFIG_PPP=y";}i:2;i:524;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:536;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:536;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"CONFIG_PPP_ASYNC=y";}i:2;i:538;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:556;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:556;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"CONFIG_PPP_SYNC_TTY=y";}i:2;i:558;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:579;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:579;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"CONFIG_PPP_DEFLATE=y";}i:2;i:581;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:601;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:601;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"CONFIG_PPP_BSDCOMP=y";}i:2;i:603;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:623;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:623;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"CONFIG_PPPOE=y";}i:2;i:625;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:639;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:639;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"CONFIG_N_HDLC=y";}i:2;i:641;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:656;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:656;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"CONFIG_UNIX98_PTYS=y";}i:2;i:658;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:678;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:678;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"编译生成boot.img，烧录进机器。";}i:2;i:680;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:721;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:723;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"3.拨号验证";i:1;i:2;i:2;i:723;}i:2;i:723;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:723;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:723;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:354:"测试环境：由于s200没有RJ45接口，我家里的测试环境如下：
1.家里网口端用网线接我的无线路由器的LAN口，注意是LAN口，不是WAN口！这样的目的是想让s200和无线路由器以及pppoe server端在一个局域网环境，使得pppoe server端可以接收pppoe拨号时的包。
2.s200连接无线路由器。";}i:2;i:752;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1106;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1106;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"测试命令：
#adb shell
#/system/bin/pppd pty ";}i:2;i:1108;}i:56;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1157;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"/system/xbin/pppoe -p /etc/ppp/pid.pppoe -I wlan0 -T 80 -U -m 1412 -D /system/pppoe112.txt";}i:2;i:1158;}i:58;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1248;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:173:" noipdefault noauth default-asyncmap nodefaultroute hide-password nodetach usepeerdns mtu 1492 mru 1492 noaccomp nodeflate nopcomp novj novjccomp user slB207 password slB207";}i:2;i:1249;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1422;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1422;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:196:"注意上面的两个slB207就是拨号用的用户名和密码。
调用上面的命令后，如果拨号成功，可以通过netcfg看到ppp0已经UP等相关信息。
#netcfg
PPP0 UP xxxxxx XXX";}i:2;i:1424;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1620;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1620;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"此时尝试ping百度的ip
#ping 202.108.22.5
发现ping不通";}i:2;i:1622;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1685;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1685;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:112:"调用下面命令添加路由
#route add -net 0.0.0.0 netmask 0.0.0.0 dev ppp0
再ping发现可以ping通了。";}i:2;i:1687;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1799;}i:70;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1799;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"#ping ";}i:2;i:1801;}i:72;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:20:"http://www.baidu.com";i:1;s:13:"www.baidu.com";}i:2;i:1807;}i:73;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"
发现不通，肯定dns有问题";}i:2;i:1820;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1854;}i:75;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1854;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:"设置dns
#setprop net.dns1 10.127.127.1
再ping，可以ping通
#ping ";}i:2;i:1856;}i:77;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:20:"http://www.baidu.com";i:1;s:13:"www.baidu.com";}i:2;i:1927;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1940;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1940;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"结束。";}i:2;i:1942;}i:81;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1951;}i:82;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1953;}i:83;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1953;}}