a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"1. 谷歌CTS源码gerrit";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Google CTS source";}i:2;i:40;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:63;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:80:"
https://android-review.googlesource.com/#/q/status:merged+project:platform/cts
";i:1;N;i:2;N;}i:2;i:63;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:153;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"2. 指令";i:1;i:1;i:2;i:153;}i:2;i:153;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:153;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1033:"
./android-cts/tools/cts-tradefed

cts-tf > run cts -c android.media.cts.AdaptivePlaybackTest -m testVP8_flushConfigureDrc
#单测某一子项

cts-tf > run cts -c android.media.cts.AdaptivePlaybackTest --disable-reboot
#测某个项，并且不重启

cts-tf > l r
Session  Pass    Fail  Not Executed  Start time           Plan name      Device serial(s)  
0        197346  215   0             2015.05.11_13.22.45  CTS            d45b6c64          
1        20      2     0             2015.05.13_20.02.30  NA             745b6c56          
2        18      2     0             2015.05.13_20.09.58  NA             745b6c56          
3        2       0     0             2015.05.15_09.58.48  NA             565b6d39

cts-tf > add derivedplan --plan fail -r fail -s 0
#添加名为“fail”的plan，plan项目包含了session为0的测试结果中的fail项
cts-tf > run cts --plan fail
#执行"fail" plan
cts-tf > run cts --continue-session 30
#继续session 30 Not Executed的项

run cts -p android.mediastress
#测整个package
";i:1;N;i:2;N;}i:2;i:180;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1223;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"3. 自定义测试子项";i:1;i:1;i:2;i:1223;}i:2;i:1223;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1223;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:371:"
#修改android-cts/repository/plans/xxx.xml

<TestPlan version="1.0">
<Entry abi="arm64-v8a" name="android.host.theme"/>
<Entry abi="arm64-v8a" name="android.hardware" exclude="android.hardware.consumerir.cts.ConsumerIrTest#test_getCarrierFrequencies;android.hardware.camera2.cts.StillCaptureTest#testAwbRegions;"/>
</TestPlan>

run cts --plan xxx
#执行“xxx“ plan
";i:1;N;i:2;N;}i:2;i:1266;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1647;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1647;}}