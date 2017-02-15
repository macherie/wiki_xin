a:34:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"抓wifi log (曾在Q39上这样调试)";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:39;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:39;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"修改WCNSS_qcom_cfg.ini如下";}i:2;i:41;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:77;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:72:"
vosTraceEnableHDD = 255
vosTraceEnableSME = 255
vosTraceEnablePE = 255
";i:1;N;i:2;N;}i:2;i:77;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:77;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"1. 下载之前传的cfg.ini ,用下面的命令替换原有ini文件，";}i:2;i:159;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:237;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:101:"
adb shell setprop service.adb.root 1
adb push WCNSS_qcom_cfg.ini /data/misc/wifi/WCNSS_qcom_cfg.ini
";i:1;N;i:2;N;}i:2;i:237;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:237;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"重启手机。";}i:2;i:347;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:362;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:362;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"2. 下载logmask ，QXDM使用这个logmask抓log，";}i:2;i:364;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:416;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:416;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"3.  高通抓sniffer log时，不要设置
filter，他们需要完整的原始数据。";}i:2;i:418;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:506;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:506;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"4. 用下面命令";}i:2;i:508;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:532;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:102:"
adb shell wpa_cli ifname=p2p0 log_level EXCESSIVE
adb shell wpa_cli ifname=wlan0 log_level EXCESSIVE
";i:1;N;i:2;N;}i:2;i:532;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:532;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"5. logcat和kernel log用下面的方法抓：";}i:2;i:644;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:696;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:90:"
adb shell logcat -v time -f /dev/kmsg | adb shell cat /proc/kmsg | tee kernel_logcat.txt
";i:1;N;i:2;N;}i:2;i:696;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:696;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:"注意：抓kernel
log之前先用下面的命令获取root权限和退出SEandroid强制模式：";}i:2;i:796;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:900;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:61:"
adb shell setprop service.adb.root 1
adb shell setenforce 0
";i:1;N;i:2;N;}i:2;i:900;}i:33;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:900;}}