a:18:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"Linux 添加系统调用SCI（system call interface）";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:55;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:55;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"一、系统调用的目的";}i:2;i:57;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:84;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:526:"    系统调用是应用程序和操作系统内核之间的功能接口。其主要目的是使得用户可以使用操作系统提供的有关设备管理、输入/输入系统、文件系统和进程控制、通信
 以及存储管理等方面的功能，而不必了解系统程序的内部结构和有关硬件细节，从而起到减轻用户负担和保护系统以及提高资源利用率的作用。
 我们在编程时用到的很多函数，如fork、open等这些函数最终都是在系统调用里实现的。
 ";}i:2;i:84;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:84;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"二、添加系统调用";}i:2;i:620;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:644;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1053:" 不同的linux内核，添加系统调用的方法稍有不同，这里以2.6以后的内核版本为例，添加一个名为umd的系统调用。
 1. 添加系统调用号到 kernel/include/asm-generic/unistd.h。
   #define __NR_umd 378                                                         
   __SYSCALL(__NR_umd,sys_umd)
   每一个系统调用都对应一个系统调用号，系统调用号等于下面的系统调用表对应表项的索引。
 2. 更新系统调用表
    sys_call_table[]，该表中保存了系统调用编号和其对应的内核函数。
    在系统调用表的最后添加CALL(sys_umd)，sys_umd即实际调用的内核函数名。
 3. 系统调用内核函数实现
    SYSCALL_DEFINE1(umd, const char *, password)
    { 
       printk("password is %s",password);
    } 
    SYSCALL_DEFINE1是个宏定义， 定义在include/linux/syscalls.h，其中1是所传参数的个数，宏定义展开后的形式是：
    asmlinkage long sys_umd(const char * name),也就是前面系统调用表中声明的函数。
    ";}i:2;i:644;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:644;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"三、用户空间使用系统调用";}i:2;i:1731;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1767;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:72:" #include <unistd.h> 
 #include <sys/syscall.h> 
 #include <sys/types.h>";}i:2;i:1767;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:265:" #define __NR_umd 378
 int main(int argc, char *argv[])  
 { 
   syscall(__NR_umd,"123456"); 
   return 0；
 } 
 syscall函数使用了系统调用表中的索引作为第一个参数。后面是我们传的参数，这些都会通过寄存器传到内核空间。";}i:2;i:1847;}i:17;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1847;}}