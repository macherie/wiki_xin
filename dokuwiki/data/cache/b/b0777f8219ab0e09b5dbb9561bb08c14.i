a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"1. 关机充电电流小于开机充电电流：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:49;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:49;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"原因：关机充电CPU没有进入省电模式，CPU消耗了部分电流；";}i:2;i:51;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:129;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:129;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"解决：在关机充电时降频。";}i:2;i:131;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:167;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:167;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"修改rootdir/etc/init.qcom.usb.rc";}i:2;i:169;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:209;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:270:"
on charger
    setprop sys.usb.config mass_storage
    write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor powersave
    write /sys/devices/system/cpu/cpu1/online 0
    write /sys/devices/system/cpu/cpu2/online 0
    write /sys/devices/system/cpu/cpu3/online 0
";i:1;N;i:2;N;}i:2;i:209;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:209;}}