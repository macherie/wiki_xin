a:12:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:89:"                                                     高通平台如何点亮LCD的方法";}i:2;i:0;}i:2;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:225:"一：简要的介绍：
1.1:本篇文章主要介绍的是在怎样用 Display Serial Interface(DSI)在 Android平台去点亮 display.
1.2:本篇文章适合刚刚做LCD点亮的同事。
1.3:本篇文章的主要介绍有:";}i:2;i:93;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:318;}i:5;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:224:"    (1):kernel panel bingup.
    (2):Header File how to use oem_panel_input_file.xml(不同的供应商名字不同) generates dsi_panel_cmd.dsi and panel_cmd.h file 
    (3):LK bringup.
    (4):Panel Specific Customization.";}i:2;i:318;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:318;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"二：Kernel Panel Bringup";}i:2;i:553;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:579;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:356:" 2.1:点亮 Panel 之前我们要对 Panel 的信息做以下来了解
    (1):Panel 类型，分辨率，bpp,fps 和 porches values,etc.
    (2):Panel power-on 顺序,RESET or IOVDD GPIO 引脚的信号的持续时间。
    (3):Panel DSI 初始化命令的时序和发送命令后的延迟
    (4):GPIO 连接 Host and panel 的irq,reset,power number etc";}i:2;i:579;}i:10;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:4570:"2.2:Panel bringup process
可以参考下面的路径里的流程图，里面有详细的介绍：
smb://192.167.100.225/share/个人共享/gaoyuan/高通培训/day2 中的 80-NU323-31_MSM8996 Display Bringup Guide.pdf文档中的 //P8页
里边有详细的流程说明。

2.2.1:Panel dts file
      以Q39项目为例
      (1):Panel的 dts 配置文件在  /kernel/arch/arm64/boot/dts/qcom/q39.dtsi
      
      &mdss_dsio {
            qcom,dsi-pref-prim-pan = <&dsi_nt35596_1080p_skuk_video>;
            pinctrl-names = "mdss_default","mdss_sleep";
            pinctrl-0 = <&mdss_dsi_active>;
            pinctrl-1 = <&mdss_dsi_suspend>;
            qcom,platform-bklight-en-gpio = <&msm_gpio 25 0>;
            qcom.platform-bklight-en-gpio;
            vsp-supply = <&tps65132_pos>;
            vsn-supply = <&tps65132_neg>; 
            ...
     }
     从中可以看出Q39用的是单屏，并且用的是video模式的panel.
     (2):在 dsi-panel-nt35596-1080p-skuk-video.dtsi 中我们能详细的看到panel的配置(根据具体的项目用料来看)
     (4):在第一次点亮的时候，mdss_dsi0中的内容是由我们自己来配置的，dsi-xxxx-dtsi中的配置是供应商提供给我们的。
     (5):具体的关于引脚的配置如：mdss_dsi_cative 和 mdss_dsi_suspend 在 q39-pinctrl.dtsi 中，根据具体的需要来配置pinctrl引脚
    
2.2.2:当供应商给我们提供 Panel 的xml文件(此文件是 LK 和 Panel 的配置文件),我们应该执行一下的操作
    将文件放到：/device/qcom/common/display/tools/中
   (1): perl parser.pl <"xxxxx".xml> panel/platform //用这个命令运行脚本
   (2): perl parser.pl xxxxx.xml panel //用这个命令产生panel dtsi 和 header files.
   (3): cp ~/device/qcom/common/display/tools/dsi-panel-cmd.dtsi  ~/kernel/arch/arm64/boot/dts/qcom
   (4): cp ~/device/qcom/common/display/tools/panel_cmd.h  ~/bootable/bootloader/lk/dev/gcdb/display/include.
   
2.2.3:Panel kernel
     Panel的驱动文件在/kernel/drivers/video/msm/mdss中。
     (1):mdss_mdp.c //SDE resource (clock/irq/bus-bw/power)
     此驱动文件主要描述了高通的SDE的硬件模块的驱动(在8939和8916上也称为MDP)
     (2):mdss_mdp_ctl
     此驱动文档介绍了硬件抽象曾中的东西(LM + DSPP+ ping-pong + interface)
     (3):mdss_mdp_pipe
     SRC pipe-related hangling
     (4):mdss_mdp_intf
     SDE panel interface-related handling
     (5):mdss_mdp_pp
     Postprocessing-related implementation
     (6):mdss_rorator
     Rotator APIs
     (7):mdss_dsi.c
     一般情况下我会从此文件开始解析。具体的解析的东西，应该看代码！
     
     对于上面描述的SDE的相关东西，大家可以参考路径 
     smb://192.167.100.225/share/个人共享/gaoyuan/高通培训/day2/80-NV396-14_MSM8996 Linux Android Display Overview.pdf //P10
     可以具体的了解一下系统架构，而且此图 //p11页 SDE Overview 全面介绍了display的显示框架。
     图中的VIG支持VIDEO模式和COMMAND 模式，RGB支持COMMAND模式，具体不清楚的也可以给高通提case问问。
     
     关于驱动的软件的架构可以看看
     smb://192.167.100.225/share/个人共享/gaoyuan/高通培训/day2/80-NV396-14_MSM8996 Linux Android Display Overview.pdf
     中的 //P39页，从底层到上层有详细的介绍.但是在我们的8939平台中还没有 //P42页中红色部分标注出来的部分，(只有最新的8994平台才有的)。具体的大家可以看看文档。
     
2.2.4：LK bringup
     (1):当我们接上屏之后我们要看LK传过来的关于 Panel 的一些具体的信息可用命令 cat /proc/cmdline
      如：mdss_mdp.panel=1:dsi:0:qcom,mdss_dsi_otm1287a_720p_video:1:none
      从截下来的内容可以看出解析出的是用的是什么 Panel.
      (2):LK中关于屏的调试可以从 bootable/bootloader/lk/app/aboot/aboot.c
      文件中的 void aboot_init{}函数中的 target_display_init()函数分析.
      (3):把 Panel的配置信息(xxxx.h)复制到 /bootable/bootloader/lk/dev/gcdb/display/include中
      (4):在/bootable/bootloader/lk/target/q39/oem_panel.c文件中做相应的配置。
      (5):在 bootable/bootloader/lk/target/q39/init.c中配置相关的和DTS的关于Panel接口的配置。
      (6):具体的可以打串口的LOG看看。
      
 总结：具体的可以参考：smb://192.167.100.225/share/个人共享/gaoyuan/高通培训/day/Multimedia Driver Development and Bringup Guide - Display.pdf
 文档，里面有详细的介绍    ";}i:2;i:947;}i:11;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:947;}}