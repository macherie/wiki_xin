a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"手动修改机器中config文件";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:34;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:261:"adb root
adb remount
adb shell rm /etc/sensors/sensor_def_qcomdev.conf
adb push sensor_def_qcomdev.conf /etc/sensors/sensor_def_qcomdev.conf
adb shell chmod 644 /etc/sensors/sensor_def_qcomdev.conf
adb shell rm /persist/sensors/sns.reg
adb shell sync
adb reboot";}i:2;i:34;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:34;}}