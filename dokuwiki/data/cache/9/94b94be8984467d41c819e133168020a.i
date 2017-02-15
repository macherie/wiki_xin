a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" 擦除Q39 android L的QCN";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:27;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:27;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"方式一，按分区名擦除：";}i:2;i:29;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:68;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:87:"
adb reboot-bootloader
fastboot erase modemst1
fastboot erase modemst2
fastboot reboot
";i:1;N;i:2;N;}i:2;i:68;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:68;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"方式二，按对应分区表mmcblock擦除：";}i:2;i:164;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:211;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:293:"
lrwxrwxrwx root     root              1970-01-01 00:03 modemst1 -> /dev/block/mmcblk0p17
lrwxrwxrwx root     root              1970-01-01 00:03 modemst2 -> /dev/block/mmcblk0p18

adb shell dd if=/dev/zero of=/dev/block/mmcblk0p17
adb shell dd if=/dev/zero of=/dev/block/mmcblk0p18
adb reboot
";i:1;N;i:2;N;}i:2;i:218;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:218;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"root@q39:/dev/block/platform/7824900.sdhci/by-name # ls -al";}i:2;i:520;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:585;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2405:"
lrwxrwxrwx root     root              1970-01-01 00:03 DDR -> /dev/block/mmcblk0p2
lrwxrwxrwx root     root              1970-01-01 00:03 aboot -> /dev/block/mmcblk0p9
lrwxrwxrwx root     root              1970-01-01 00:03 abootbak -> /dev/block/mmcblk0p10
lrwxrwxrwx root     root              1970-01-01 00:03 boot -> /dev/block/mmcblk0p19
lrwxrwxrwx root     root              1970-01-01 00:03 cache -> /dev/block/mmcblk0p23
lrwxrwxrwx root     root              1970-01-01 00:03 config -> /dev/block/mmcblk0p26
lrwxrwxrwx root     root              1970-01-01 00:03 fsc -> /dev/block/mmcblk0p5
lrwxrwxrwx root     root              1970-01-01 00:03 fsg -> /dev/block/mmcblk0p3
lrwxrwxrwx root     root              1970-01-01 00:03 hyp -> /dev/block/mmcblk0p15
lrwxrwxrwx root     root              1970-01-01 00:03 hypbak -> /dev/block/mmcblk0p16
lrwxrwxrwx root     root              1970-01-01 00:03 keystore -> /dev/block/mmcblk0p25
lrwxrwxrwx root     root              1970-01-01 00:03 misc -> /dev/block/mmcblk0p24
lrwxrwxrwx root     root              1970-01-01 00:03 modem -> /dev/block/mmcblk0p1
lrwxrwxrwx root     root              1970-01-01 00:03 modemst1 -> /dev/block/mmcblk0p17
lrwxrwxrwx root     root              1970-01-01 00:03 modemst2 -> /dev/block/mmcblk0p18
lrwxrwxrwx root     root              1970-01-01 00:03 oem -> /dev/block/mmcblk0p27
lrwxrwxrwx root     root              1970-01-01 00:03 persist -> /dev/block/mmcblk0p22
lrwxrwxrwx root     root              1970-01-01 00:03 recovery -> /dev/block/mmcblk0p20
lrwxrwxrwx root     root              1970-01-01 00:03 rpm -> /dev/block/mmcblk0p11
lrwxrwxrwx root     root              1970-01-01 00:03 rpmbak -> /dev/block/mmcblk0p12
lrwxrwxrwx root     root              1970-01-01 00:03 sbl1 -> /dev/block/mmcblk0p7
lrwxrwxrwx root     root              1970-01-01 00:03 sbl1bak -> /dev/block/mmcblk0p8
lrwxrwxrwx root     root              1970-01-01 00:03 sec -> /dev/block/mmcblk0p4
lrwxrwxrwx root     root              1970-01-01 00:03 ssd -> /dev/block/mmcblk0p6
lrwxrwxrwx root     root              1970-01-01 00:03 system -> /dev/block/mmcblk0p21
lrwxrwxrwx root     root              1970-01-01 00:03 tz -> /dev/block/mmcblk0p13
lrwxrwxrwx root     root              1970-01-01 00:03 tzbak -> /dev/block/mmcblk0p14
lrwxrwxrwx root     root              1970-01-01 00:03 userdata -> /dev/block/mmcblk0p28

";i:1;N;i:2;N;}i:2;i:585;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:585;}}