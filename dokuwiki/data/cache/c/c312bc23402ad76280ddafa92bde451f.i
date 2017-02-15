a:44:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"性能调试 Performance tuning";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:45;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"systrace工具";i:1;i:3;i:2;i:45;}i:2;i:45;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:45;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:45:"
位置:
external/chromium-trace/systrace.py
";i:1;N;i:2;N;}i:2;i:73;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:73;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"保存下面的代码到ztrace.sh, 在抓取之前先执行下面指令 source ztrace.sh";}i:2;i:129;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:223;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1111:"
adb shell setprop service.adb.root 1
adb wait-for-device
adb shell setenforce 0
adb wait-for-device

adb root
adb wait-for-device
adb remount
adb shell "echo 0 > /sys/kernel/debug/tracing/tracing_on"
adb shell "echo > /sys/kernel/debug/tracing/trace"
adb shell "echo 51200 > /sys/kernel/debug/tracing/buffer_size_kb"
adb shell "echo thermal:* > /sys/kernel/debug/tracing/set_event"
adb shell "echo msm_low_power:* >> /sys/kernel/debug/tracing/set_event"
adb shell "echo sched:sched_migrate_task >> /sys/kernel/debug/tracing/set_event"
adb shell "echo sched:sched_switch >> /sys/kernel/debug/tracing/set_event"
adb shell "echo sched:sched_wakeup >> /sys/kernel/debug/tracing/set_event"
adb shell "echo sched:sched_cpu_load >> /sys/kernel/debug/tracing/set_event"
adb shell "echo core_ctl_eval_need >> /sys/kernel/debug/tracing/set_event"
adb shell "echo cpufreq_interactive:* >> /d/tracing/set_event"
adb shell "echo kgsl:* >> /d/tracing/set_event"
adb shell "echo mdss:* >> /d/tracing/set_event"
adb shell "echo irq:* >> /sys/kernel/debug/tracing/set_event"
adb shell "cat /sys/kernel/debug/tracing/set_event"
";i:1;N;i:2;N;}i:2;i:223;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1344;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"抓取方法:";i:1;i:3;i:2;i:1344;}i:2;i:1344;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1344;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1344;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"1. Frame drop issue on browsing, gaming, and UX 丢帧问题，浏览，游戏，和UX";}i:2;i:1366;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1458;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:127:"
$ python systrace.py gfx input view sched am wm dalvik freq idle load sync workq power mmc disk -b 40000 -t 10 -o output.html
";i:1;N;i:2;N;}i:2;i:1458;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1458;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"2. Application launch latency 应用程序启动延迟";}i:2;i:1595;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1655;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:123:"
$ python systrace.py gfx input sched am wm dalvik freq idle load sync workq power mmc disk  -b 40000 -t 10 -o output.html
";i:1;N;i:2;N;}i:2;i:1655;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1655;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"3. Audio quality issue 音频质量问题";}i:2;i:1788;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1835;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:120:"
$ python systrace.py sched dalvik freq idle load sync workq power mmc disk audio hal res -b 40000 -t 10 -o output.html
";i:1;N;i:2;N;}i:2;i:1835;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1835;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"4. Camera frame drop issue 相机帧下降问题";}i:2;i:1965;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2019;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:138:"
$ python systrace.py gfx sched am wm dalvik freq idle load sync workq power mmc disk camera hal res membus -b 40000 -t 10 -o output.html
";i:1;N;i:2;N;}i:2;i:2019;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2019;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"5. Video frame drop issue 视频帧下降问题";}i:2;i:2167;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2220;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:146:"
$ python systrace.py gfx sched am wm dalvik freq idle load sync workq power mmc disk video audio hal res membus –b 40000 –t 10 -o output.htm
";i:1;N;i:2;N;}i:2;i:2220;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2376;}i:35;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"相关文档：";i:1;i:3;i:2;i:2376;}i:2;i:2376;}i:36;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2376;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2376;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"MSM8939/MSM8952/MSM8909性能调试文档";}i:2;i:2400;}i:39;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:2441;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"
80-P0584-1_COMMON PERFORMANCE ISSUES DEBUGGING GUIDE";}i:2;i:2444;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2501;}i:42;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2503;}i:43;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2503;}}