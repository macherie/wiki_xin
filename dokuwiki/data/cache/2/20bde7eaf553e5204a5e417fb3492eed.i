a:102:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"高通文档: ";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"<<";}i:2;i:15;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"Introduction to Linux Kernel Debug Feature";}i:2;i:17;}i:5;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:">>";}i:2;i:59;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:61;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:61;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"默认debugfs位置
cd /mnt/debugfs";}i:2;i:63;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:98;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:98;}i:11;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:101;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Linux debugfs使用分享";}i:2;i:103;}i:13;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:128;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:130;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:130;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"软件查看gpio状态";}i:2;i:133;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:155;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:155;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"在调试中加入debugfs有时可以起到事半功倍的效果： ";}i:2;i:157;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:231;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
adb shell
 #mkdir /data/debug
 #mount -t debugfs debugfs /data/debug
 #cd /data/debug 
";i:1;N;i:2;N;}i:2;i:231;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:231;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"查看gpio状态";}i:2;i:328;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:344;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:344;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"root@Android:/data/debugfs # cat gpio";}i:2;i:347;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:384;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:384;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"GPIOs 0-15:";}i:2;i:387;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:398;}i:31;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:37:"gpio-0  (front_camera_rst    ) out lo";}i:2;i:398;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:398;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"GPIOs 16-42:";}i:2;i:441;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:453;}i:35;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:344:"gpio-17  (tsl2771_int        ) in  hi
gpio-26  (ctp_reset          ) out hi
gpio-29  (front_camera_pwd    ) out hi
gpio-31  (gpio_kp_out        ) out lo
gpio-32  (gpio_kp_out        ) out lo
gpio-35  (GPIO_E186_POWER    ) in  lo
gpio-36  (gpio_kp_in          ) in  hi
gpio-37  (gpio_kp_in          ) in  hi
gpio-42  (hs_sw              ) in  hi";}i:2;i:453;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:453;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"GPIOs 43-67:";}i:2;i:819;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:831;}i:39;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:113:"gpio-48  (ctp_irq            ) in  hi
gpio-60  (qup_scl            ) in  hi
gpio-61  (qup_sda            ) in  hi";}i:2;i:831;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:831;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"GPIOs 68-94:";}i:2;i:954;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:966;}i:43;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:155:"gpio-76  (lis3dh_acc_int      ) in  lo
gpio-82  ([auto]              ) out hi
gpio-85  (bahama sys_rst_n    ) in  lo
gpio-94  ([auto]              ) out hi";}i:2;i:966;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:966;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"GPIOs 95-106:";}i:2;i:1133;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1146;}i:47;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:37:"gpio-97  (MDP_VSYNC          ) in  lo";}i:2;i:1146;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1146;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"GPIOs 107-132:";}i:2;i:1189;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1203;}i:51;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:152:"gpio-107 (ctp_power          ) in  hi
gpio-115 (GPIO_E186_WAKEUP    ) in  lo
gpio-131 (qup_scl            ) in  hi
gpio-132 (qup_sda            ) in  hi";}i:2;i:1203;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1203;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"查看regulator";}i:2;i:1367;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1382;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1382;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:" root@android:/data/debugfs # cd regulator/  ";}i:2;i:1384;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1435;}i:58;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:176:"
dummy/ ldo03/ ldo06/ ldo09/ ldo12/ ldo15/ ldo18/ smps1/ smps4/
ldo01/ ldo04/ ldo07/ ldo10/ ldo13/ ldo16/ ldo19/ smps2/
ldo02/ ldo05/ ldo08/ ldo11/ ldo14/ ldo17/ ncp/  smps3/
 ";i:1;N;i:2;N;}i:2;i:1435;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1435;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"root@android:/data/debugfs # cat regulator/ldo10/voltage";}i:2;i:1620;}i:61;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1682;}i:62;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:10:"
3000000
 ";i:1;N;i:2;N;}i:2;i:1682;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1682;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"查看clk";}i:2;i:1701;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1710;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1710;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" root@android:/ # cat /data/debugfs/clk/ ";}i:2;i:1712;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1759;}i:69;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1380:"
adm_clk/                  ebi_mddi_clk/
 sdc1_p_clk/         
adsp_clk/                ebi_vfe_clk/
 sdc2_clk/           
ahb_m_clk/                ecodec_clk/
 sdc2_p_clk/         
ahb_s_clk/                gp_clk/
 sdc3_clk/           
cam_m_clk/                grp_3d_clk/
 sdc3_p_clk/         
csi0_clk/                grp_3d_p_clk/
 sdc4_clk/           
csi0_p_clk/              gsbi1_qup_clk/
 sdc4_p_clk/         
csi0_vfe_clk/            gsbi1_qup_p_clk/
 tsif_p_clk/         
csi1_clk/                gsbi2_qup_clk/
 tsif_ref_clk/       
csi1_p_clk/              gsbi2_qup_p_clk/
 uart1_clk/           
csi1_vfe_clk/            icodec_rx_clk/
 uart1dm_clk/         
debug_suspend            icodec_tx_clk/
 uart2_clk/           
dsi_byte_clk/            imem_clk/
 uart2dm_clk/         
dsi_clk/                  mdp_clk/
 usb_hs2_clk/         
dsi_esc_clk/              mdp_dsi_p_clk/
 usb_hs_clk/         
dsi_pixel_clk/            mdp_lcdc_pad_pclk_clk/
 usb_hs_core_clk/     
dsi_ref_clk/              mdp_lcdc_pclk_clk/
 usb_hs_p_clk/       
ebi1_clk/                mdp_vsync_clk/
 usb_phy_clk/         
ebi2_clk/                pbus_clk/
 vdc_clk/             
ebi_acpu_clk/            pcm_clk/
 vfe_clk/             
ebi_adm_clk/              pmdh_clk/
 vfe_mdc_clk/         
ebi_grp_3d_clk/          sdac_clk/               
ebi_lcdc_clk/            sdc1_clk/ 
";i:1;N;i:2;N;}i:2;i:1759;}i:70;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1759;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"查看时钟";}i:2;i:3148;}i:72;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3160;}i:73;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3160;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"root@android:/ # cat /data/debugfs/clk/mdp_clk/rate   ";}i:2;i:3162;}i:75;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3222;}i:76;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
200000000
";i:1;N;i:2;N;}i:2;i:3222;}i:77;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3222;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"使用debugfs调试：";}i:2;i:3243;}i:79;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3271;}i:80;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:883:"
root@android:/ # mkdir /data/debugfs

root@android:/ # mount -t debugfs debugfs /data/debugfs                       

root@android:/ # cd /data/debugfs/                                             

root@android:/data/debugfs # cd pm8921                                         

pm8921-bms/  pm8921-dbg/  pm8921_chg/  

root@android:/data/debugfs # cd pm8921_chg/                                    

root@android:/data/debugfs/pm8921_chg # 

root@android:/data/debugfs/pm8921_chg # 

root@android:/data/debugfs/pm8921_chg # ls -l

  -r--r--r-- root     root            0 2013-04-18 15:25 ATCDONE_IRQ
  -r--r--r-- root     root            0 2013-04-18 15:25 ATCFAIL_IRQ
  -r--r--r-- root     root            0 2013-04-18 15:25 BATFET_IRQ
  -r--r--r-- root     root            0 2013-04-18 15:25 BATTTEMP_COLD_IRQ
 -r--r--r-- root     root            0 2013-04-18 15:25 ATCDONE_IRQ
";i:1;N;i:2;N;}i:2;i:3271;}i:81;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3271;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"查看中断状态：";}i:2;i:4163;}i:83;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4190;}i:84;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:175:"
root@android:/data/debugfs/pm8921_chg # cat FASTCHG_IRQ    //查看是否在快速充电阶段 调用get_reg（）；

1

dmesg:

<4>[   95.057652] get_rt_status i=14 ret=1 
";i:1;N;i:2;N;}i:2;i:4190;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4190;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"查看寄存器的值：";}i:2;i:4374;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4404;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:190:"
root@android:/data/debugfs/pm8921_chg # cat CHG_ITERM       //查看充电截至电流寄存器Value 调用set_reg（）；

0x07

dmesg:

<4>[  275.319975] get_reg data = 0x215, val= 0x07
";i:1;N;i:2;N;}i:2;i:4404;}i:89;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4404;}i:90;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"写入某个寄存器：";}i:2;i:4603;}i:91;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4633;}i:92;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:186:"
root@android:/data/debugfs/pm8921_chg # echo 0x06 > CHG_ITERM   //将0x06写入CHG_ITERM   调用get_rt_status（）；

0x07

dmesg:

<4>[  476.374118] set_reg data = 0x215, val= 0x06
";i:1;N;i:2;N;}i:2;i:4633;}i:93;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4633;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"读写PMIC寄存器，通过高通的spmi通信协议";}i:2;i:4833;}i:95;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4892;}i:96;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:115:"
root@s55:/data/debug/spmi/spmi-0 # echo 0x0001 > address

root@s55:/data/debug/spmi/spmi-0 # cat data
01110 -- 00
";i:1;N;i:2;N;}i:2;i:4892;}i:97;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4892;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"控制gpio状态";}i:2;i:5017;}i:99;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5039;}i:100;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:166:"
root@cb09:/ # cd sys/class/gpio/
root@cb09:/sys/class/gpio # echo 0 > export
root@cb09:/sys/class/gpio # cd gpio0/
root@cb09:/sys/class/gpio/gpio0 # echo 1 > value

";i:1;N;i:2;N;}i:2;i:5039;}i:101;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5039;}}