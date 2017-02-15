a:57:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"高通对安兔兔的解决方案";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"80-NM846-34_A_MSM8939_AnTuTu_Troubleshooting.pdf";}i:2;i:45;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:93;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:93;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"下面是摘要：";}i:2;i:95;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:113;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:113;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"安兔兔跑分测试环境：";}i:2;i:115;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:145;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:145;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:"1. 升级到最新版本（已经打上影响性能的patch的版本）";}i:2;i:147;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:218;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:218;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"2. 开机设置飞行模式";}i:2;i:220;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:247;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:247;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:113:"3. 开机后等待3分钟，进行三次测试，取跑分平局值，每次测试前灭屏并且等待1分钟。";}i:2;i:249;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:362;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:362;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"对跑分影响的条件：";}i:2;i:364;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:397;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:194:"
1. Central Processing Unit (CPU) frequency
2. L2 cache size
3. Graphics Processing Unit (GPU) frequency
4. Liquid Crystal Display (LCD) resolution
5. RAM size
6. Composition type
7. EMCP model
";i:1;N;i:2;N;}i:2;i:397;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:397;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"软件能做的配置：";}i:2;i:601;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:625;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:625;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"1. 用msm8916-perf_defconfig 代替 q39_defconfig";}i:2;i:627;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:676;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:676;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"2. 去掉这些宏：";}i:2;i:678;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:705;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:460:"
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
";i:1;N;i:2;N;}i:2;i:705;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:705;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"3.运行时配置性能模式和关闭温控：";}i:2;i:1175;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1228;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:209:"
adb shell “echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor”
adb shell “echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor”
adb shell stop thermal-engine
";i:1;N;i:2;N;}i:2;i:1228;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1228;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"4.GPU 配置性能模式";}i:2;i:1447;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1477;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:78:"
adb shell “echo performance > /sys/class/kgsl/kgsl-3d0/devfreq/governor”
";i:1;N;i:2;N;}i:2;i:1477;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1477;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"5.关闭GPU idle时间";}i:2;i:1565;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1593;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
adb shell “echo 10000000 > /sys/class/kgsl/kgsl-3d0/idle_timer”
";i:1;N;i:2;N;}i:2;i:1593;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1593;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"6.关闭LPM";}i:2;i:1672;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1689;}i:50;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:75:"
adb shell “echo 1 > /sys/module/lpm_levels/parameters/sleep_disabled”
";i:1;N;i:2;N;}i:2;i:1689;}i:51;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1774;}i:52;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Case Number	02040641";i:1;i:2;i:2;i:1774;}i:2;i:1774;}i:53;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1774;}i:54;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2791:"
Created By: Jemish B Patel (6/12/2015 7:11 AM)
Dear Customer,

Please remove below config options from you kernel config file.

CONFIG_SCHED_DEBUG
CONFIG_DEBUG_KMEMLEAK
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF
CONFIG_DEBUG_SPINLOCK
CONFIG_DEBUG_MUTEXES
CONFIG_DEBUG_ATOMIC_SLEEP
CONFIG_DEBUG_STACK_USAGE
CONFIG_DEBUG_LIST
CONFIG_FAULT_INJECTION_DEBUG_FS
CONFIG_LOCKUP_DETECTOR
CONFIG_DEBUG_PAGEALLOC
CONFIG_PAGE_POISONING
CONFIG_CGROUP_DEBUG
CONFIG_RELAY
CONFIG_TRACEPOINTS
CONFIG_SLUB_DEBUG
CONFIG_RCU_CPU_STALL_VERBOSE
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_FAULT_INJECTION
CONFIG_FAIL_PAGE_ALLOC
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER
CONFIG_RMNET_DATA_DEBUG_PKT
CONFIG_MSM_SMD_DEBUG
CONFIG_SYSRQ_SCHED_DEBUG
CONFIG_DEBUG_MEMORY_INIT
CONFIG_DYNAMIC_DEBUG
CONFIG_CORESIGHT_TPIU
CONFIG_CORESIGHT_HWEVENT
CONFIG_CORESIGHT_FUNNEL
CONFIG_MSM_RTB
CONFIG_CORESIGHT
CONFIG_CORESIGHT_REPLICATOR
CONFIG_CORESIGHT_STM
CONFIG_BLK_DEV_LOOP
CONFIG_CORESIGHT_TMC
CONFIG_SLABINFO
CONFIG_HARDLOCKUP_DETECTOR_OTHER_CPU
CONFIG_HARDLOCKUP_DETECTOR
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC
CONFIG_DEBUG_PREEMPT
CONFIG_DEBUG_BUGVERBOSE
CONFIG_WANT_PAGE_DEBUG_FLAGS
CONFIG_MSM_RTB_SEPARATE_CPUS
CONFIG_PANIC_ON_DATA_CORRUPTION
CONFIG_STRICT_MEMORY_RWX
CONFIG_STRICT_MEMORY_RWX
CONFIG_HAVE_CORESIGHT_SINK
CONFIG_CORESIGHT_FUSE
CONFIG_CORESIGHT_CTI
CONFIG_CORESIGHT_CSR
CONFIG_CORESIGHT_ETMV4
CONFIG_CORESIGHT_MODEM_ETM
CONFIG_CORESIGHT_WCN_ETM
CONFIG_CORESIGHT_RPM_ETM
CONFIG_CP_ACCESS64
CONFIG_MSM_JTAGV8
CONFIG_MSM_TZ_LOG
CONFIG_SERIAL_MSM_HSL
CONFIG_SERIAL_MSM_HSL_CONSOLE
CONFIG_SERIAL_CORE
CONFIG_SERIAL_CORE_CONSOLE

Also align your kernel defconfig file with chipset specific perf_defconfig file.

2. Use below dalvik parameters for 2GB device.
dalvik.vm.heapstartsize=14m
dalvik.vm.heapgrowthlimit=192m
dalvik.vm.heapsize=512m
dalvik.vm.heaptargetutilization=0.75
dalvik.vm.heapminfree=6m
dalvik.vm.heapmaxfree=8m

3. Replace your init.qcom.post_boot.sh with uploaded qcom.sh

4. Please set below option in your kernel config file.
CONFIG_FB_MSM_TRIPLE_BUFFER

5. Please refer Document no : 80-NT978-1 (Performance_Improvement_Patches_Android_Lollipop_Builds)
Make sure all the recommendation provided in this document are there in your source code.

6. Refer Document no: 80-P0584-1 (Common_Performance_Issues_Debugging_Guide)
Section no : 2.5 Antutu score improvement
Make sure all suggestion given are there in your source code.

Both document you can download from below link
https://support.cdmatech.com/login/ ---> Docs & Downloads

After integrating all recommendations and suggestion provide us test results.

NOTE: Antutu benchmark is highly temperature dependent so make sure you run this test in VERY COLD environment just to avoid thermal issue.

Thanks,
Jemish
";i:1;N;i:2;N;}i:2;i:1810;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4611;}i:56;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4611;}}