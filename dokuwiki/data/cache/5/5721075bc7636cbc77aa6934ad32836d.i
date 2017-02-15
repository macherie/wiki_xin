a:13:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"分析内核的ramdump";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:111:"执行命令前先配置工程source build/envsetup.sh,然后lunch相应的项目，否则出现如下错误：";}i:2;i:36;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:153;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:794:"
Could not find platform independent libraries <prefix> Could not find platform dependent libraries <exec_prefix> Consider setting $PYTHONHOME to 
<prefix>[:<exec_prefix>] ImportError: No module named site

python ramparse.py –everything --64-bit -g <path_to_gdb> -n <path_to_nm> –vmlinux <path_to_vmlinux> –auto-dump <path_to_ramdump> -o <path_to_output> 

python ramparse.py --everything  --64-bit -g ~/mount_work/Q39_5.0/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.8/bin/
aarch64-linux-android-gdb -n ~/mount_work/Q39_5.0/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.8/bin/aarch64-linux-android-nm  
--vmlinux ~/mount_work/Q39_5.0/out/target/product/q39/obj/KERNEL_OBJ/vmlinux --auto-dump ~/crash_ramdump/q39/Port_COM46/  
-o ~/crash_ramdump/q39/Port_COM46/out/
";i:1;N;i:2;N;}i:2;i:153;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:153;}i:8;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:49:"linux:8939:linux-ramdump-parser-v2-64-8939.tar.gz";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:956;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1010;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:897:"
例：
[ 1175.857430] Internal error: Oops: 96000007 [#1] PREEMPT SMP
[ 1175.857434] Modules linked in:
[ 1175.857440] CPU: 4 PID: 0 Comm: swapper/4 Not tainted 3.10.49-g96b71a3-00002-g6876be1 #1
[ 1175.857444] task: ffffffc00c3e35c0 ti: ffffffc070d78000 task.ti: ffffffc070d78000
[ 1175.857454] PC is at lifo_stats_file_show+0x30/0xa8
[ 1175.857458] LR is at lpm_stats_cpu_exit+0x80/0x9c
[ 1175.857461] pc : [<ffffffc00082a908>] lr : [<ffffffc00082ad30>] pstate: 200001c5
[ 1175.857463] sp : ffffffc070d7be20
[ 1175.857468] x29: ffffffc070d7be20 x28: 0000000000000001

全部dump
aarch64-linux-android-objdump  -Dz -S vmlinux > vm.txt
按行分析：
aarch64-linux-android-addr2line -a ffffffc00082a908 -e vmlinux
0xffffffc00082a908
/home/jenkins/jobs/S201-Release/workspace/kernel/include/linux/list.h:188

aarch64-linux-android-addr2line -a ffffffc070d7bd20 -e vmlinux
0xffffffc070d7bd20
??:0
";i:1;N;i:2;N;}i:2;i:1017;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1922;}i:12;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1922;}}