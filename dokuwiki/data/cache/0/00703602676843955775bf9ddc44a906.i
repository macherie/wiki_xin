a:48:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Qualcomm Thermal Tuning";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:175:"高通提供了thermal调节工具，在整机功耗优化基本完成的前提下，调整系统system/etc/thermal-engine.conf文件，调整策略优化整机发热情况。";}i:2;i:40;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:215;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:215;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"thermal工具以及参考资料位置如下： 192.167.100.255/share/thermal。";}i:2;i:217;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:296;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:298;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"thermal tool tutorial";i:1;i:2;i:2;i:298;}i:2;i:298;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:298;}i:12;a:3:{i:0;s:10:"listo_open";i:1;a:0:{}i:2;i:331;}i:13;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:331;}i:14;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:331;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:" 导入日志工具到/data目录下: adb push perf_logging_extended /data";}i:2;i:335;}i:16;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:409;}i:17;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:409;}i:18;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:409;}i:19;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:409;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:" 修改权限：adb shell chmod 777 /data/perf_logging_extended";}i:2;i:413;}i:21;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:476;}i:22;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:476;}i:23;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:476;}i:24;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:476;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:131:" 启动日志工具：/data/perf_logging_extended 65 3600000 & （3600000 表示运行时间单位ms, & 表示后台运行进程）";}i:2;i:480;}i:26;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:611;}i:27;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:611;}i:28;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:611;}i:29;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:611;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:" 查看日志工具是否运行：cat /data/tsens_logger.csv";}i:2;i:615;}i:31;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:675;}i:32;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:675;}i:33;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:675;}i:34;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:675;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:" 导出日志文件：adb pull /data/tsens_logger.csv <path_to_pull_to>";}i:2;i:679;}i:36;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:750;}i:37;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:750;}i:38;a:3:{i:0;s:11:"listo_close";i:1;a:0:{}i:2;i:750;}i:39;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:752;}i:40;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"thermal tuning procedure";i:1;i:2;i:2;i:752;}i:2;i:752;}i:41;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:752;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:752;}i:43;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:11:":捕获.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"direct";}i:2;i:790;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:813;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:813;}i:46;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:813;}i:47;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:813;}}