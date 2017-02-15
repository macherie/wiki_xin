a:23:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"1.首先查看userdata总大小";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1070:"
root@d508:/ # cat /proc/partitions                                             
major minor  #blocks  name

 179        0    7634944 mmcblk0
 179        1      65536 mmcblk0p1
 179        2        256 mmcblk0p2
 179        3        256 mmcblk0p3
 179        4         32 mmcblk0p4
 179        5         32 mmcblk0p5
 179        6        512 mmcblk0p6
 179        7        512 mmcblk0p7
 179        8        500 mmcblk0p8
 179        9        500 mmcblk0p9
 179       10      16384 mmcblk0p10
 179       11        500 mmcblk0p11
 179       12        500 mmcblk0p12
 179       13       1024 mmcblk0p13
 179       14       1536 mmcblk0p14
 179       15       1536 mmcblk0p15
 179       16     819200 mmcblk0p16
 179       17      32768 mmcblk0p17
 179       18     131072 mmcblk0p18
 179       19      16384 mmcblk0p19
 179       20       1024 mmcblk0p20
 179       21       1536 mmcblk0p21
 179       22          1 mmcblk0p22
 179       23          8 mmcblk0p23
 179       24      10240 mmcblk0p24
 179       25    5930991 mmcblk0p25
 179       32        512 mmcblk0rpmb
";i:1;N;i:2;N;}i:2;i:38;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:38;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"取小于5930991 mmcblk0p25的值(5872026 * 1024 = 6012954624)";}i:2;i:1117;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1179;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1179;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"2. AP侧修改";}i:2;i:1181;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1201;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:82:"
device/qcom/d508/BoardConfig.mk
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6012954624
";i:1;N;i:2;N;}i:2;i:1201;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1201;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"3. CP侧修改";}i:2;i:1293;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1313;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:204:"
Non-HLOS/common/build/d508.xml
<partition label="userdata" size_in_kb="5872026" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7"       bootable="false" readonly="true" filename="userdata.img" sparse="true"/>
";i:1;N;i:2;N;}i:2;i:1313;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1313;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"附：查看分区：
";}i:2;i:1527;}i:18;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:28:"platform:892x:partition-name";i:1;N;}i:2;i:1549;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1581;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1587;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:90:"
lrwxrwxrwx root     root              1970-01-01 14:14 userdata -> /dev/block/mmcblk0p25
";i:1;N;i:2;N;}i:2;i:1587;}i:22;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1587;}}