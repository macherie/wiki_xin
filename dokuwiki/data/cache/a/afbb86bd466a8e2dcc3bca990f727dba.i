a:14:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"8926平台有那么多分区，如何知道每个分区是放什么的呢？
答案：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:93;}i:4;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:46:"$cd /dev/block/platform/msm_sdcc.1/by-name
$ll";i:1;N;i:2;N;}i:2;i:93;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:93;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"你就会看到：";}i:2;i:148;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:172;}i:8;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2142:"lrwxrwxrwx root     root              1970-01-01 14:14 DDR -> /dev/block/mmcblk0p5
lrwxrwxrwx root     root              1970-01-01 14:14 aboot -> /dev/block/mmcblk0p6
lrwxrwxrwx root     root              1970-01-01 14:14 abootbak -> /dev/block/mmcblk0p7
lrwxrwxrwx root     root              1970-01-01 14:14 boot -> /dev/block/mmcblk0p10
lrwxrwxrwx root     root              1970-01-01 14:14 cache -> /dev/block/mmcblk0p18
lrwxrwxrwx root     root              1970-01-01 14:14 fsc -> /dev/block/mmcblk0p22
lrwxrwxrwx root     root              1970-01-01 14:14 fsg -> /dev/block/mmcblk0p21
lrwxrwxrwx root     root              1970-01-01 14:14 misc -> /dev/block/mmcblk0p20
lrwxrwxrwx root     root              1970-01-01 14:14 modem -> /dev/block/mmcblk0p1
lrwxrwxrwx root     root              1970-01-01 14:14 modemst1 -> /dev/block/mmcblk0p14
lrwxrwxrwx root     root              1970-01-01 14:14 modemst2 -> /dev/block/mmcblk0p15
lrwxrwxrwx root     root              1970-01-01 14:14 pad -> /dev/block/mmcblk0p13
lrwxrwxrwx root     root              1970-01-01 14:14 persist -> /dev/block/mmcblk0p17
lrwxrwxrwx root     root              1970-01-01 14:14 recovery -> /dev/block/mmcblk0p19
lrwxrwxrwx root     root              1970-01-01 14:14 rpm -> /dev/block/mmcblk0p8
lrwxrwxrwx root     root              1970-01-01 14:14 rpmbak -> /dev/block/mmcblk0p9
lrwxrwxrwx root     root              1970-01-01 14:14 sbl1 -> /dev/block/mmcblk0p2
lrwxrwxrwx root     root              1970-01-01 14:14 sbl1bak -> /dev/block/mmcblk0p3
lrwxrwxrwx root     root              1970-01-01 14:14 sdi -> /dev/block/mmcblk0p4
lrwxrwxrwx root     root              1970-01-01 14:14 splash -> /dev/block/mmcblk0p24
lrwxrwxrwx root     root              1970-01-01 14:14 ssd -> /dev/block/mmcblk0p23
lrwxrwxrwx root     root              1970-01-01 14:14 system -> /dev/block/mmcblk0p16
lrwxrwxrwx root     root              1970-01-01 14:14 tz -> /dev/block/mmcblk0p11
lrwxrwxrwx root     root              1970-01-01 14:14 tzbak -> /dev/block/mmcblk0p12
lrwxrwxrwx root     root              1970-01-01 14:14 userdata -> /dev/block/mmcblk0p25";i:1;N;i:2;N;}i:2;i:172;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:172;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:"具体哪个mmcblock对应哪个分区名称可以从分区文件看到：";}i:2;i:2325;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2405;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3907:"
Non-HLOS/common/build/d508.xml
  1         <partition label="modem" size_in_kb="65536" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="NON-HLOS.bin"/>
  2         <partition label="sbl1" size_in_kb="256" type="DEA0BA2C-CBDD-4805-B4F9-F428251C3E98" bootable="false" readonly="false" filename="sbl1.mbn"/>
  3         <partition label="sbl1bak" size_in_kb="256" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="sbl1.mbn"/>
  4         <partition label="sdi" size_in_kb="32" type="D4E0D938-B7FA-48C1-9D21-BC5ED5C4B203" bootable="false" readonly="false" filename="sdi.mbn"/>
  5         <partition label="DDR" size_in_kb="32" type="20A0C19C-286A-42FA-9CE7-F64C3226A794" bootable="false" readonly="true"/>
  6         <partition label="aboot" size_in_kb="512" type="400FFDCD-22E0-47E7-9A23-F16ED9382388" bootable="false" readonly="false" filename="emmc_appsboot.mbn"/>
  7         <partition label="abootbak" size_in_kb="512" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="emmc_appsboot.mbn"/>
  8         <partition label="rpm" size_in_kb="500" type="098DF793-D712-413D-9D4E-89D711772228" bootable="false" readonly="false" filename="rpm.mbn"/>
  9         <partition label="rpmbak" size_in_kb="500" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="rpm.mbn"/>
 10         <partition label="boot" size_in_kb="16384" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="true" filename="boot.img"/>
 11         <partition label="tz" size_in_kb="500" type="A053AA7F-40B8-4B1C-BA08-2F68AC71A4F4" bootable="false" readonly="false" filename="tz.mbn"/>
 12         <partition label="tzbak" size_in_kb="500" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="tz.mbn"/>
 13         <partition label="pad" size_in_kb="1024" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename=""/>
 14         <partition label="modemst1" size_in_kb="1536" type="EBBEADAF-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 15         <partition label="modemst2" size_in_kb="1536" type="0A288B1F-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 16         <partition label="system" size_in_kb="819200" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="system.img" sparse="true"/>
 17         <partition label="persist" size_in_kb="32768" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="persist.img" sparse="true"/>
 18         <partition label="cache" size_in_kb="131072" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="cache.img" sparse="true"/>
 19         <partition label="recovery" size_in_kb="16384" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="true" filename="recovery.img"/>
 20         <partition label="misc" size_in_kb="1024" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="false" filename="" />
 21         <partition label="fsg" size_in_kb="1536" type="638FF8E2-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="true" filename=""/>
 22         <partition label="fsc" size_in_kb="1" type="57B90A16-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 23         <partition label="ssd" size_in_kb="8" type="2C86E742-745E-4FDD-BFD8-B6A7AC638772" bootable="false" readonly="false" filename=""/>
 24         <partition label="splash" size_in_kb="10240" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="false" filename="splash.img"/>
 25         <partition label="userdata" size_in_kb="13631488" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="userdata.img" sparse="true"/>
";i:1;N;i:2;N;}i:2;i:2405;}i:13;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2405;}}