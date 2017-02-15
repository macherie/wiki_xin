a:13:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"1、进不去FTM";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"问题描述：项目qrd892x中wlan测试按照高通官方的步骤进不去FTM";}i:2;i:19;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:105;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:156:"
1.adb shell
2. insmod /system/lib/modules/wlan.ko con_mode=5
3. ptt_socket_app

再进入QRCT
1. COM port: make sure QRCT connect to target.
2. FTM start.
";i:1;N;i:2;N;}i:2;i:105;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:105;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"解决方法，增加“#iwpriv wlan0 ftm 1”命令：";}i:2;i:271;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:332;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:105:"
1.adb shell
2. insmod /system/lib/modules/wlan.ko con_mode=5
3. ptt_socket_app -f
4. iwpriv wlan0 ftm 1
";i:1;N;i:2;N;}i:2;i:332;}i:12;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:332;}}