a:37:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:" 关于用QRCT测试wlan/bt时,在运行QRCT前需要运行进入FTM模式指令:";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:82;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:82;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"1.wlan需要的命令: adb shell $sh /etc/enable_wcn36xx.sh";}i:2;i:84;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:143;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:143;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"2.bt需要的命令: adb shell $ftmdaemon";}i:2;i:145;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:186;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:186;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"然后就可以用QRCT进行测试. ";}i:2;i:188;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:224;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"记录一些测试方式";i:1;i:1;i:2;i:227;}i:2;i:227;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:227;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:169:"
BT test:

adb remount

adb push btconfig /system/xbin/

adb shell chmod 777 /system/xbin/btconfig

adb push init.qcom8x26.btcta.sh /etc

sh /etc/init.qcom8x26.btcta.sh
";i:1;N;i:2;N;}i:2;i:269;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:269;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"WIFI test:";}i:2;i:449;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:465;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:757:"
adb remount
adb push iwpriv /system/xbin/
adb shell chmod 777 /system/xbin/iwpriv
insmod /system/lib/modules/wlan.ko con_mode=5
ptt_socket_app -f
iwpriv wlan0 ftm 1 //start ftm 
(和脚本enable_wcn36xx.sh是一样的)

for tx test 

iwpriv wlan0 set_channel 1 //select channel 
iwpriv wlan0 ena_chain 2 // 2 test tx, 1 test rx 
iwpriv wlan0 pwr_cntl_mode 1 //1: SCPC; 2: CLPC 
iwpriv wlan0 set_txpower 10 
iwpriv wlan0 set_txrate 11B_LONG_11_MBPS 
iwpriv wlan0 tx 1 


for rx test: 
iwpriv wlan0 set_channel 1 
iwpriv wlan0 rx 0 
iwpriv wlan0 ena_chain 1 // 2 test tx, 1 test rx 
iwpriv wlan0 clr_rxpktcnt 1 /*clear RX packet count*/ 
iwpriv wlan0 rx 1 /* enable RX to receive 11b/g/n packets*/ 

iwpriv wlan0 get_rxpktcn 

iwpriv wlan0 ftm 0 //stop ftm 
";i:1;N;i:2;N;}i:2;i:465;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1235;}i:21;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:52:"高通Android平台蓝牙射频测试的启动步骤";i:1;i:1;i:2;i:1235;}i:2;i:1235;}i:22;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1235;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1235;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"参考文档 - 80-WL300-16 BLUETOOTH TEST FOR ANDROID SYSTEM
信令模式
− 使用QRCT
• 从界面关闭蓝牙";}i:2;i:1300;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1420;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:460:"
• #adb root
#adb shell
#ftmdameon
• 启动QRCT -> BT HCI COMMANDS(Click "Disable Legacy support")
->HCI Reset->DUT MODE->Inquiry page scan
->auto accept on role switch enable
− 使用btconfig
• #adb shell
btconfig /dev/smd3 reset
btconfig /dev/smd3 rawcmd 0x06, 0x03
btconfig /dev/smd3 rawcmd 0x03, 0x05, 0x02, 0x00, 0x02
btconfig /dev/smd3 rawcmd 0x03, 0x1A, 0x03
btconfig /dev/smd3 rawcmd 0x03, 0x20, 0x00
btconfig /dev/smd3 rawcmd 0x03, 0x22, 0x00
";i:1;N;i:2;N;}i:2;i:1420;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1420;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"高通Android平台蓝牙射频测试的启动步骤(续)
非信令模式
− 使用QRCT
• 从界面关闭蓝牙";}i:2;i:1889;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2009;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:707:"
• #adb root
#adb shell
#ftmdameon
• 启动QRCT -> FTM Command -> BT -> EPTM
-> Select Bluetooth Chip “QCA6174/WCN2243/36xx”
− 使用btconfig
• i.e TX_Continous
btconfig /dev/smd3 rawcmd 0x3F 0x04 0x05 0x00 0x09 0x05 0x20 0x00 0x00 0x00 0x00
0x3F – OGF, 0x04 – OCF, 0x05 – Subcommand (continuous transmit)
0x00 – TX channel 0, range: 0x00-0x4F
0x09 – TX power level, range: 0-9
0x05 – TX pattern type
04 1-Carrier 05 1-PRBS9 (GFSK) 06 1-PRBS15 (GFSK) 07 1-Pattern (GFSK)
08 2-PRBS9 (Pi/4DQPSK) 09 2-PRBS15 (Pi/4DQPSK) 0A 2-Pattern (Pi/4DQPSK)
0B 3-PRBS9 (8DPSK)
0C 3-PRBS15 (8DPSK)
0D 3-Pattern (8DPSK)
0x20 – TX pattern length, range: 0x01-0x20
0x00 0x00 0x00 0x00 – TX pattern
";i:1;N;i:2;N;}i:2;i:2009;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2009;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:257:"高通Android平台蓝牙射频测试的启动步骤(续)
BLE Direct Test Mode
− Tester
• Install QPST and DUT driver
• Configure HCI command output COM port as NMEA port. Flow control is
none and baud rate is 115200.
− DUT
• 从界面关闭蓝牙";}i:2;i:2725;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2988;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:349:"
• #adb root
#adb shell
#wdsdameon
− NOTE
RF test program can only support COM1 - COM8. If NMEA port number is out of that
range, you need to manually adjust the number. The step to do that is:
• Launch device manager
• Right click on NMEA port and select Properties
• Select Port Settings
• Click on Advanced
• Change COM port number
";i:1;N;i:2;N;}i:2;i:2988;}i:35;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3349;}i:36;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3349;}}