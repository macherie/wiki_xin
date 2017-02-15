a:67:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:128:"主要用于监控系统tz温度，电池温度，GPU温度等，通过设定阀值，超过阀值会触发降频和关核动作";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:131;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:133;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:133;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:135;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"1 通过ADB来输出系统thermal的参数";}i:2;i:137;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:179;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:181;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:17:"thermal-engine -o";}i:2;i:181;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:181;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:202;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"2 加载thermal-config文件";}i:2;i:204;}i:15;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:232;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:234;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:54:"thermal-engine -c /system/etc/thermal-engine-perf.conf";}i:2;i:234;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:234;}i:19;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:292;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"3 thermal-engine代码中的位置";}i:2;i:294;}i:21;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:328;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:330;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:56:"msm8953/vendor/qcom/proprietary/thermal-engine/thermal.c";}i:2;i:330;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:330;}i:25;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:390;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"4 开启关闭温控";}i:2;i:392;}i:27;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:412;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:414;}i:29;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:60:"adb shell start thermal-engine
adb shell stop thermal-engine";}i:2;i:414;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:414;}i:31;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:480;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"5 通过对以下模块进行监控";}i:2;i:482;}i:33;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:517;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:519;}i:35;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:80:"'cpu'
- ACTION - CPU frequency scaling
- ACTION_INFO - Max CPU frequency in KHz ";}i:2;i:519;}i:36;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:129:"'cpuN'
- ACTION - CPU frequency scaling where N is the specific CPU core [0..MAX CORES]
- ACTION_INFO - Max CPU frequency in KHz ";}i:2;i:607;}i:37;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:128:"'clusterN'
- ACTION - CLUSTER frequency scaling where N is the specific CLUSTER ID
- ACTION_INFO - Max CLUSTER frequency in KHz ";}i:2;i:744;}i:38;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:124:"'hotplug_N'
- ACTION -  Hotplug a specific CPU core [1..MAX CORES]
- ACTION_INFO - 0 for online a core, or 1 to offline it. ";}i:2;i:880;}i:39;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:342:"'lcd'
- ACTION - LCD brightness throttling
- ACTION_INFO - 0-255 value for max LCD brightness
                                                                                                                                 
'modem'
- ACTION - Request throttling of modem functionality
- ACTION_INFO - 0-3 throttling level for modem mitigation";}i:2;i:1012;}i:40;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:133:"'fusion'
- ACTION - Request throttling of fusion modem functionality
- ACTION_INFO - 0-3 throttling level for fusion modem mitigation";}i:2;i:1370;}i:41;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:122:"'battery'
- ACTION - Battery charging current throttling
- ACTION_INFO - 0-3 throttling level for battery charging current";}i:2;i:1511;}i:42;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:78:"'gpu'
- ACTION - GPU frequency scaling
- ACTION_INFO - Max GPU frequency in Hz";}i:2;i:1641;}i:43;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:90:"'wlan'
- ACTION - WLAN throttling
- ACTION_INFO - 0-4 throttling level for WLAN mitigation";}i:2;i:1727;}i:44;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:74:"'shutdown'
- ACTION - Shutdown target
- ACTION_INFO - Shutdown delay in ms";}i:2;i:1825;}i:45;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:175:"'vdd_restriction'
- ACTION - Request voltage restriction of all vdd rails on SoC
- ACTION_INFO - 1 for request for vdd_restriction,
              0 for release vdd_restriction";}i:2;i:1907;}i:46;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:183:"'camera'
- ACTION - camera fps throttling and camera shutdown mitigation
- ACTION_INFO - 0-3 throttling level for camera fps mitigation,
              10 level for camera app shutdown";}i:2;i:2092;}i:47;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:198:"'camcorder'
- ACTION - camcorder fps throttling and camcorder shutdown mitigation
- ACTION_INFO - 0-3 throttling level for camcorder fps mitigation,
              10 level for camcorder app shutdown";}i:2;i:2285;}i:48;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:108:"'mdp'
- ACTION - Request throttling of MDP CX voting
- ACTION_INFO - 0-3 throttling level for MDP mitigation";}i:2;i:2493;}i:49;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:118:"'venus'
- ACTION - Request throttling of VENUS CX voting
- ACTION_INFO - 0-3 throttling level for VENUS mitigation    ";}i:2;i:2609;}i:50;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:46:"'cpu'
- DEVICE - Dynamic CPU frequency scaling";}i:2;i:2735;}i:51;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:95:"'cpuN'
- DEVICE - Dynamic CPU frequency scaling where N is the specific CPU core [0..MAX CORES]";}i:2;i:2787;}i:52;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:90:"'clusterN'
- DEVICE - Dynamic CLUSTER frequency scaling where N is the specific CLUSTER ID";}i:2;i:2888;}i:53;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:46:"'gpu'
- DEVICE - Dynamic GPU frequency scaling";}i:2;i:2984;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2984;}i:55;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3037;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"6 Battery Current Limit(BCL)";}i:2;i:3039;}i:57;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3067;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3069;}i:59;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:717:"主要是利用PMIC的fuel gauging来监控电池的电压和电池的电流来减轻这些发生。主要用于以下这几中情况下：
6.1 Battery Current(Ibat): 当电池电流达到一个高的或者低的阀值时，降低CPU的频率和关闭CPU核.
6.2 Battery voltage(Vbat): 当电池电压达到一个高的或者低的阀值时，降低CPU的频率和关闭CPU核.
6.3 Battery State-of-Charge(Soc): 当电池电量降到某个阀值，例如10%，BCL会降低CPU的频率和关闭CPU核.
   
[bcl_monitor]
algo_type        monitor
descending
sensor           bcl
sampling         1000
thresholds       100      0
thresholds_clr   500      100
actions          report   report
action_info      0        0
";}i:2;i:3069;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3069;}i:61;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3818;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"7 例子";}i:2;i:3820;}i:63;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3828;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3830;}i:65;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:565:"[PMIC_THERM_MON]
algo_type        monitor
sensor           PMIC_THERM
sampling         5000
thresholds       40200       45000   50000
thresholds_clr   38000       43000   48000
actions          cpu+report  cpu     cpu
action_info      1188000+0   368640  245760
7.1 sampling(采样率): 如果没有写，默认为1ms,PMIC_THERM_MON的采样率为5s
7.2 thresholds level 1(阀值): 当温度达到40.2摄氏度，会触发actions，调节cpu的最大频率为1188000 KHz,
当温度低于38摄氏度时，会清除actions。
7.3 thresholds level 2(阀值): 同理.
";}i:2;i:3830;}i:66;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3830;}}