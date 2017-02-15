a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"闪光灯手电模式闪烁的问题";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:39;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:41;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:41;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:208:"闪光灯的模式选择pin接在原始高通的UIM_GPIO56，
由于UIM使用的GPIO会被配成非正常GPIO，在休眠是会被拉高拉低，造成闪光灯在关闭与手电筒模式下切换而闪烁。";}i:2;i:43;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:251;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:251;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"所修改NV项：";}i:2;i:254;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:277;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:215:"
NV 70210:
把hw_config.UIM[1].UIM_CARD_DETECT_GPIO_NUM 的GPIO56改为不使用的GPIO13即可。

Case Number： 01741175
完整的将UIM_GPIO配置为普通GPIO的高通文档：
80-NC839-61_A_UIM_GPIO_Issue.pdf
";i:1;N;i:2;N;}i:2;i:277;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:277;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:205:"最后，高通不建议使用UIM_GPIO作为其他用处，因为UIM的GPIO会一直供电（软件无法修改），如果作为他用可能导致漏电，硬件设计时应尽量避免使用UIM的GPIO。";}i:2;i:501;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:501;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:501;}}