a:9:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"性能调试 Performance tuning";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"systrace工具";}i:2;i:45;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:65;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2069:"
external/chromium-trace/systrace.py

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


Frame drop issue on browsing, gaming, and UX 丢帧问题，浏览，游戏，和UX
$ python systrace.py gfx input view sched am wm dalvik freq idle load sync workq power mmc disk -b 40000 -t 10 -o output.html

Application launch latency 应用程序启动延迟
$ python systrace.py gfx input sched am wm dalvik freq idle load sync workq power mmc disk  -b 40000 -t 10 -o output.html

Audio quality issue 音频质量问题
$ python systrace.py sched dalvik freq idle load sync workq power mmc disk audio hal res -b 40000 -t 10 -o output.html

Camera frame drop issue 相机帧下降问题
$ python systrace.py gfx sched am wm dalvik freq idle load sync workq power mmc disk camera hal res membus -b 40000 -t 10 -o output.html

Video frame drop issue 视频帧下降问题
$ python systrace.py gfx sched am wm dalvik freq idle load sync workq power mmc disk video audio hal res membus –b 40000 –t 10 -o output.htm
";i:1;N;i:2;N;}i:2;i:65;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2142;}i:8;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2142;}}