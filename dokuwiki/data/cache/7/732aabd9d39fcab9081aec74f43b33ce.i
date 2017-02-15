a:13:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"MSM8625Q: Use fastboot to flash image";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:63;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Modem side";i:1;i:4;i:2;i:63;}i:2;i:63;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:63;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:144:"
fastboot flash cfgdata qcsblhd_cfgdata.mbn 
fastboot flash qcsbl qcsbl.mbn 
fastboot flash oemsbl oemsbl_fsb.mbn 
fastboot flash modem fat.bin
";i:1;N;i:2;N;}i:2;i:85;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:239;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"AP side";i:1;i:4;i:2;i:239;}i:2;i:239;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:239;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:215:"
fastboot flash aboot emmc_appsboot_fsb.mbn
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash persist persist.img
fastboot flash system system.img
fastboot flash userdata userdata.img
";i:1;N;i:2;N;}i:2;i:258;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:484;}i:12;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:484;}}