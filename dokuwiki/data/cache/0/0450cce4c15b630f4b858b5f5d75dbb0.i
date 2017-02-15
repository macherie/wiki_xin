a:35:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:61:"S200机器反复重启（需要拔电池之后才能恢复）";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:77;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"现象:";}i:2;i:79;}i:6;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:86;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:88;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:94;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:143:"
kernel起来后会出现Oops,而且这个Oops不是固定的，每次都可能不同。接着机器就重启了，就这样不断的重启。
";i:1;N;i:2;N;}i:2;i:94;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:94;}i:11;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:247;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"原因:";}i:2;i:249;}i:13;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:256;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:258;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:264;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:416:"
8625Q平台使用NCP6335D这颗DC-DC Buck来提供CPU的Core电压，某些情况下这个IC会进入错误的状态，它的输出已经不是一系列的方波了，而是连续不变的。
在这种状态下，即使机器重启也不能恢复正常，除非彻底断电。
由于这颗IC的状态异常，也就导致了CPU的Core的电压异常，kernel就会出现随机的Panic，从而导致机器重启。
";i:1;N;i:2;N;}i:2;i:264;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:264;}i:18;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:690;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"解决方案:";}i:2;i:692;}i:20;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:705;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:707;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:713;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:76:"
在oemsbl中重新初始化ncp6335d的寄存器，设置输出电压值。
";i:1;N;i:2;N;}i:2;i:713;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:318:"
ncp6335d_write(0x02, 0xff);
ncp6335d_write(0x10, 0xd0);
ncp6335d_write(0x11, 0xd0);
ncp6335d_write(0x12, 0x00);
ncp6335d_write(0x13, 0x01);//0x01 19
ncp6335d_write(0x14, 0x1);
ncp6335d_write(0x15, 0x80);
ncp6335d_write(0x16, 0x62);//0x62 0x63
udelay(5000);
ncp6335d_write(NCP6335D_REG_PROG_VSEL0, vsel_value | 0x80);
";i:1;s:1:"c";i:2;N;}i:2;i:803;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:803;}i:26;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1132;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"Patch:";}i:2;i:1134;}i:28;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1140;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:1142;}i:30;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:45:"linux:8625q:patch-for-ncp6335d-mess-issue.zip";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1143;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1193;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1193;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1193;}i:34;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1193;}}