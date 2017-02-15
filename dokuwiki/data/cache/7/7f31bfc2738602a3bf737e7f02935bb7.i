a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"linear数据偏移问题";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:25;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:25;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"问题描述：linear某个轴（平放时Z轴）的数据会有0.1m/s/s以上的偏差。";}i:2;i:27;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:117;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:117;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"linear数据是根据两个三轴数据计算得到：gravity和accel";}i:2;i:119;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:188;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:188;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"代码位置：hardware/invensense/invensense_titan/mlsdk/
主要函数：inv_get_linear_accel(ldata);";}i:2;i:190;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:292;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:292;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"相关LOG如下：";}i:2;i:294;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:318;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:815:"
                                                                      linear, accel,   gravity
I/titan   (  592): inv_get_linear_accel,x: 34,      -2681,   -2715, data:34,0
I/titan   (  592): inv_get_linear_accel,y:142,     1494,    1352, data:142,0
I/titan   (  592): inv_get_linear_accel,z:1105,    66570,  65465, data:1105,0

I/titan   (  592): inv_get_linear_accel,x:-172,     -2885,   -2713, data:-172,0
I/titan   (  592): inv_get_linear_accel,y:-1,         1370,     1371, data:-1,0
I/titan   (  592): inv_get_linear_accel,z:1109,    66574,   65465, data:1109,0

I/titan   (  592): inv_get_linear_accel,x:-184,     -2905,     -2721, data:-184,0
I/titan   (  592): inv_get_linear_accel,y:-234,     1139,       1373, data:-234,0
I/titan   (  592): inv_get_linear_accel,z:1110,     66575,    65465, data:1110,0
";i:1;N;i:2;N;}i:2;i:318;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:318;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:101:"通过LOG可以看出z轴值偏大，在1000以上，这个值直接引起0.17m/s/s以上的偏差。";}i:2;i:1143;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1244;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1244;}}