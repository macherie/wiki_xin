a:28:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"关于android 6.0+ Theme.NoDisplay_导致应用崩溃解析";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:62;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:64;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:64;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:66;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"1. 现象";}i:2;i:68;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:77;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:79;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:430:" 将S700（Android 5.0）上的OSUpdate（project_dir/vendor/qcom/proprietary/qrdplus/OSUpdate）移植到PSB01（Android6.0）之后编译相应的版本并烧到设备中去
 使用OSUpdate执行OTA升级，选择相应的ota升级包之后程序崩溃并抛出：java.lang.IllegalStateException: Activity {com.qualcomm.update/com.qualcomm.update.InstallReceiver} did not call finish() prior to onResume() completing错误信息";}i:2;i:79;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:79;}i:13;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:20:":playgrond:error.png";i:1;s:0:"";i:2;s:6:"center";i:3;s:4:"1000";i:4;s:3:"700";i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:516;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:552;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:552;}i:16;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:554;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"2. 原因";}i:2;i:556;}i:18;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:565;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:567;}i:20;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1618:" 此崩溃只会在Android6.0+（targetSdkVersion is 23 or higher）中才会出现，在下属第一个链接中，将此问题归于Android M的一个BUG。
 主要操作是因为在开发应用程序过程中将其中一个Activity或者多个Activity使用了“Theme.NoDisplay”这个主题。当我们在Activity的OnCreate函数中所做的操作过多，
 比如启动一个服务，然后调用finish()结束当前Activity或者调用startActivityForResult()并在onActivityResult()中调用finish()时都由可能出现
 IllegalStateException。下属第二篇文章中有以下一段话：
    “The issue that was filed on the M Developer Preview about this ran into the problem when trying to show a Dialog from onCreate(). The issue went nowhere.”
  在我们OSUpdate中就是因为为InstallReceiver这个Activity设置了NoDisplay主题并且在onCreate中要求显示一个dialog让用户选择是否需要升级才导致应用崩溃；
 
 以下附上文章链接：
（1）. 本链接文章是stackoverflow对问题的一些描述，原因及解决办法：http://stackoverflow.com/questions/32169303/activity-did-not-call-finish-api-23
（2）. 本文文章是对造成崩溃的原因，导致崩溃的操作，场合以及解决办法做了详细的说明 ，wiki目录地址 ： 
                      开始 » android » application  » android_6.0_theme.nodisplay_regression 
       （PS：原始链接打开速度比较坑，所以将原文章内容单独做成了wiki以供查阅，另外文章中描述的崩溃代码操作在OSUpdate源码中都有出现，参考价值较大）。


";}i:2;i:567;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:567;}i:22;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2217;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"解决方法";}i:2;i:2219;}i:24;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2231;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2233;}i:26;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:62:" 前两篇链接文章中都有提及，在此不再赘述。
";}i:2;i:2233;}i:27;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2233;}}