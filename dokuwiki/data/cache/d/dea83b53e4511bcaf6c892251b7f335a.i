a:64:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:58:"How to configure external PA for Lineout output on 8926 KK";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:75;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"1.For the models use WCD9306,such as: d508";i:1;i:2;i:2;i:75;}i:2;i:75;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:75;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:130;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:63:"1.1 We need to pull up/down gpio to enable/disable external PA.";i:1;i:3;i:2;i:130;}i:2;i:130;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:130;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:130;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"in kernel/arch/arm/boot/dts/d508.dtsi";}i:2;i:206;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:244;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:903:"      sound {
     +        qcom,model = "msm8226-tapan-snd-card";             //configure audio path  
              qcom,audio-routing =
                      "RX_BIAS", "MCLK",
                      "LDO_H", "MCLK",
                      "SPK_OUT", "MCLK",
                      "SPK_OUT", "EXT_VDD_SPKR",
     +                "Lineout_1 amp", "LINEOUT1",               //configure Lineout audio path
     +                "Lineout_2 amp", "LINEOUT2",
                      "AMIC1", "MIC BIAS1 External",
                      "MIC BIAS1 External", "Handset Mic",
                      "AMIC2", "MIC BIAS2 External",
                      "MIC BIAS2 External", "Headset Mic",
                      "AMIC3", "MIC BIAS1 External",
                      "MIC BIAS1 External", "Analog Mic3",
                      "AMIC4", "MIC BIAS3 External",
                      "MIC BIAS3 External", "Analog Mic4";";}i:2;i:244;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:290:"       +      qcom,cdc-lineout-spkr-gpios = <&msmgpio 69 0>;  //configure right gpio number in dts
              qcom,cdc-mclk-gpios = <&pm8226_gpios 1 0>;
              qcom,cdc-vdd-spkr-gpios = <&pm8226_gpios 2 0>;
              //qcom,cdc-us-euro-gpios = <&msmgpio 69 0>;
      };
      ";}i:2;i:1183;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1487;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"1.2 Change UCM file.";i:1;i:3;i:2;i:1487;}i:2;i:1487;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1487;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1487;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"In device/qcom/d508/mixer_paths.xml       ";}i:2;i:1521;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1563;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1563;}i:21;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:20:"linux:892x:508_1.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"direct";}i:2;i:1565;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1597;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1597;}i:24;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:20:"linux:892x:508_2.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"direct";}i:2;i:1599;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1631;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1634;}i:27;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"2.For the models use WCD9302,such as: d801";i:1;i:2;i:2;i:1634;}i:2;i:1634;}i:28;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1634;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1689;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:63:"2.1 We need to pull up/down gpio to enable/disable external PA.";i:1;i:3;i:2;i:1689;}i:2;i:1689;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1689;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1689;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"in kernel/arch/arm/boot/dts/d801.dtsi";}i:2;i:1765;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1803;}i:35;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1251:"      sound-9302 {
     +        qcom,model = "msm8226-tapan9302-snd-card";          //configure audio path
              qcom,audio-routing =
                      "RX_BIAS", "MCLK",
                      "LDO_H", "MCLK",
                      "SPK_OUT", "MCLK",
                      "SPK_OUT", "EXT_VDD_SPKR",
    +                 "Lineout_1 amp", "LINEOUT1",                //configure Lineout audio path
    +                 "Lineout_2 amp", "LINEOUT2",                //configure Lineout audio path
                      "AMIC1", "MIC BIAS1 Internal1",
                      "MIC BIAS1 Internal1", "Handset Mic",
                      "AMIC2", "MIC BIAS2 External",
                      "MIC BIAS2 External", "Headset Mic",
                      "AMIC3", "MIC BIAS1 External",
                      "MIC BIAS1 External", "Analog Mic3",
                      "AMIC4", "MIC BIAS3 External",
                      "MIC BIAS3 External", "Analog Mic4";
   +          qcom,cdc-lineout-spkr-gpios = <&msmgpio 69 0>;    //configure right gpio number in dts
              /delete-property/ qcom,prim-auxpcm-gpio-clk;
              /delete-property/ qcom,prim-auxpcm-gpio-dout;
      /*      /delete-property/ qcom,cdc-vdd-spkr-gpios;*/
      };
      ";}i:2;i:1803;}i:36;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3102;}i:37;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"2.2 Change UCM file.";i:1;i:3;i:2;i:3102;}i:2;i:3102;}i:38;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3102;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3102;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"In device/qcom/d801/mixer_paths.xml        ";}i:2;i:3135;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3178;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3178;}i:43;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:20:"linux:892x:801_1.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"direct";}i:2;i:3180;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3212;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3212;}i:46;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:20:"linux:892x:801_2.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"direct";}i:2;i:3214;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3246;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3247;}i:49;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3247;}i:50;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:84:"3. If it can not work , please catch logcat and kernel log , and check it with qcom.";i:1;i:2;i:2;i:3247;}i:2;i:3247;}i:51;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3247;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3247;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"please enable log mask in audio_hw.c, platform.c";}i:2;i:3345;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3393;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3393;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"#define LOG_NDEBUG 0
#define LOG_NDDEBUG 0";}i:2;i:3395;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3437;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3437;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"kmsg,  catch it after run below commands:";}i:2;i:3439;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3481;}i:61;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:307:" adb root
 adb remount
 adb shell
 #mount -t debugfs debugfs /sys/kernel/debug/
 #echo -n "file soc-dapm.c +p" > /sys/kernel/debug/dynamic_debug/control
 #echo -n "file msm8226.c +p" > /sys/kernel/debug/dynamic_debug/control
 #echo -n "file msm-pcm-routing-v2.c +p" > /sys/kernel/debug/dynamic_debug/control";}i:2;i:3481;}i:62;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3804;}i:63;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3804;}}