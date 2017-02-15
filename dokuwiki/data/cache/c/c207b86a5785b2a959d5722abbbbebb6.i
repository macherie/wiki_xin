a:63:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"Android音频驱动学习步骤";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"本文涉及的文档在服务器上 smb:";}i:2;i:113;}i:5;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:154;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:396:"192.167.100.225/share/个人共享/chendaimiao


===== 1.音频相关架构知识点 =====

 
包括：硬件拓扑图、硬件接口数据流向图、软件接口数据流向图、播放音频（Audio Playback）大致步骤、接听电话（Voice Call RX Path）大致步骤、
音频解码、Audio的hal的调用（即aDSP操作）流程、Modem的mDSP操作流程、耳机检测
wiki地址：";}i:2;i:156;}i:7;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:57:"http://172.21.1.23/dokuwiki/doku.php/android;driver;audio";i:1;N;}i:2;i:552;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:472:"

===== 2.音频调通工作流程： =====

audio_video/8996_8096_audio/多媒体驱动程序开发和调通指南音频.pdf  
===== 3.测试音频通路工具Audio ftm test =====

用于测试音频通路，前期手机屏未点亮或不能打电话时，用来测试Speaker,Receiver,Main Mic,Sub Mic,Headset以及headset mic等器件是否可以正常工作。不同平台 的ftm_test_config有所变化，所以命令里tc number相应灵活变通下。
wiki地址：
";}i:2;i:609;}i:9;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:65:"http://172.21.1.23/dokuwiki/doku.php/platform;892x;audio_ftm_test";i:1;N;}i:2;i:1081;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1948:"
===== 4.调试音频参数 =====

我共享高通文档audio/QACT目录下有以下文档
==== 3.1 高通培训音频调试手册： ====

80-NV213-1EC_Audio Tuning Handbook_note.pdf
这是非常重要的一个文档，包括音频硬件设计指导
、音频结构设计
、音频调试工具使用指导
、音频调试流程和模块介绍
、常见音频问题分析和调试
、附件-音频调试技巧

==== 3.2 视频教程： ====

1_VD80-NJ402-1SC_A_GettingStarted_SC.mp4
2_imp_VD80-NJ402-2SC_A_QACT_TuningHandsetTx_SC.mp4
3_imp_VD80-NJ402-3SC_A_QACTTuningHandsetRx_SC.mp4
9_VD80-NJ402-4SC_A_QACT_Tunning SpeakerPhone_SC.mp4
10_VD80-NJ402-4SC_A_QACT_Tunning SpeakerPhone_SC.mp4
==== 3.3 音频调试工具QACT指南文档： ====

80_VM407_5_R_QACT_User_Guide_v4xx.pdf
80_VM407_1_F_Audio_Calibration_Tool_User_Guide.pdf
8996平台QACT用户指南中文版：audio_video/8996_8096_audio/qualcomm_audio_calibration_tool_user_guide_(simplified_chinese).pdf
==== 3.4回声消除和噪声抑制 ====

CL93-V1638-2_C_EEC_Noice_Suppress_Tuning.pdf
===== 5.预约高通音频实验室注意事项 =====

一般提前1个月发邮件到audiolab.hotline.external@qti.qualcomm.com预约音频实验室，地址：金科路地铁3号出口，亮秀路72号x座7楼
去之前先在sim实验室，请硬件工作人员用白卡测能call上，并且参考audio_video/Audio_Lab_check_list.xlsx检查机器。
去时带笔记本，2到3台音频功能完好整机（确认是工厂组装，没有被拆过），标配耳机，U盘，usb匹配线，usb驱动，acdb文件，螺丝刀，镊子。
高通那边会帮忙调试基本效果，请高通重点解决响度（83db以上，或者各项指标良好基础上音量尽量大），噪声，泄漏，耳机等问题。
如果调试遇到问题，需要硬件或结构改版，等以后可以再请他们帮忙final tuning一下。
===== 6.如何把音频参数文件push到手机 =====

wiki地址：
";}i:2;i:1146;}i:11;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:66:"http://172.21.1.23/dokuwiki/doku.php/platform;892x;audio_acdb_file";i:1;N;}i:2;i:3094;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"
===== 7.通过mixer_paths.xml和tinymix command控制音量 =====

";}i:2;i:3160;}i:13;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:105:"http://172.21.1.23/dokuwiki/doku.php/platform;892x;wcd9306_codec_volume_register_control_kitkat?s[]=audio";i:1;N;}i:2;i:3228;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"
===== 8.配置外部PA =====

";}i:2;i:3333;}i:15;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:83:"http://172.21.1.23/dokuwiki/doku.php/platform;892x;how_to_add_external_pa?s[]=audio";i:1;N;}i:2;i:3364;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:186:"
===== 9.如果手机有双mic，需要打开副mic（降噪） =====


代码在device/qcom/q39/system.prop

（对应adb shell进去后/system/build.prop文件）
##fluencetype can be ";}i:2;i:3447;}i:17;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3633;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"fluence";}i:2;i:3634;}i:19;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3641;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" or ";}i:2;i:3642;}i:21;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3646;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"fluencepro";}i:2;i:3647;}i:23;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3657;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:" or ";}i:2;i:3658;}i:25;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3662;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"none";}i:2;i:3663;}i:27;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3667;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"

ro.qc.sdk.audio.fluencetype=fluence  ";}i:2;i:3668;}i:29;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:3707;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"此处改动";}i:2;i:3709;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3721;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3721;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"persist.audio.fluence.voicecall=true";}i:2;i:3723;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3759;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3759;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"persist.audio.fluence.voicerec=false";}i:2;i:3761;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3797;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3797;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"persist.audio.fluence.speaker=true";}i:2;i:3799;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3834;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3834;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"10.音频相关总结文档";i:1;i:2;i:2;i:3834;}i:2;i:3834;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3834;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3834;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:623:"音频通路 -》 audio_video/ALSA框架介绍——音频通路.doc
audio架构 -》audio_video/android audio架构梳理.doc
一些常见问题及解决方法  -》audio_video/高通多媒体技术期刊 - Audio合辑  - 20150826.pdf 
杂音噪音问题调试 -》audio_video/调试音频技巧.doc
17ohm耳机检测不到问题 -》 audio_video/MBHC耳机检测_q39_17ohm_headset_detection.doc
如何打开audio kernel部分log -》audio_video/debug_catch_log 
调试音频参数时QACT里常见各个项的含义及作用 -》audio_video/QACT_知识点.doc
TDD noise判断方法及解决方法 -》判断是否TDD Noise";}i:2;i:3875;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4499;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4499;}i:48;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:49:"9.How to enable Dolby DS1 on 8926 Bagheera family";i:1;i:2;i:2;i:4499;}i:2;i:4499;}i:49;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:4499;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4499;}i:51;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:93:"http://172.21.1.23/dokuwiki/doku.php/platform;892x;s55;how_to_enable_dolby_function?s[]=audio";i:1;N;}i:2;i:4562;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:4655;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4656;}i:54;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4656;}i:55;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"10.Recorder源码浅析";i:1;i:2;i:2;i:4656;}i:2;i:4656;}i:56;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:4656;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4656;}i:58;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:116:"http://172.21.1.23/dokuwiki/doku.php/android;application;soundrecorder%E6%BA%90%E7%A0%81%E6%B5%85%E6%9E%90?s[]=audio";i:1;N;}i:2;i:4693;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:4809;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4809;}i:61;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4809;}i:62;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4809;}}