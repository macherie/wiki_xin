a:20:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"1 检查kernel中的deconfig";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:31;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:33;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:528:"将deconfig中以上这些文件去掉，这些主要用于debug和log，对系统性能有一定的影响。
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPT_TRACER=y
CONFIG_SCHED_DEBUG=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_DEBUG_LIST=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_LOCKUP_DETECTOR=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_PAGE_POISONING=y
CONFIG_SLUB_DEBUG=y";}i:2;i:33;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:33;}i:8;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:597;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"2 调试CPU命令";}i:2;i:599;}i:10;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:616;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:618;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:2132:"1: 将系统调成performance模式
adb root
adb wait-for-devices
adb root
adb wait-for-devices
sleep 4
adb shell stop MPDecision
adb shell stop thermal-engine  //关闭温控
adb shell stop thermald
adb shell echo 1 > /sys/devices/system/cpu/cpu1/online
adb shell echo 1 > /sys/devices/system/cpu/cpu2/online
adb shell echo 1 > /sys/devices/system/cpu/cpu3/online
sleep 1
adb shell echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
adb shell echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
adb shell echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
adb shell echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
adb shell sleep 1
adb shell mount -t debugfs none /d
adb shell echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/mas
adb shell echo 512 > /sys/kernel/debug/msm-bus-dbg/shell-client/slv
adb shell echo 0 > /sys/kernel/debug/msm-bus-dbg/shell-client/ab
adb shell echo 14928000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib 
adb shell echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/update_request
sleep 1
adb shell echo none > /sys/class/kgsl/kgsl-3d0/pwrscale/policy
adb shell echo 550000000 > /sys/class/kgsl/kgsl-3d0/gpuclk
adb shell echo performance >/sys/class/devfreq/qcom,cpubw.40/governor
2: 禁止thread migration
adb shell echo 0 > /dev/cpuctl/apps/cpu.notify_on_migrate
3: 通过ADB命令来改变DDR的Clock的频率
adb shell echo active clk2 0 1 max <frequency in KHz> > /d/rpm_send_msg/message
4: 将DDR调成performance模式
adb shell echo none > /sys/class/kgsl/kgsl-3d0/pwrscale/policy
adb shell echo 600000000 > /sys/class/kgsl/kgsl-3d0/gpuclk
adb shell echo performance > /sys/class/kgsl/kgsl-3d0/devfreq/governor
adb shell echo performance >/sys/class/devfreq/qcom,cpubw.26/governor
5: Enable perflock logging
adb pull /system/build.prop
在build.prop加上debug.trace.perf=1
adb push build.prop /system/
adb shell chmod 0644 /system/build.prop
adb shell sync
adb shell reboot
然后在logcat中去grep"PERF"关键字
6: Disable kernel thermal
echo 0 > /sys/module/msm_thermal/core_control/enabled";}i:2;i:618;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:618;}i:14;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2846;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"3 小米手机中高性能模式以及均衡模式实现";}i:2;i:2848;}i:16;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2904;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2906;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:4317:"高性能可以安兔兔跑分，可以充分发挥cpu的性能
"LEO "* | "MI 4"* | "MI NOTE"* | "VIRGO"*)
case "$powermode" in
"high")
    stop mpdecision
    sleep 1
    echo 1                                    > /sys/devices/system/cpu/cpu1/online
    echo 1                                    > /sys/devices/system/cpu/cpu2/online
    echo 1                                    > /sys/devices/system/cpu/cpu3/online
    echo 1                                    > /sys/devices/system/cpu/cpu1/online
    echo 1                                    > /sys/devices/system/cpu/cpu2/online
    echo 1                                    > /sys/devices/system/cpu/cpu3/online
    echo 2457600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
    echo performance                          > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo performance                          > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
    echo performance                          > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
    echo performance                          > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
    echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
    echo 1728000                              > /sys/module/cpu_boost/parameters/sync_threshold
    echo 1497600                              > /sys/module/cpu_boost/parameters/input_boost_freq
    echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
    echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
    echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
    echo performance                          > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    echo "msm_cpufreq"                        > $dev_governor
   ;;
均衡模式
"middle")
    echo interactive                          > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo interactive                          > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
    echo interactive                          > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
    echo interactive                          > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
    echo 2457600                              > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2457600                              > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
    echo "20000 1400000:40000 1700000:20000"  > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
    echo 90                                   > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
    echo 1190400                              > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
    echo "85 1500000:99"                      > /sys/devices/system/cpu/cpufreq/interactive/target_loads
    echo 40000                                > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
    echo 20                                   > /sys/module/cpu_boost/parameters/boost_ms
    echo 1497600                              > /sys/module/cpu_boost/parameters/sync_threshold
    echo 1190400                              > /sys/module/cpu_boost/parameters/input_boost_freq
    echo 40                                   > /sys/module/cpu_boost/parameters/input_boost_ms
    echo 255                                  > /sys/class/leds/lcd-backlight/max_brightness
    echo 578000000                            > /sys/class/kgsl/kgsl-3d0/max_gpuclk
    echo msm-adreno-tz                        > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    echo "cpubw_hwmon"                        > $dev_governor
    start mpdecision
    ;; ";}i:2;i:2906;}i:19;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2906;}}