a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"擦除8939的QCN";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"方式一，按分区名擦除：";}i:2;i:19;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:58;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:87:"
adb reboot-bootloader
fastboot erase modemst1
fastboot erase modemst2
fastboot reboot
";i:1;N;i:2;N;}i:2;i:58;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:58;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"方式二，按对应分区表mmcblock擦除：";}i:2;i:155;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:208;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:114:"
adb shell dd if=/dev/zero of=/dev/block/mmcblk0p13
adb shell dd if=/dev/zero of=/dev/block/mmcblk0p14
adb reboot
";i:1;N;i:2;N;}i:2;i:208;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:208;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"PS: 分区表文件";}i:2;i:332;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:357;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4201:"
Non-HLOS/common/build/partition.xml

  1         <partition label="modem" size_in_kb="65536" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="NON-HLOS.bin"/>
  2         <partition label="sbl1" size_in_kb="512" type="DEA0BA2C-CBDD-4805-B4F9-F428251C3E98" bootable="false" readonly="false" filename="sbl1.mbn"/>
  3         <partition label="sbl1bak" size_in_kb="512" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="sbl1.mbn"/>
  4         <partition label="aboot" size_in_kb="1024" type="400FFDCD-22E0-47E7-9A23-F16ED9382388" bootable="false" readonly="false" filename="emmc_appsboot.mbn"/>
  5         <partition label="abootbak" size_in_kb="1024" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="emmc_appsboot.mbn"/>
  6         <partition label="rpm" size_in_kb="512" type="098DF793-D712-413D-9D4E-89D711772228" bootable="false" readonly="false" filename="rpm.mbn"/>
  7         <partition label="rpmbak" size_in_kb="512" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="rpm.mbn"/>
  8         <partition label="tz" size_in_kb="512" type="A053AA7F-40B8-4B1C-BA08-2F68AC71A4F4" bootable="false" readonly="false" filename="tz.mbn"/>
  9         <partition label="tzbak" size_in_kb="512" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="tz.mbn"/>
 10     <partition label="hyp" size_in_kb="512" type="E1A6A689-0C8D-4CC6-B4E8-55A4320FBD8A" bootable="false" readonly="false" filename="hyp.mbn"/>
 11         <partition label="hypbak" size_in_kb="512" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename="hyp.mbn"/>
 12     <partition label="pad" size_in_kb="1024" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="false" filename=""/>
 13         <partition label="modemst1" size_in_kb="1536" type="EBBEADAF-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 14         <partition label="modemst2" size_in_kb="1536" type="0A288B1F-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 15         <partition label="misc" size_in_kb="1024" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="false" filename="" />
 16         <partition label="fsc" size_in_kb="1" type="57B90A16-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="false" filename=""/>
 17         <partition label="ssd" size_in_kb="8" type="2C86E742-745E-4FDD-BFD8-B6A7AC638772" bootable="false" readonly="false" filename=""/>
 18         <partition label="splash" size_in_kb="10240" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="false" filename=""/>
 19         <partition label="DDR" size_in_kb="32" type="20A0C19C-286A-42FA-9CE7-F64C3226A794" bootable="false" readonly="true" />
 20         <partition label="fsg" size_in_kb="1536" type="638FF8E2-22C9-E33B-8F5D-0E81686A68CB" bootable="false" readonly="true" filename=""/>
 21         <partition label="sec" size_in_kb="16" type="303E6AC3-AF15-4C54-9E9B-D9A8FBECF401" bootable="false" readonly="true" filename="sec.dat"/>
 22         <partition label="boot" size_in_kb="16384" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="true" filename="boot.img"/>
 23         <partition label="system" size_in_kb="819200" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="system.img" sparse="true"/>
 24         <partition label="persist" size_in_kb="32768" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="persist.img" sparse="true"/>
 25         <partition label="cache" size_in_kb="131072" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="cache.img" sparse="true"/>
 26         <partition label="recovery" size_in_kb="16384" type="20117f86-E985-4357-B9EE-374BC1D8487D" bootable="false" readonly="true" filename="recovery.img"/>
 27         <partition label="userdata" size_in_kb="2918232" type="EBD0A0A2-B9E5-4433-87C0-68B6B72699C7" bootable="false" readonly="true" filename="userdata.img" sparse="true"/>
";i:1;N;i:2;N;}i:2;i:357;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:357;}}