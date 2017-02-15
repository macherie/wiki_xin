a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"L版本不同模式下的uart行为不一样：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:48;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:48;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:147:"user mode：
lk log default 吐出 (preloader log 视不同branch而定，有的默认吐出，有的默认不吐出)，kernel log default不吐出";}i:2;i:51;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:198;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:198;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:162:"userdebug mode：
bootloader log 行为与user mode相同，lk结束后需要按键kernel log才会吐出，lunch后uart又关闭，按键后才可以继续吐出";}i:2;i:201;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:363;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:363;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:143:"eng mode：
bootloader log default 吐出，lk结束后kernel log default 吐出，lunch后uart自动关闭，需要按键才可以继续吐出";}i:2;i:366;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:509;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:509;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:139:"注：在超级终端窗口按下键盘的任何一个按键可以让UART log继续吐，此种方式需要UART的TX和RX都要连接好。";}i:2;i:512;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:651;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:651;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"[SOLUTION]
 1. 在lunch之后，如何令kernel log自动吐出？";}i:2;i:654;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:720;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:307:"  方法一：设置属性adb shell setprop persist.uartconsole.enable 1, 然后重新开机抓uart log
             (需要有root权限，适合eng版本和userdegbug 版本)
  方法二：修改code
             在/kernel-3.10/kernel/printk.c 中mt_disable_uart()中，将printk_disable_uart=1修改为0";}i:2;i:720;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:720;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:" 2. 在user mode和userdebug mode，如何令kernel log在lk结束后自动吐出？";}i:2;i:1037;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1121;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:593:"  方法一：fastboot comand
              1)  按volumn up + power key进入 bootmenu 选择fastboot mode
              2)  usb连接PC端，执行命令fastboot oem p2u on
              3)  执行fastboot  continue命令
  方法二：修改code
             在/bootable/bootloader/lk/app/mt_boot/mt_boot.c里修改：
   if (!has_set_p2u) {
   #ifdef USER_BUILD
   sprintf(cmdline,"%s%s",cmdline," printk.disable_uart=1");  // printk.disable_uart=1 改为0
   #else
   sprintf(cmdline,"%s%s",cmdline," printk.disable_uart=0 ddebug_query=\"file *mediatek* +p ; file *gpu* =_\"");
   #endif";}i:2;i:1121;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1121;}}