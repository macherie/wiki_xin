a:527:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5;}i:5;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:6;}i:6;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:23:"liangjiong.zhou@sim.com";i:1;s:15:"liangjiong.zhou";}i:2;i:8;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" 2014/04/04 08:01";}i:2;i:51;}i:8;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:68;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:70;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"ARM Linux Device Tree";i:1;i:1;i:2;i:72;}i:2;i:72;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:72;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:72;}i:13;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:1;i:1;a:2:{i:0;s:3:"red";i:1;s:0:"";}}i:2;i:1;i:3;s:11:"<color red>";}i:2;i:109;}i:14;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:3;i:1;s:39:"WIKI 翻译至 devicetree 官网wiki：";}i:2;i:3;i:3;s:39:"WIKI 翻译至 devicetree 官网wiki：";}i:2;i:120;}i:15;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:4;i:1;s:0:"";}i:2;i:4;i:3;s:8:"</color>";}i:2;i:159;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:167;}i:17;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:59:"http://devicetree.org/Device_Tree_Usage#How_Interrupts_Work";i:1;s:15:"原文请跳至";}i:2;i:168;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:247;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:250;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"基本数据格式";i:1;i:2;i:2;i:250;}i:2;i:250;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:250;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:250;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:192:"设备树是一个包含节点和属性的简单树状结构。属性就是键－值对，而节点可以同时包含属性和子节点。例如，以下就是一个 .dts 格式的简单树：";}i:2;i:282;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:474;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:529:"
/ {
    node1 {
        a-string-property = "A string";
        a-string-list-property = "first string", "second string";
        a-byte-data-property = [0x01 0x23 0x34 0x56];
        child-node1 {
            first-child-property;
            second-child-property = <1>;
            a-string-property = "Hello, world";
        };
        child-node2 {
        };
    };
    node2 {
        an-empty-property;
        a-cell-property = <1 2 3 4>; /* each number (cell) is a uint32 */
        child-node1 {
        };
    };
};
";i:1;N;i:2;N;}i:2;i:481;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:481;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"这棵树显然是没什么用的，因为它并没有描述任何东西，但它确实体现了节点的一些属性：";}i:2;i:1020;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1141;}i:29;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1141;}i:30;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1141;}i:31;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1141;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" 一个单独的根节点：“/”";}i:2;i:1145;}i:33;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1180;}i:34;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1180;}i:35;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1180;}i:36;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1180;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:" 两个子节点：“node1”和“node2”";}i:2;i:1184;}i:38;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1228;}i:39;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1228;}i:40;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1228;}i:41;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1228;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:" 两个 node1 的子节点：“child-node1”和“child-node2”";}i:2;i:1232;}i:43;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1298;}i:44;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1298;}i:45;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1298;}i:46;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1298;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" 一堆分散在树里的属性。";}i:2;i:1302;}i:48;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1336;}i:49;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1336;}i:50;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1336;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1336;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:210:"属性是简单的键－值对，它的值可以为空或者包含一个任意字节流。虽然数据类型并没有编码进数据结构，但在设备树源文件中任有几个基本的数据表示形式。";}i:2;i:1338;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1548;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1548;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"文本字符串（无结束符）可以用双引号表示：";}i:2;i:1550;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1610;}i:57;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:30:"  string-property = "a string"";}i:2;i:1610;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1610;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"‘Cells’是 32 位无符号整数，用尖括号限定：";}i:2;i:1644;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1704;}i:61;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:41:"  cell-property = <0xbeef 123 0xabcd1234>";}i:2;i:1704;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1704;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"二进制数据用方括号限定：";}i:2;i:1749;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1785;}i:65;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:42:"  binary-property = [0x01 0x23 0x45 0x67];";}i:2;i:1785;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1785;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"不同表示形式的数据可以使用逗号连在一起：";}i:2;i:1831;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1891;}i:69;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:67:"  mixed-property = "a string", [0x01 0x23 0x45 0x67], <0x12345678>;";}i:2;i:1891;}i:70;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1891;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"逗号也可用于创建字符串列表：";}i:2;i:1962;}i:72;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2004;}i:73;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:40:"  string-list = "red fish", "blue fish";";}i:2;i:2004;}i:74;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2051;}i:75;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"基本概念";i:1;i:2;i:2;i:2051;}i:2;i:2051;}i:76;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2051;}i:77;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2051;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:"我们将以一个简单机开始，然后通过一步步的建立一个描述这个简单机的设备树，来了解如何使用设备树。";}i:2;i:2077;}i:79;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2218;}i:80;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2220;}i:81;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"模型机";i:1;i:3;i:2;i:2220;}i:2;i:2220;}i:82;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2220;}i:83;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2220;}i:84;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:129:"考虑下面这个假想的机器（大致基于ARM Versatile），制造商为“Acme”，并命名为“Coyote's Revenge”：";}i:2;i:2241;}i:85;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2371;}i:86;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2371;}i:87;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2371;}i:88;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2371;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:" 一个 32 位 ARM CPU";}i:2;i:2375;}i:90;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2397;}i:91;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2397;}i:92;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2397;}i:93;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2397;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:129:" 处理器本地总线连接到内存映射的串行口、spi 总线控制器、i2c 控制器、中断控制器和外部总线桥";}i:2;i:2401;}i:95;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2530;}i:96;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2530;}i:97;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2530;}i:98;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2530;}i:99;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:" 256MB SDRAM 起始地址为 0";}i:2;i:2534;}i:100;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2564;}i:101;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2564;}i:102;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2564;}i:103;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2564;}i:104;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:" 两个串口起始地址：0x101F1000 和 0x101F2000";}i:2;i:2568;}i:105;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2621;}i:106;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2621;}i:107;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2621;}i:108;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2621;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" GPIO 控制器起始地址：0x101F3000";}i:2;i:2625;}i:110;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2665;}i:111;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2665;}i:112;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:1;i:1;i:1;}i:2;i:2665;}i:113;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2665;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:" 带有以下设备的 SPI 控制器起始地址：0x10170000";}i:2;i:2669;}i:115;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2730;}i:116;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2730;}i:117;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:2730;}i:118;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2730;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" MMC 插槽的 SS 管脚连接至 GPIO #1";}i:2;i:2738;}i:120;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2779;}i:121;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2779;}i:122;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2779;}i:123;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2779;}i:124;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:1;i:1;i:1;}i:2;i:2779;}i:125;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2779;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" 外部总线桥挂载以下设备";}i:2;i:2783;}i:127;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2817;}i:128;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2817;}i:129;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:2817;}i:130;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2817;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:" SMC SMC91111 以太网设备连接到外部总线，起始地址：0x10100000";}i:2;i:2825;}i:132;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2903;}i:133;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2903;}i:134;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:2903;}i:135;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2903;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:" i2c 控制器起始地址：0x10160000，并挂载以下设备";}i:2;i:2911;}i:137;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2974;}i:138;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2974;}i:139;a:3:{i:0;s:13:"listitem_open";i:1;a:2:{i:0;i:3;i:1;i:1;}i:2;i:2974;}i:140;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2974;}i:141;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" Maxim DS1338 实时时钟。响应至从地址 1101000 (0x58)";}i:2;i:2982;}i:142;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3044;}i:143;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3044;}i:144;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:5;}i:2;i:3044;}i:145;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3044;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" Maxim DS1338 实时时钟。响应至从地址 1101000 (0x58)";}i:2;i:3056;}i:147;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3118;}i:148;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3118;}i:149;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3118;}i:150;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3118;}i:151;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3118;}i:152;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3118;}i:153;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3118;}i:154;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3118;}i:155;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:" 64MB NOR 闪存起始地址 0x30000000";}i:2;i:3122;}i:156;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3161;}i:157;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3161;}i:158;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3161;}i:159;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3170;}i:160;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"初始结构";i:1;i:3;i:2;i:3170;}i:2;i:3170;}i:161;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3170;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3170;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:165:"第一步就是要为这个模型机构建一个基本结构，这是一个有效的设备树最基本的结构。在这个阶段你需要唯一的标识该机器。";}i:2;i:3194;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3359;}i:165;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
/ {
    compatible = "acme,coyotes-revenge";
};
";i:1;N;i:2;N;}i:2;i:3366;}i:166;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3366;}i:167;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:1;i:1;a:2:{i:0;s:3:"red";i:1;s:9:"lightgrey";}}i:2;i:1;i:3;s:21:"<color red/lightgrey>";}i:2;i:3425;}i:168;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:3;i:1;s:10:"compatible";}i:2;i:3;i:3;s:10:"compatible";}i:2;i:3446;}i:169;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:4;i:1;s:0:"";}i:2;i:4;i:3;s:8:"</color>";}i:2;i:3456;}i:170;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:337:" 指定了系统的名称。它包含了一个“<制造商>,<型号>”形式的字符串。重要的是要指定一个确切的设备，并且包括制造商的名子， 以避免命名空间冲突。由于操作系统会使用 compatible 的值来决定如何在机器上运行，所以正确的设置这个属性变得非常重要。";}i:2;i:3464;}i:171;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3801;}i:172;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3803;}i:173;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"中央处理器";i:1;i:3;i:2;i:3803;}i:2;i:3803;}i:174;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3803;}i:175;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3803;}i:176;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:202:"接下来就应该描述每个 CPU 了。先添加一个名为“cpus”的容器节点，然后为每个 CPU 分别添加子节点。具体到我们的情况是一个 ARM 的 双核 Cortex A9 系统。";}i:2;i:3830;}i:177;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4032;}i:178;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:205:"
/ {
    compatible = "acme,coyotes-revenge";
    cpus {
        cpu@0 {
            compatible = "arm,cortex-a9";
        };
        cpu@1 {
            compatible = "arm,cortex-a9";
        };
    };
};
";i:1;N;i:2;N;}i:2;i:4039;}i:179;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4039;}i:180;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:164:"每个 cpu 节点的 compatible 属性是一个“<制造商>,<型号>”形式的字符串，并指定了确切的 cpu，就像顶层的 compatible 属性一样。";}i:2;i:4254;}i:181;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4418;}i:182;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4420;}i:183;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"节点名称";i:1;i:3;i:2;i:4420;}i:2;i:4420;}i:184;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4420;}i:185;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4420;}i:186;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:639:"现在应该花点时间来讨论命名约定了。每个节点必须有一个“<名称>[@<设备地址>]”形式的名字。
<名称> 就是一个不超过31位的简单 ascii 字符串。通常，节点的命名应该根据它所体现的是什么样的设备。比如一个 3com 以太网适配器的节点就应该命名为 ethernet，而不应该是 3com509。
如果该节点描述的设备有一个地址的话就还应该加上设备地址（unit-address）。通常，设备地址就是用来访问该设备的主地址，并且该地址也在节点的 reg 属性中列出。本文档中我们将在稍后涉及到 reg 属性。";}i:2;i:4444;}i:187;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5083;}i:188;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5083;}i:189;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:230:"同级节点命名必须是唯一的，但只要地址不同，多个节点也可以使用一样的通用名称（例如 serial@101f1000 和 serial@101f2000）。关于节点命名的更多细节请参考 ePAPR 规范 2.2.1 节。";}i:2;i:5085;}i:190;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5315;}i:191;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5318;}i:192;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"设备";i:1;i:3;i:2;i:5318;}i:2;i:5318;}i:193;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5318;}i:194;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5318;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:231:"系统中每个设备都表示为一个设备树节点。所以接下来就应该为这个设备树填充设备节点。现在，知道我们讨论如何进行寻址和中断请求如何处理之前这些新节点将一直为空。";}i:2;i:5336;}i:196;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5567;}i:197;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:888:"
/ {
    compatible = "acme,coyotes-revenge";

    cpus {
        cpu@0 {
            compatible = "arm,cortex-a9";
        };
        cpu@1 {
            compatible = "arm,cortex-a9";
        };
    };

    serial@101F0000 {
        compatible = "arm,pl011";
    };

    serial@101F2000 {
        compatible = "arm,pl011";
    };

    gpio@101F3000 {
        compatible = "arm,pl061";
    };

    interrupt-controller@10140000 {
        compatible = "arm,pl190";
    };

    spi@10115000 {
        compatible = "arm,pl022";
    };

    external-bus {
        ethernet@0,0 {
            compatible = "smc,smc91c111";
        };

        i2c@1,0 {
            compatible = "acme,a1234-i2c-bus";
            rtc@58 {
                compatible = "maxim,ds1338";
            };
        };

        flash@2,0 {
            compatible = "samsung,k8f1315ebm", "cfi-flash";
        };
    };
};
";i:1;N;i:2;N;}i:2;i:5574;}i:198;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5574;}i:199;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:325:"在此树中，已经为系统中的每个设备添加了节点，而且这个·层次结构也反映了设备与系统的连接方式。例如，外部总线上的设备就是外部总线节点的子节点，i2c 设备就是 i2c 总线节点的子节点。通常，这个层次结构表现的是 CPU 视角的系统视图。";}i:2;i:6472;}i:200;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6797;}i:201;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6797;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"现在这棵树还是无效的，因为它缺少关于设备之间互联的信息。稍后将添加这些信息。";}i:2;i:6799;}i:203;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6913;}i:204;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6913;}i:205;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"在这颗树中，应该注意这些事情：";}i:2;i:6915;}i:206;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6961;}i:207;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6961;}i:208;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6961;}i:209;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6961;}i:210;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:" 每个设备节点都拥有一个 compatible 属性。";}i:2;i:6965;}i:211;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7020;}i:212;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7020;}i:213;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7020;}i:214;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7020;}i:215;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:108:" 闪存（flash）节点的 compatible 属性由两个字符串构成。欲知为何，请阅读下一节。";}i:2;i:7024;}i:216;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7132;}i:217;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7132;}i:218;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7132;}i:219;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7132;}i:220;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:192:" 正如前面所述，节点的命名应当反映设备的类型而不是特定的型号。请查阅 ePAPR 规范第 2.2.2 节里定义的通用节点名，应当优先使用这些节点名。";}i:2;i:7136;}i:221;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7328;}i:222;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7328;}i:223;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7328;}i:224;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7333;}i:225;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"compatible 属性";i:1;i:3;i:2;i:7333;}i:2;i:7333;}i:226;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7333;}i:227;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7333;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:188:"树中每个表示一个设备的节点都需要一个 compatible 属性。compatible 属性是操作系统用来决定使用哪个设备驱动来绑定到一个设备上的关键因素。";}i:2;i:7362;}i:229;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7550;}i:230;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7550;}i:231;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:140:"compatible 是一个字符串列表，之中第一个字符串指定了这个节点所表示的确切的设备，该字符串的格式为：";}i:2;i:7552;}i:232;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7692;}i:233;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"<制造商>,<型号>";}i:2;i:7693;}i:234;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7713;}i:235;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"。剩下的字符串的则表示其它与之相兼容的设备。";}i:2;i:7714;}i:236;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7780;}i:237;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7780;}i:238;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:214:"例如，Freescale MPC8349 片上系统（SoC）拥有一个实现了美国国家半导体 ns16550 的寄存器接口的串行设备，那么 MPC8349 的串行设备的 compatible 属性就应该是：compatible = ";}i:2;i:7782;}i:239;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7996;}i:240;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"fsl,mpc8349-uart";}i:2;i:7997;}i:241;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8013;}i:242;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:", ";}i:2;i:8014;}i:243;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:8016;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"ns16550";}i:2;i:8017;}i:245;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8024;}i:246;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:282:"。在这里，mpc8349-uart 指定了确切的设备，而 ns16550 则说明这是与美国国家半导体 ns16550 UART 的寄存器级兼容。
注：ns16550 并没有制造商前缀，这仅仅是历史原因造成的。所有的新 compatible 值都应该使用制造商前缀。";}i:2;i:8025;}i:247;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8307;}i:248;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8307;}i:249;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"这种做法可以使现有的设备驱动能够绑定到新设备上，并仍然唯一的指定确切的设备。";}i:2;i:8309;}i:250;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8423;}i:251;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8423;}i:252;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:313:"警告：不要使用带通配符的 compatible 值，比如“fsl,mpc83xx-uart”或类似情况。芯片提供商无不会做出一些能够轻易打破你通配符猜想的变化，这时候在修改已经为时已晚了。相反，应该选择一个特定的芯片然后是所有后续芯片都与之兼容。";}i:2;i:8425;}i:253;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8738;}i:254;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8740;}i:255;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"如何编址";i:1;i:3;i:2;i:8740;}i:2;i:8740;}i:256;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8740;}i:257;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8740;}i:258;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"可编址设备使用以下属性将地址信息编码进设备树：";}i:2;i:8764;}i:259;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8834;}i:260;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8834;}i:261;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8834;}i:262;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8834;}i:263;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" reg";}i:2;i:8838;}i:264;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8842;}i:265;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8842;}i:266;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8842;}i:267;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8842;}i:268;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" #address-cells";}i:2;i:8846;}i:269;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8861;}i:270;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8861;}i:271;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8861;}i:272;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8861;}i:273;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" #size-cells";}i:2;i:8865;}i:274;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8877;}i:275;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8877;}i:276;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8877;}i:277;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8877;}i:278;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"每个可编址设备都有一个元组列表的 reg，元组的形式为：reg = <地址1 长度1 [地址2 长度2] [地址3 长度3] ";}i:2;i:8879;}i:279;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:9014;}i:280;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:200:" >。每个元组都表示一个该设备使用的地址范围。每个地址值是一个或多个 32 位整型数列表，称为 cell。同样，长度值也可以是一个 cell 列表或者为空。";}i:2;i:9017;}i:281;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9217;}i:282;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9217;}i:283;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:371:"由于地址和长度字段都是可变大小的变量，那么父节点的 #address-cells 和 #size-cells 属性就用来声明各个字段的 cell 的数量。换句话说，正确解释一个 reg 属性需要用到父节点的 #address-cells 和 #size-cells 的值。要知道这一切是如何运作的，我们将给模型机添加编址属性，就从 CPU 开始。";}i:2;i:9219;}i:284;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9590;}i:285;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9592;}i:286;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"CPU 编址";i:1;i:3;i:2;i:9592;}i:2;i:9592;}i:287;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9592;}i:288;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9592;}i:289;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:149:"CPU 节点表示了一个关于编址的最简单的例子。每个 CPU 都分配了一个唯一的 ID，并且没有 CPU id 相关的大小信息。";}i:2;i:9614;}i:290;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9763;}i:291;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:260:"
    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        cpu@0 {
            compatible = "arm,cortex-a9";
            reg = <0>;
        };
        cpu@1 {
            compatible = "arm,cortex-a9";
            reg = <1>;
        };
    };
";i:1;N;i:2;N;}i:2;i:9770;}i:292;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9770;}i:293;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:314:"在 cpu 节点中，#address-cells 设置为 1，#size-cells 设置为 0。这意味着子节点的 reg 值是一个单一的 uint32，这是一个不包含大小字段的地址，为这两个 cpu 分配的地址是 0 和 1。cpu 节点的 #size-cells 为 0 是因为只为每个 cpu 分配一个单独的地址。";}i:2;i:10040;}i:294;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10354;}i:295;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10354;}i:296;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:228:"你可能还会注意到 reg 的值和节点名字是相同的。按照惯例，如果一个节点有 reg 属性，那么该节点的名字就必须包含设备地址，这个设备地址就是 reg 属性里第一个地址值。";}i:2;i:10356;}i:297;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10584;}i:298;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10587;}i:299;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"内存映射设备";i:1;i:3;i:2;i:10587;}i:2;i:10587;}i:300;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10587;}i:301;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10587;}i:302;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:415:"与 cpu 节点里单一地址值不同，应该分配给内存映射设备一个地址范围。#size-cells 声明每个子节点的 reg 元组中长度字段的大小。在接下来的例子中，每个地址值是 1 cell（32 位），每个长度值也是 1 cell，这是典型的 32 位系统。64 位的机器则可以使用值为 2 的 #address-cells 和 #size-cells 来获得在设备树中的 64 位编址。";}i:2;i:10617;}i:303;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11032;}i:304;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:616:"
/ {
    #address-cells = <1>;
    #size-cells = <1>;

    ...

    serial@101f0000 {
        compatible = "arm,pl011";
        reg = <0x101f0000 0x1000 >;
    };

    serial@101f2000 {
        compatible = "arm,pl011";
        reg = <0x101f2000 0x1000 >;
    };

    gpio@101f3000 {
        compatible = "arm,pl061";
        reg = <0x101f3000 0x1000
               0x101f4000 0x0010>;
    };

    interrupt-controller@10140000 {
        compatible = "arm,pl190";
        reg = <0x10140000 0x1000 >;
    };

    spi@10115000 {
        compatible = "arm,pl022";
        reg = <0x10115000 0x1000 >;
    };

    ...
};
";i:1;N;i:2;N;}i:2;i:11039;}i:305;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11039;}i:306;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:130:"每个设备都被分配了一个基址以及该区域的大小。这个例子中为 GPIO 分配了两个地址范围：0x101f3000";}i:2;i:11665;}i:307;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:11795;}i:308;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"0x101f3fff 和 0x101f4000..0x101f400f。";}i:2;i:11798;}i:309;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11838;}i:310;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11838;}i:311;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:354:"一些挂在总线上的设备有不同的编址方案。例如一个带独立片选线的设备也可以连接至外部总线。由于父节点会为其子节点定义地址域，所以可以选择不同的地址映射来最恰当的描述该系统。下面的代码展示了设备连接至外部总线并将其片选号编码进地址的地址分配。";}i:2;i:11841;}i:312;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12195;}i:313;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:505:"
external-bus {
        #address-cells = <2>
        #size-cells = <1>;

        ethernet@0,0 {
            compatible = "smc,smc91c111";
            reg = <0 0 0x1000>;
        };

        i2c@1,0 {
            compatible = "acme,a1234-i2c-bus";
            reg = <1 0 0x1000>;
            rtc@58 {
                compatible = "maxim,ds1338";
            };
        };

        flash@2,0 {
            compatible = "samsung,k8f1315ebm", "cfi-flash";
            reg = <2 0 0x4000000>;
        };
    };
";i:1;N;i:2;N;}i:2;i:12202;}i:314;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12202;}i:315;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:317:"外部总线的地址值使用了两个 cell，一个用于片选号；另一个则用于片选基址的偏移量。而长度字段则还是单个 cell，这是因为只有地址的偏移部分才需要一个范围量。所以，在这个例子中，每个 reg 项都有三个 cell：片选号、偏移量和长度。";}i:2;i:12717;}i:316;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13034;}i:317;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13034;}i:318;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:285:"由于地址域是包含于一个节点及其子节点的，所以父节点可以自由的定义任何对于该总线来说有意义的编址方案。那些在直接父节点和子节点以外的节点通常不关心本地地址域，而地址应该从一个域映射到另一个域。";}i:2;i:13036;}i:319;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13321;}i:320;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13324;}i:321;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"非内存映射设备";i:1;i:3;i:2;i:13324;}i:2;i:13324;}i:322;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:13324;}i:323;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13324;}i:324;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:223:"其他的设备没有被映射到处理机总线上。虽然这些设备可以有一个地址范围，但他们并不是由 CPU 直接访问。取而代之的是，父设备的驱动程序会代表 CPU 执行简介访问。";}i:2;i:13357;}i:325;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13580;}i:326;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13580;}i:327;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:157:"以 i2c 设备为例，每个设备都分配了一个地址，但并没有与之关联的长度或范围信息。这看起来和 CPU 的地址分配很像。";}i:2;i:13582;}i:328;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13739;}i:329;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:203:"
i2c@1,0 {
    compatible = "acme,a1234-i2c-bus";
    #address-cells = <1>;
    #size-cells = <0>;
    reg = <1 0 0x1000>;
    rtc@58 {
        compatible = "maxim,ds1338";
        reg = <58>;
    };
};
";i:1;N;i:2;N;}i:2;i:13746;}i:330;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13960;}i:331;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"范围（地址转换）";i:1;i:3;i:2;i:13960;}i:2;i:13960;}i:332;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:13960;}i:333;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13960;}i:334;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:194:"我们已经讨论了如何给设备分配地址，但目前来说这些地址还只是设备节点的本地地址，我们还没有描述如何将这些地址映射成 CPU 可使用的地址。";}i:2;i:13996;}i:335;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14190;}i:336;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14190;}i:337;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:230:"根节点始终描述的是 CPU 视角的地址空间。根节点的子节点已经使用的是 CPU 的地址域，所以它们不需要任何直接映射。例如，serial@101f0000 设备就是直接分配的 0x101f0000 地址。";}i:2;i:14192;}i:338;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14422;}i:339;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14422;}i:340;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:220:"那些非根节点直接子节点的节点就没有使用 CPU 地址域。为了得到一个内存映射地址，设备树必须指定从一个域到另一个域地址转换地方法，而 ranges 属性就为此而生。";}i:2;i:14424;}i:341;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14644;}i:342;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14644;}i:343;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"下面就是一个添加了 ranges 属性的示例设备树。";}i:2;i:14646;}i:344;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14708;}i:345;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:936:"
/ {
    compatible = "acme,coyotes-revenge";
    #address-cells = <1>;
    #size-cells = <1>;
    ...
    external-bus {
        #address-cells = <2>
        #size-cells = <1>;
        ranges = <0 0  0x10100000   0x10000     // Chipselect 1, Ethernet
                  1 0  0x10160000   0x10000     // Chipselect 2, i2c controller
                  2 0  0x30000000   0x1000000>; // Chipselect 3, NOR Flash

        ethernet@0,0 {
            compatible = "smc,smc91c111";
            reg = <0 0 0x1000>;
        };

        i2c@1,0 {
            compatible = "acme,a1234-i2c-bus";
            #address-cells = <1>;
            #size-cells = <0>;
            reg = <1 0 0x1000>;
            rtc@58 {
                compatible = "maxim,ds1338";
                reg = <58>;
            };
        };

        flash@2,0 {
            compatible = "samsung,k8f1315ebm", "cfi-flash";
            reg = <2 0 0x4000000>;
        };
    };
};
";i:1;N;i:2;N;}i:2;i:14715;}i:346;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14715;}i:347;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:411:"ranges 是一个地址转换列表。ranges 表中的每一项都是一个包含子地址、父地址和在子地址空间中区域大小的元组。每个字段的值都取决于子节点的 #address-cells 、父节点的 #address-cells 和子节点的 #size-cells。以本例中的外部总线来说，子地址是 2 cell、父地址是 1 cell、区域大小也是 1 cell。那么三个 ranges 被翻译为：";}i:2;i:15661;}i:348;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16072;}i:349;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16072;}i:350;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:248:"从片选 0 开始的偏移量 0 被映射为地址范围：0x10100000..0x1010ffff
从片选 0 开始的偏移量 1 被映射为地址范围：0x10160000..0x1016ffff
从片选 0 开始的偏移量 2 被映射为地址范围：0x30000000..0x10000000";}i:2;i:16074;}i:351;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16322;}i:352;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16322;}i:353;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:199:"另外，如果父地址空间和子地址空间是相同的，那么该节点可以添加一个空的 range 属性。一个空的 range 属性意味着子地址将被 1:1 映射到父地址空间。";}i:2;i:16324;}i:354;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16523;}i:355;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16523;}i:356;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:511:"你有可能会问当全都可以设计成 1:1 映射的时候为何还要使用地址转换。答案就是，有一些具有完全不同地址空间的总线（比如 PCI），而它们的细节需要暴露给操作系统。另外一些带有 DMA 引擎的设备需要知道总线上的真实地址。有时有需要将设备组合到一块，因为他们共享相同的软件可编程物理地址映射。是否应该使用 1:1 映射在很大程度上取决于来自操作系统的信息以及硬件设计。";}i:2;i:16525;}i:357;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17036;}i:358;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17036;}i:359;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:352:"你还应该注意到在 i2c@1,0 节点中并没有 range 属性。不同于外部总线，这里的原因是 i2c 总线上的设备并没有被内存映射到 CPU 的地址域。相反，CPU 将通过 i2c@1,0 设备间接访问 rtc@58 设备。缺少 ranges 属性意味着这个设备将不能被出他的父设备之外的任何设备直接访问。";}i:2;i:17038;}i:360;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17390;}i:361;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17393;}i:362;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"中断如何工作";i:1;i:3;i:2;i:17393;}i:2;i:17393;}i:363;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:17393;}i:364;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17393;}i:365;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:318:"与遵循树的自然结构而进行的地址转换不同，机器上的任何设备都可以发起和终止中断信号。另外地址的编址也不同于中断信号，前者是设备树的自然表示，而后者者表现为独立于设备树结构的节点之间的链接。描述中断连接需要四个属性：";}i:2;i:17423;}i:366;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17742;}i:367;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:17742;}i:368;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17742;}i:369;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17742;}i:370;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:99:" interrupt-controller - 一个空的属性定义该节点作为一个接收中断信号的设备。";}i:2;i:17746;}i:371;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:17845;}i:372;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:17845;}i:373;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:17845;}i:374;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:17845;}i:375;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:180:" #interrupt-cells - 这是一个中断控制器节点的属性。它声明了该中断控制器的中断指示符中 cell 的个数（类似于 #address-cells 和 #size-cells）。";}i:2;i:17849;}i:376;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18029;}i:377;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18029;}i:378;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18029;}i:379;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18029;}i:380;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:205:" interrupt-parent - 这是一个设备节点的属性，包含一个指向该设备连接的中断控制器的 phandle。那些没有 interrupt-parent 的节点则从它们的父节点中继承该属性。";}i:2;i:18033;}i:381;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18238;}i:382;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18238;}i:383;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:18238;}i:384;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:18238;}i:385;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:131:" interrupts - 一个设备节点属性，包含一个中断指示符的列表，对应于该设备上的每个中断输出信号。";}i:2;i:18242;}i:386;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:18373;}i:387;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:18373;}i:388;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:18373;}i:389;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18373;}i:390;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:444:"中断指示符是一个或多个 cell 的数据（由 #interrupt-cells 指定），这些数据指定了该设备连接至哪些输入中断。在以下的例子中，大部分设备都只有一个输出中断，但也有可能在一个设备上有多个输出中断。一个中断指示 符的意义完全取决于与中断控制器设备的 binding。每个中断控制器可以决定使用几个 cell 来唯一的定义一个输入中断。";}i:2;i:18375;}i:391;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18819;}i:392;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18819;}i:393;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"下面的代码为我们 Coyote's Revenge 模型机添加了中断连接：";}i:2;i:18821;}i:394;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18896;}i:395;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2056:"
/ {
    compatible = "acme,coyotes-revenge";
    #address-cells = <1>;
    #size-cells = <1>;
    interrupt-parent = <&intc>;

    cpus {
        #address-cells = <1>;
        #size-cells = <0>;
        cpu@0 {
            compatible = "arm,cortex-a9";
            reg = <0>;
        };
        cpu@1 {
            compatible = "arm,cortex-a9";
            reg = <1>;
        };
    };

    serial@101f0000 {
        compatible = "arm,pl011";
        reg = <0x101f0000 0x1000 >;
        interrupts = < 1 0 >;
    };

    serial@101f2000 {
        compatible = "arm,pl011";
        reg = <0x101f2000 0x1000 >;
        interrupts = < 2 0 >;
    };

    gpio@101f3000 {
        compatible = "arm,pl061";
        reg = <0x101f3000 0x1000
               0x101f4000 0x0010>;
        interrupts = < 3 0 >;
    };

    intc: interrupt-controller@10140000 {
        compatible = "arm,pl190";
        reg = <0x10140000 0x1000 >;
        interrupt-controller;
        #interrupt-cells = <2>;
    };

    spi@10115000 {
        compatible = "arm,pl022";
        reg = <0x10115000 0x1000 >;
        interrupts = < 4 0 >;
    };

    external-bus {
        #address-cells = <2>
        #size-cells = <1>;
        ranges = <0 0  0x10100000   0x10000     // Chipselect 1, Ethernet
                  1 0  0x10160000   0x10000     // Chipselect 2, i2c controller
                  2 0  0x30000000   0x1000000>; // Chipselect 3, NOR Flash

        ethernet@0,0 {
            compatible = "smc,smc91c111";
            reg = <0 0 0x1000>;
            interrupts = < 5 2 >;
        };

        i2c@1,0 {
            compatible = "acme,a1234-i2c-bus";
            #address-cells = <1>;
            #size-cells = <0>;
            reg = <1 0 0x1000>;
            interrupts = < 6 2 >;
            rtc@58 {
                compatible = "maxim,ds1338";
                reg = <58>;
                interrupts = < 7 3 >;
            };
        };

        flash@2,0 {
            compatible = "samsung,k8f1315ebm", "cfi-flash";
            reg = <2 0 0x4000000>;
        };
    };
};
";i:1;N;i:2;N;}i:2;i:18903;}i:396;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18903;}i:397;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"需要注意的事情：";}i:2;i:20969;}i:398;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20993;}i:399;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:20993;}i:400;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:20993;}i:401;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:20993;}i:402;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" 这个机器只有一个中断控制器：interrupt-controller@10140000。";}i:2;i:20997;}i:403;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:21072;}i:404;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:21072;}i:405;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:21072;}i:406;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:21072;}i:407;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:262:" 中断控制器节点上添加了‘inc:’标签，该标签用于给根节点的 interrupt-parent 属性分配一个 phandle。这个 interrupt-parent 将成为本系统的默认值，因为所有的子节点都将继承它，除非显示覆写这个属性。";}i:2;i:21076;}i:408;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:21338;}i:409;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:21338;}i:410;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:21338;}i:411;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:21338;}i:412;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:" 每个设备使用 interrupts 属性来不同的中断输入线。";}i:2;i:21342;}i:413;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:21409;}i:414;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:21409;}i:415;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:21409;}i:416;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:21409;}i:417;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:376:"  #interrupt-cells 是 2，所以每个中断指示符都有 2 个 cell。本例使用一种通用的模式，也就是用第一个 cell 来编码中断线号；然后用第二个 cell 编码标志位，比如高电平/低电平有效，或者边缘/水平触发。对于任何给定的中断控制器，请参考该控制器的 binding 文档以了解指示符如何编码。";}i:2;i:21413;}i:418;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:21789;}i:419;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:21789;}i:420;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:21789;}i:421;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21792;}i:422;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"设备特定数据";i:1;i:3;i:2;i:21792;}i:2;i:21792;}i:423;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:21792;}i:424;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21792;}i:425;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:159:"除了通用属性以外，一个节点中可以添加任何属性和子节点。只要遵循一些规则，可以添加任何操作系统所需要的数据。";}i:2;i:21822;}i:426;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21981;}i:427;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21981;}i:428;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"首先，新的设备特定属性的名字都应该使用制造商前缀，以避免和现有标准属性名相冲突。";}i:2;i:21983;}i:429;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22103;}i:430;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22103;}i:431;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:715:"其次，属性和子节点的含义必须存档在 binding 文档中，以便设备驱动程序的程序员知道如何解释这些数据。一个 binding 记录了一个特定 compatible 值的意义、应该包含什么样的属性、有可能包含那些子节点、以及它代表了什么样的设备。每个特别的 compatible 值都应该有一个它自己的 binding（或者要求与其他 compatible 值兼容）。新设备的 binding 存档在本 wiki 中。请查看主页上的文档格式描述和审核流程
第三，使用邮件列表 devicetree-discuss@lists.ozlabs.org 发送新的 binding 以进行审核。新 binding 的审核可以捕获很多可能在以后导致问题的常见错误。";}i:2;i:22105;}i:432;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22820;}i:433;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22822;}i:434;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"特殊节点";i:1;i:3;i:2;i:22822;}i:2;i:22822;}i:435;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:22822;}i:436;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22822;}i:437;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:22846;}i:438;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:1;i:1;a:2:{i:0;s:3:"red";i:1;s:0:"";}}i:2;i:1;i:3;s:11:"<color red>";}i:2;i:22848;}i:439;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:3;i:1;s:16:" aliases 节点 ";}i:2;i:3;i:3;s:16:" aliases 节点 ";}i:2;i:22859;}i:440;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:4;i:1;s:0:"";}i:2;i:4;i:3;s:8:"</color>";}i:2;i:22875;}i:441;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:22883;}i:442;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22885;}i:443;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22885;}i:444;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:280:"引用一个特定的节点通常使用全路径，如 /external-bus/ethernet@0,0，但当用户真真想知道的只是“那个设备是 eth0？”时，这样的全路径就变得很冗长。这时，aliases 节点就可以用于指定一个设备全路径的别名。例如：";}i:2;i:22887;}i:445;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23168;}i:446;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:67:"  aliases {
      ethernet0 = &eth0;
      serial0 = &serial0;
  };";}i:2;i:23168;}i:447;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23168;}i:448;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"当给一个设备分配一个识别符是操作系统将非常乐意使用别名。";}i:2;i:23245;}i:449;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23329;}i:450;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23329;}i:451;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:244:"在这里你会发现一个新语法。property = &label;，将作为字符串属性并通过引用标签来指定一个节点的全路径。这与之前的 phandle = < &label >; 形式不同，这是把一个 phandle 值插入进一个 cell。";}i:2;i:23331;}i:452;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23575;}i:453;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23575;}i:454;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:23578;}i:455;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:23580;}i:456;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:1;i:1;a:2:{i:0;s:3:"red";i:1;s:0:"";}}i:2;i:1;i:3;s:11:"<color red>";}i:2;i:23581;}i:457;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:3;i:1;s:15:" chosen 节点 ";}i:2;i:3;i:3;s:15:" chosen 节点 ";}i:2;i:23592;}i:458;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:4;i:1;s:0:"";}i:2;i:4;i:3;s:8:"</color>";}i:2;i:23607;}i:459;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:23615;}i:460;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:23616;}i:461;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23618;}i:462;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23618;}i:463;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:345:"chosen 节点并不代表一个真正的设备，只是作为一个为固件和操作系统之间传递数据的地方，比如引导参数。chosen 节点里的数据也不代表硬件。通常，chosen 节点在 .dts 源文件中为空，并在启动时填充。
在我们的示例系统中，固件可以往 chosen 节点添加以下信息：";}i:2;i:23620;}i:464;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23965;}i:465;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:93:"  chosen {
      bootargs = "root=/dev/nfs rw nfsroot=192.168.1.1 console=ttyS0,115200";
  };";}i:2;i:23965;}i:466;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24068;}i:467;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"高级主题";i:1;i:2;i:2;i:24068;}i:2;i:24068;}i:468;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:24068;}i:469;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24094;}i:470;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"高级模型机";i:1;i:3;i:2;i:24094;}i:2;i:24094;}i:471;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24094;}i:472;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24124;}i:473;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"PCI  主桥";i:1;i:3;i:2;i:24124;}i:2;i:24124;}i:474;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24124;}i:475;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24147;}i:476;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"PCI 总线编号";i:1;i:3;i:2;i:24147;}i:2;i:24147;}i:477;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24147;}i:478;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24175;}i:479;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"PCI 地址转换";i:1;i:3;i:2;i:24175;}i:2;i:24175;}i:480;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24175;}i:481;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24203;}i:482;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"高级中断映射";i:1;i:3;i:2;i:24203;}i:2;i:24203;}i:483;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24203;}i:484;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24233;}i:485;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"参考文档";i:1;i:2;i:2;i:24233;}i:2;i:24233;}i:486;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:24233;}i:487;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24233;}i:488;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"ARM Linux Device Tree - 宋宝华 ";}i:2;i:24259;}i:489;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:33:":linux:kernel:arm_device_tree.pdf";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:24293;}i:490;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24331;}i:491;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24331;}i:492;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"设备树使用手册 - 官网wiki翻译，本wiki ";}i:2;i:24333;}i:493;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:39:":linux:kernel:设备树使用手册.pdf";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:24384;}i:494;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24428;}i:495;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24431;}i:496;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"小技巧";i:1;i:2;i:2;i:24431;}i:2;i:24431;}i:497;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:24431;}i:498;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24453;}i:499;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"反编译dtb文件";i:1;i:3;i:2;i:24453;}i:2;i:24453;}i:500;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24453;}i:501;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24453;}i:502;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"在out/target/product/pbs01/obj/KERNEL_OBJ目录下执行";}i:2;i:24483;}i:503;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24546;}i:504;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
./scripts/dtc/dtc -I dtb -O dts -o ABC.dts arch/arm/boot/ABC.dtb
";i:1;s:4:"bash";i:2;N;}i:2;i:24546;}i:505;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24628;}i:506;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"取消前面定义过的一个属性";i:1;i:3;i:2;i:24628;}i:2;i:24628;}i:507;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24628;}i:508;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24628;}i:509;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:"可以通过 /delete-property/ 来取消一个定义过属性。
/delete-property/ rohm,just-test;";}i:2;i:24675;}i:510;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24773;}i:511;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24773;}i:512;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"s55.dtsi:";}i:2;i:24775;}i:513;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24790;}i:514;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:185:"
&soc {
. . .
        hall-switch {
                compatible = "rohm,bu52031";
                rohm,irq-gpio = <&msmgpio 62 0>; 
                rohm,just-test = <1>;
        };  
};
";i:1;s:1:"c";i:2;N;}i:2;i:24790;}i:515;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24790;}i:516;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"s55.dts:";}i:2;i:24987;}i:517;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:25001;}i:518;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:91:"
&soc {
        hall-switch {
            /delete-property/ rohm,just-test; 
        };
};
";i:1;s:1:"c";i:2;N;}i:2;i:25001;}i:519;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25104;}i:520;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"取消前面定义过的一个节点";i:1;i:3;i:2;i:25104;}i:2;i:25104;}i:521;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:25104;}i:522;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:25104;}i:523;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"用法同属性，关键词是/delete-node/";}i:2;i:25151;}i:524;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:25194;}i:525;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25197;}i:526;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:25197;}}