a:36:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"AF tuning Guide";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"现在把以前AF调试的经验分享一下：";}i:2;i:32;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:79;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:79;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"AF调试前的准备";}i:2;i:81;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:101;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:446:"AF调试前需要准备该模组的SPEC和sensor ic的datasheet，确定需要调试的马达ic，确认其是否在高通的认证列表中(PVL),
如果该driver ic已经在PVL中，你可以在CreatPoint中下载该驱动代码，后续调试会比较顺利；
如果调试的马达ic不在PVL中，那么恭喜你，这次调试可能会比较坎坷，你需要尽快向模组厂那边要到驱动代码，并尽快完成基本驱动的调试
";}i:2;i:101;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:101;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"以下是调试AF的主要步骤：";}i:2;i:557;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:592;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:592;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"1 填写高通AF调试的excel表：80-NN841-1";}i:2;i:595;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:641;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:641;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"<1>, 模组的SPEC，用来获取AF的EFL,Pixel size,FNumber";}i:2;i:643;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:703;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:703;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"<2>, sensor datasheet用来查询sensor一些属性";}i:2;i:705;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:756;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:756;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"<3>, AF驱动马达的SPEC，用来参考调试AF";}i:2;i:758;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:807;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:807;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:155:"<4>, 模组厂提供的三姿态数据，用来计算AF驱动斜率(um/DAC)，已经最小启动电流对应的DAC，以及HPF，SSF，SNF对应的DAC code";}i:2;i:809;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:964;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:964;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"2 对照80-NN841文档，完成AF相关的code填写，编译代码，push进手机";}i:2;i:967;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1050;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1050;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:273:"3 用Fullsweep测试AF在各个物距下对应的lens pos，测试AF的稳定性和准确性，回填到code中，重新编译代码，并push进手机，然后再主观测试一下AF的效果，
如果对焦准确性和稳定性正常，那么AF的初调就已经完成了";}i:2;i:1052;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1325;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1325;}i:35;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1325;}}