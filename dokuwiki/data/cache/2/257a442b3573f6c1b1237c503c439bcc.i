a:27:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"usage: fastboot [ <option> ] <command>";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:39;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:39;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"commands:";}i:2;i:41;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:50;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:889:"update <filename>                        reflash device from update.zip
flashall                                 flash boot + recovery + system
flash <partition> [ <filename> ]         write a file to a flash partition
erase <partition>                        erase a flash partition
format <partition>                       format a flash partition 
getvar <variable>                        display a bootloader variable
boot <kernel> [ <ramdisk> ]              download and boot kernel
flash:raw boot <kernel> [ <ramdisk> ]    create bootimage and flash it
devices                                  list all connected devices
continue                                 continue with autoboot
reboot                                   reboot device normally
reboot-bootloader                        reboot device into bootloader
help                                     show this help message";}i:2;i:50;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:50;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"options:";}i:2;i:968;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:982;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:983:"
  -w                                       erase userdata and cache (and format
                                           if supported by partition type)
  -u                                       do not first erase partition before
                                           formatting
  -s <specific device>                     specify device serial number
                                           or path to device port
  -l                                       with "devices", lists device paths
  -p <product>                             specify product name
  -c <cmdline>                             override kernel commandline
  -i <vendor id>                           specify a custom USB vendor id
  -b <base_addr>                           specify a custom kernel base address. default: 0x10000000
  -n <page size>                           specify the nand page size. default: 2048
  -S <size>[K|M|G]                         automatically sparse files greater than
";i:1;N;i:2;N;}i:2;i:982;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"常用命令";i:1;i:1;i:2;i:1974;}i:2;i:1974;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1974;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1999;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"烧录android";i:1;i:2;i:2;i:1999;}i:2;i:1999;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1999;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1999;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"如果检测不到设备：根据不同端口的手机需要在 /etc/udev/rules.d/51-android.rules 配置相应的端口";}i:2;i:2023;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2149;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:373:"
adb reboot-bootloader //进入烧机模式
fastboot devices  //fastboot察看设备
/*
  下面四条命令将对应的镜像文件烧录到对应的分区
*/
sudo fastboot flash boot boot.img
sudo fastboot flash recovery recovery.img
sudo fastboot flash system system.img
sudo fastboot flash userdata userdata.img
//最后一条命令将机器重启
sudo fastboot reboot
";i:1;N;i:2;N;}i:2;i:2149;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2532;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"切换进download模式";i:1;i:2;i:2;i:2532;}i:2;i:2532;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2532;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:38:"adb reboot edl 或者 adb reboot dload";i:1;N;i:2;N;}i:2;i:2571;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2617;}i:26;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2617;}}