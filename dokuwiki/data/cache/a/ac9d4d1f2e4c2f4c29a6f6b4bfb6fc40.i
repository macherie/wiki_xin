a:10:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Modem side";i:1;i:4;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1;}i:3;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:137:"
sudo fastboot flash modem  NON-HLOS.bin
sudo fastboot flash sbl1 sbl1.mbn
sudo fastboot flash rpm rpm.mbn
sudo fastboot flash tz tz.mbn
";i:1;N;i:2;N;}i:2;i:23;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:170;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"AP side";i:1;i:4;i:2;i:170;}i:2;i:170;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:170;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:242:"
sudo fastboot flash aboot emmc_appsboot.mbn 
sudo fastboot flash boot boot.img
sudo fastboot flash system system.img
sudo fastboot flash userdata userdata.img
sudo fastboot flash persist persist.img
sudo fastboot flash recovery recovery.img
";i:1;N;i:2;N;}i:2;i:189;}i:8;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:439;}i:9;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:439;}}