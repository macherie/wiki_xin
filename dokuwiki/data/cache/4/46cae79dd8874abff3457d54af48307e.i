a:72:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"SElinux";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"4.4之前的版本在LINUX应用层需要打开下面的宏，4.3是正式完全引入SElinux，4.1.2的S300P项目证实是可以打开SElinux。
宏：";}i:2;i:19;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:178;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:14:"
HAVE_SELINUX
";i:1;N;i:2;N;}i:2;i:178;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:178;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"LINUX内核层
宏(并不是所有这些宏都需要)：";}i:2;i:201;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:263;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1013:"
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_NETWORK_XFRM is not set
CONFIG_SECURITY_PATH=y
CONFIG_LSM_MMAP_MIN_ADDR=4096
CONFIG_SECURITY_SELINUX=y
# CONFIG_SECURITY_SELINUX_BOOTPARAM is not set
# CONFIG_SECURITY_SELINUX_DISABLE is not set #关闭SELINUX
# CONFIG_SECURITY_SELINUX_DEVELOP is not set #可能可以切换Permissive模式与Enforcing模式，未定义就进入Enforcing模式，否则进入Permissive模式
# CONFIG_SECURITY_SELINUX_AVC_STATS is not set
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
# CONFIG_SECURITY_SELINUX_POLICYDB_VERSION_MAX is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
# CONFIG_SECURITY_YAMA is not set
# CONFIG_IMA is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_DEFAULT_SECURITY="selinux"
CONFIG_CRYPTO=y
";i:1;N;i:2;N;}i:2;i:263;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:263;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"网上的详细文档
blog.csdn.net/innost/article/details/19299937";}i:2;i:1286;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1353;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1353;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"下载文档
";}i:2;i:1355;}i:16;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:28:":linux:seandroid_selinux.zip";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1368;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1401;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1403;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"简介";i:1;i:2;i:2;i:1403;}i:2;i:1403;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1403;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1403;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:357:"在4.3版本之前，比如4.2，Android也或多或少在代码里集成了SElinux的部分模块，但是这些代码并没有被激活。从4.3版本开始，Android正式引入SELinux，并且开启了SELinux功能。目前的4.3版本中，作为一个SEAndroid “Beta”版本，SELinux的运行模式为permissive，即只会记录，不会拦截。";}i:2;i:1420;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1777;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1777;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"可以在Android shell通过setenforce命令来设置SELinux的模式。";}i:2;i:1779;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1851;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1851;}i:28;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:36:":linux:111111wp-display-data.php.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1853;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1894;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1894;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"查看文件的权限状态：";}i:2;i:1897;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1927;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1927;}i:34;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:35:":linux:12222wp-display-data.php.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1929;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1969;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1969;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:154:"其中u:object_r:rootfs:s0中有4个字段，分别是user, role, type, security-level，其中最重要的是type，所有的policy都围绕type展开。";}i:2;i:1972;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2126;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2126;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:594:"Android引入SELinux之后，被讨论最多的一个变化就是root。由于Android目前为每个应用设立了一个单独用户用来限制每个进程的访问权先，所以只要不root，android平台就相对来讲安全很多。在没有使用SELinux的android系统上，一旦手机被root，用户就获得了su权限，就可以对系统文件和其他应用进行操作。如果启用了SELinux，管理员就可以设置策略，限定su的访问，比如可以设置su不可以修改系统文件，这样就算手机被root，也可以保障android系统不被恶意篡改。";}i:2;i:2129;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2723;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2723;}i:43;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:35:":linux:33333wp-display-data.php.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:2725;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2765;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2765;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"（图片转自：";}i:2;i:2767;}i:47;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:56:"http://blog.csdn.net/yiyaaixuexi/article/details/8490886";i:1;N;}i:2;i:2785;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"）";}i:2;i:2841;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2844;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2844;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:352:"另外一个关于root的敏感话题是“root手机”。目前android上大部分的root方法是在注入代码到具有su权限系统模块中去，对于启用了SELinux的android系统，就可以配置策略禁用对系统模块进行类似的操作，比如发送socket数据，所以SELinux的启用一定程度上也增加了root的难度。";}i:2;i:2847;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3199;}i:53;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3199;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:159:"由于SELinux引入android不久，还有很多不完善的地方。在DEFCON 21上，来自viaForensics的Pau Oliva就演示了几个方法来绕过SEAndroid(";}i:2;i:3202;}i:55;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:91:"https://viaforensics.com/mobile-security/implementing-seandroid-defcon-21-presentation.html";i:1;N;}i:2;i:3361;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:")：";}i:2;i:3452;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3456;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3456;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"1. 用恢复模式（recovery）刷回permissive模式的镜像";}i:2;i:3458;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3521;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3521;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"2. Su超级用户没有设置SELinux的模式，但是system user系统用户可以。";}i:2;i:3523;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3609;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3609;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"3. Android通过/system/app/SEAndroidManager.apk来设置SELinux模式，所以只要在recovery模式下将其删除就可以绕过";}i:2;i:3611;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3743;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3743;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"4. 在Android启动时直接操作内核内存，通过将内核里的unix_ioctl符号改写成reset_security_ops重置LSM（Linux Security Modules）";}i:2;i:3745;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3895;}i:70;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3895;}i:71;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3895;}}