a:72:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"添加PA";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:112:"在modem_proc\rfdevice_pa\src目录下添加<.cpp>和<.h>文件， 可以拷贝其他已有的文件来修改。";}i:2;i:15;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:127;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:127;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"请参考文档80-NG377-1_A_MIPI_Device_Customization.pdf";}i:2;i:129;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:186;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:186;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"注意点：";}i:2;i:188;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:200;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:200;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"1， mfg_id和prd_id在spec中查找， prd_rev默认为0， 如果msg_id和prd_id和已存在的PA相同，则通过修改prd_rev来区分。";}i:2;i:202;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:344;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:70:"pa_info->mfg_id = 0x134;
pa_info->prd_id = 0x30;
pa_info->prd_rev = 1;";}i:2;i:344;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:344;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"2， num ports数字应不小于band数";}i:2;i:423;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:462;}i:22;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:43:"#define RFDEVICE_PA_RFMD_7459A_NUM_PORTS 34";}i:2;i:462;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:462;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:124:"3， bias_data可以不用修改，主要是修改range_data。 range_data根据spec中PA Control Register表计算得出。";}i:2;i:510;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:634;}i:26;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:44:"band slect <6:3>
PA enable <2>
PA mode <1:0>";}i:2;i:634;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:634;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:128:"range_data中每组一般4个值，2G PA mode一般对应HPM,MPM,LPM,ULPM刚好4个值。 3G PA mode则一般对应00,00,HPM,LPM";}i:2;i:686;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:814;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:814;}i:31;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:818;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"添加ASM";}i:2;i:820;}i:33;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:829;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:831;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:831;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:113:"在modem_proc\rfdevice_asm\src目录下添加<.cpp>和<.h>文件， 可以拷贝其他已有的文件来修改。";}i:2;i:833;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:946;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:946;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"请参考文档80-NG377-1_A_MIPI_Device_Customization.pdf";}i:2;i:948;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1005;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1005;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"注意点：";}i:2;i:1007;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1019;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1019;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"1， mfg_id和prd_id在spec中查找， prd_rev默认为0， 如果msg_id和prd_id和已存在的PA相同，则通过修改prd_rev来区分。";}i:2;i:1021;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1163;}i:47;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:73:"asm_info->mfg_id = 0x134;
asm_info->prd_id = 0x20;
asm_info->prd_rev = 0;";}i:2;i:1163;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1163;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"2， num ports数字应不小于RFFE Communications Mode数";}i:2;i:1245;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1304;}i:51;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:48:"#define RFDEVICE_ASM_RFMD1494A_0X20_NUM_PORTS 10";}i:2;i:1304;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1304;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"3， asm_on_data根据spec中RFFE Communications表计算得出。";}i:2;i:1357;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1423;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1423;}i:56;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1426;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"修改添加每个band的PA，ASM";}i:2;i:1428;}i:58;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1461;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1463;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1463;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"首先要明确项目是用的哪一个rfcard，在目录modem_proc\rfc_dime\rf_card下。
如果添加ASM或PA，需要修改NUM_DEVICES_TO_CONFIGURE";}i:2;i:1465;}i:62;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1615;}i:63;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:34:"4,  /* NUM_DEVICES_TO_CONFIGURE */";}i:2;i:1615;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1615;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"然后按照以下格式添加ASM或PA";}i:2;i:1654;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1692;}i:67;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:837:"  {
    RFDEVICE_ASM,
    GEN_ASM /* ASM_14T */,  /* NAME */
    0,  /* DEVICE_TYPE_INSTANCE */
    0 /*Warning: Not specified*/,  /* PHY_PATH_NUM */
    {
      0  /* Orig setting:  */,  /* INTF_REV */
      (0x134 << 22)/*mfg_id*/ | (0x28 << 14)/*prd_id*/ | (7)/*port_num*/,  /* PORT_NUM */
      0,  /* Array Filler */
      0,  /* Array Filler */
      0,  /* Array Filler */
      0,  /* Array Filler */
    },
  },
  {
    RFDEVICE_PA,
    GEN_PA /* HCPA */,  /* NAME */
    0,  /* DEVICE_TYPE_INSTANCE */
    0 /*Warning: Not specified*/,  /* PHY_PATH_NUM */
    {
      0  /* Orig setting:  */,  /* INTF_REV */
      (0x0134 << 22)/*mfg_id*/ | (0x30 << 14)/*prd_id*/ | (0)/*port_num*/,  /* PORT_NUM */
      0,  /* Array Filler */
      0,  /* Array Filler */
      0,  /* Array Filler */
      0,  /* Array Filler */
    },
  },";}i:2;i:1692;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1692;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:206:"如果只是修改ASM或PA，则不需要修改NUM_DEVICES_TO_CONFIGURE，只需要修改mfg_id，prd_id，port_num即可。 port_num即为PA中的range_data，ASM中的asm_on_data所使用的port num号。";}i:2;i:2587;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2587;}i:71;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2587;}}