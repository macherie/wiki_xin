a:104:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"音频通路";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"xml里的链路到底是什么";i:1;i:3;i:2;i:24;}i:2;i:24;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:24;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:63;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"说明";i:1;i:4;i:2;i:63;}i:2;i:63;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:63;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:63;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:"这个文档基于我在做8953项目的总结。所以所有的代码都以8953的为例。";}i:2;i:76;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:169;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:169;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"基本语法";i:1;i:4;i:2;i:169;}i:2;i:169;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:169;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:169;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:113:"./device/qcom/pbs01/mixer_path_mtp.xml文件中定义了链路和节点的组合关系。其大致语法如下：";}i:2;i:188;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:307;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:507:"
...
126     <ctl name="QUIN_MI2S_RX Audio Mixer MultiMedia11" value="0" />          ctl name=定义的是节点 value则声明了节点的值
...
962     <path name="qchat-call bt-sco-wb">                                      path name 定义的是通路
963         <ctl name="Internal BTSCO SampleRate" value="BTSCO_RATE_16KHZ" />   通路中包含节点
964         <path name="qchat-call bt-sco" />                                   通路中也可以包含其他已定义的通路
965     </path>
...
";i:1;s:3:"xml";i:2;N;}i:2;i:307;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:827;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"文件结构";i:1;i:4;i:2;i:827;}i:2;i:827;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:827;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:827;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:123:"xml文件的结构大体简单，文件的前大段是一些节点的值的初始化。而后则是一些通路的声明。";}i:2;i:846;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:969;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:971;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"**节点**";i:1;i:3;i:2;i:971;}i:2;i:971;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:971;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:971;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:176:"这时候我们提出的第一个问题是：节点是什么？
要解答这个问题需要去看./sound/soc/codec/msm8x16-wcd.c的codec文件
我们能找到如下的语句：";}i:2;i:990;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1172;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:227:"
...
2582 static const struct snd_kcontrol_new msm8x16_wcd_snd_controls[] = {
...
2609         SOC_SINGLE_TLV("ADC3 Volume", MSM8X16_WCD_A_ANALOG_TX_3_EN, 3,
2610                                         8, 0, analog_gain),
...
";i:1;s:1:"c";i:2;N;}i:2;i:1172;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1172;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"恰好契合了xml中的：";}i:2;i:1410;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1443;}i:35;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:54:"
...
 66     <ctl name="ADC3 Volume" value="4" />
...
";i:1;s:3:"xml";i:2;N;}i:2;i:1443;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1443;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:303:"那么我们确认这个应该是ADC3 Volume节点的声明。所以我们来解读一下这个声明：
SOC_SINGLE_TLV显然是一个宏，而MSM8x16_WCD_A_ANALOG_TX_3_EN也是一个宏。analog_gain则应该是某一个数值。
重点是SOC_SINGLE_TLV。他在./kernel/include/sound/soc.h中被定义";}i:2;i:1510;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1819;}i:39;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:650:"
  79 #define SOC_SINGLE_SX_TLV(xname, xreg, xshift, xmin, xmax, tlv_array) 
  80 {       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
  81         .access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
  82         SNDRV_CTL_ELEM_ACCESS_READWRITE, \
  83         .tlv.p  = (tlv_array),\
  84         .info = snd_soc_info_volsw, \
  85         .get = snd_soc_get_volsw_sx,\
  86         .put = snd_soc_put_volsw_sx, \
  87         .private_value = (unsigned long)&(struct soc_mixer_control) \
  88                 {.reg = xreg, .rreg = xreg, \
  89                 .shift = xshift, .rshift = xshift, \
  90                 .max = xmax, .min = xmin} }
";i:1;s:1:"c";i:2;N;}i:2;i:1819;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1819;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:398:"从这个声明上，我们猜测，这个宏定有：名字，芯片寄存器操作的地址，此地址的bit偏移（因为有可能一个8位的寄存器只有三位与控制这个节点有关），
值的最大与最小。最后一位可能是一个指向内存空间的指针。操作的方式类似数组。
最终我在./kernel/Documentation/sound/alsa/soc/codec.txt中找到如下说明：";}i:2;i:2480;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2884;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:474:"
 96 A stereo control spanning 2 registers
 97 
 98     #define SOC_ENUM_SINGLE(xreg, xshift, xmask, xtexts)
 99 
100 Defines an single enumerated control as follows:-
101 
102    xreg = register
103    xshift = control bit(s) offset in register
104    xmask = control bit(s) size
105    xtexts = pointer to array of strings that describe each setting
106 
107    #define SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, xmask, xtexts)
108 
109 Defines a stereo enumerated control
";i:1;s:1:"c";i:2;N;}i:2;i:2884;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2884;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:161:"基本佐证了我们的猜想。在soc.h中还有其他的宏声明以对应不同的节点。但是最重要的信息没有变动：名字和寄存器地址。";}i:2;i:3369;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3530;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3530;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"大家可以在这个文件中看到各种节点对应的不同宏定义";}i:2;i:3532;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3605;}i:50;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3605;}i:51;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"小节";i:1;i:5;i:2;i:3605;}i:2;i:3605;}i:52;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:5;}i:2;i:3605;}i:53;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3605;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:343:"因此抽象意义上的节点，实际上应该就是codec中的某一个寄存器。当我们改变节点时，就是在对codec中的一个寄存器做操作，引起codec的行为变化，因此控制了声音。
（这段讲我挺心虚，因为还是音频新手，因此觉得是不是我说的武断了，如有错误请前辈指点）";}i:2;i:3616;}i:55;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3960;}i:56;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3960;}i:57;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"添加一个通路的步骤";i:1;i:3;i:2;i:3960;}i:2;i:3960;}i:58;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3960;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3960;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"我们以添加副mic为例：
（因为有些原理和原因我暂时还无法表达）";}i:2;i:3996;}i:61;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4085;}i:62;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4085;}i:63;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"添加xml";i:1;i:4;i:2;i:4085;}i:2;i:4085;}i:64;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4085;}i:65;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4085;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:210:"首先我们从xml入手：
我们应该利用已有的节点来组成我们的通路。组成的方式要参考高通文档和已有通路。8953的平台请参考 MSM8953 LINUX ANDROID AUDIO OVERVIEW 的44页";}i:2;i:4101;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4317;}i:68;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:213:"
1066     <!-- pbs01 secondary mic 2016-12-8 daimiao.chen@sim.com -->
1067     <path name="secondary-mic">
1068         <path name="adc3" />
1069         <ctl name="IIR1 INP1 MUX" value="DEC3" />
1070     </path>
";i:1;s:1:"c";i:2;N;}i:2;i:4317;}i:69;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4541;}i:70;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"核对设备树";i:1;i:4;i:2;i:4541;}i:2;i:4541;}i:71;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4541;}i:72;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4541;}i:73;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"作为一个mic，它需要设置偏压。偏压的选择，例如外部或者内部，端口的对应都需要在设备树中添加。";}i:2;i:4563;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4704;}i:75;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:730:"
/kernel/arch/arm/boot/dts/qcom/pbs01-audio.dtsi
317                 qcom,audio-routing =
318                         "RX_BIAS", "MCLK",
319                         "SPK_RX_BIAS", "MCLK",
320                         "INT_LDO_H", "MCLK",
321                         "MIC BIAS External", "Handset Mic",
322                         "MIC BIAS External2", "Headset Mic",
323                         "MIC BIAS External", "Secondary Mic",
324                         "AMIC1", "MIC BIAS External",
325                         "AMIC2", "MIC BIAS External2",
326                         "AMIC3", "MIC BIAS External",
327                         "WSA_SPK OUT", "VDD_WSA_SWITCH",
328                         "SpkrMono WSA_IN", "WSA_SPK OUT";
";i:1;s:1:"c";i:2;N;}i:2;i:4704;}i:76;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5445;}i:77;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"添加电源管理";i:1;i:4;i:2;i:5445;}i:2;i:5445;}i:78;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:5445;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5445;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:239:"在/kernel/sound/soc/msm/目录下，高通代码主要用来针对某一平台做初始化。包括注册声卡。对于msm8953平台，使用的代码是msm8952.c。由于有偏压的存在，我们需要将他添加到电源管理中：";}i:2;i:5470;}i:81;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5715;}i:82;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:645:"
 198 static const struct snd_soc_dapm_widget msm8952_dapm_widgets[] = {
 199 
 200         SND_SOC_DAPM_SUPPLY_S("MCLK", -1, SND_SOC_NOPM, 0, 0,
 201         msm8952_mclk_event, SND_SOC_DAPM_POST_PMD),
 202         SND_SOC_DAPM_MIC("Handset Mic", NULL),
 203         SND_SOC_DAPM_MIC("Headset Mic", NULL),
 204         SND_SOC_DAPM_MIC("Secondary Mic", NULL),
 205         SND_SOC_DAPM_MIC("Digital Mic1", NULL),
 206         SND_SOC_DAPM_MIC("Digital Mic2", NULL),
 207         SND_SOC_DAPM_SUPPLY("VDD_WSA_SWITCH", SND_SOC_NOPM, 0, 0,
 208         msm8952_wsa_switch_event,
 209         SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 210 };
";i:1;s:1:"c";i:2;N;}i:2;i:5715;}i:83;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5715;}i:84;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"并且防止它被suspend";}i:2;i:6371;}i:85;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6402;}i:86;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:145:"
1535 static int msm_audrx_init(struct snd_soc_pcm_runtime *rtd)
1536 {
...
1552         snd_soc_dapm_ignore_suspend(dapm, "Secondary Mic");
...
";i:1;s:1:"c";i:2;N;}i:2;i:6402;}i:87;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6558;}i:88;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"为上层开放借口";i:1;i:4;i:2;i:6558;}i:2;i:6558;}i:89;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:6558;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6558;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:277:"自此，我们的音频通路是已经建立了，但是还没有办法和上层通讯。上层并不知道，也无法调用到这个结构。
添加方法如下：
首先在./hardware/qcom/audio/hal/msm8916/platfrom.h中添加对应的枚举值（这个枚举是匿名的）";}i:2;i:6586;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6869;}i:93;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:170:"
 64 enum {
 65     SND_DEVICE_NONE = 0,
...
181     SND_DEVICE_IN_SECONDARY_MIC,
182     SND_DEVICE_IN_END,
183 
184     SND_DEVICE_MAX = SND_DEVICE_IN_END,
185 
186 };
";i:1;s:1:"c";i:2;N;}i:2;i:6869;}i:94;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6869;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"其次在./hardware/qcom/audio/hal/msm8916/platfrom.c中添加：";}i:2;i:7050;}i:96;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7121;}i:97;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1147:"
#define AUDIO_PARAMETER_KEY_SECONDARY_MIC "secondary_mic" //一个宏

static const char * const device_table[SND_DEVICE_MAX] = {
     [SND_DEVICE_IN_SPEAKER_QMIC_NS] = "quad-mic",
     [SND_DEVICE_IN_SPEAKER_QMIC_AEC_NS] = "quad-mic",
     [SND_DEVICE_IN_THREE_MIC] = "three-mic",
     [SND_DEVICE_IN_SECONDARY_MIC] = "secondary-mic",//这个数组中储存有所有声音设备的名字（此处字符串应该和xml中对应）
 };

static int acdb_device_table[SND_DEVICE_MAX] = {
     [SND_DEVICE_IN_SPEAKER_QMIC_NS] = 127,
     [SND_DEVICE_IN_SPEAKER_QMIC_AEC_NS] = 129,
     [SND_DEVICE_IN_THREE_MIC] = 46,
     [SND_DEVICE_IN_SECONDARY_MIC] = 4, //高通acdb的数组，这个数字应该对应了在qact中的设备号
 };

static struct name_to_index snd_device_name_index[SND_DEVICE_MAX] = {
     {TO_NAME_INDEX(SND_DEVICE_IN_SPEAKER_QMIC_AEC)},
     {TO_NAME_INDEX(SND_DEVICE_IN_SPEAKER_QMIC_NS)},
     {TO_NAME_INDEX(SND_DEVICE_IN_SPEAKER_QMIC_AEC_NS)},
     {TO_NAME_INDEX(SND_DEVICE_IN_SECONDARY_MIC)}, //这个应该是对应给上层的选项（我还不是很确定。我会写个调用的java试试看。之后再更新）
 };
";i:1;s:1:"c";i:2;N;}i:2;i:7121;}i:98;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7121;}i:99;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:222:"由于复mic主要的作用是消声，因此在正常使用中比较难测试它的好坏。（无法通过普通的录音软件直观的感受到）。为了能在cit中测试它的好坏，我们需要做一些接口：";}i:2;i:8280;}i:100;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8508;}i:101;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1334:"
41 bool secondary_mic_state = false;//这个全局变量用来标记是否要测试副mic

2977 snd_device_t platform_get_input_snd_device(void *platform, audio_devices_t out_device)
2978 {
...
2985     audio_devices_t in_device = ((adev->active_input == NULL) ?
2986                                     AUDIO_DEVICE_NONE : adev->active_input->device)
2987                                 & ~AUDIO_DEVICE_BIT_IN;
...
3228     if (in_device != AUDIO_DEVICE_NONE &&
3229             !(in_device & AUDIO_DEVICE_IN_VOICE_CALL) &&
3230             !(in_device & AUDIO_DEVICE_IN_COMMUNICATION)) {
3231         if (in_device & AUDIO_DEVICE_IN_BUILTIN_MIC) {
3232             if (adev->active_input && (audio_extn_ssr_get_stream() == adev->active_input))
3233                 snd_device = SND_DEVICE_IN_QUAD_MIC;
3234             else if (my_data->fluence_type & (FLUENCE_DUAL_MIC | FLUENCE_QUAD_MIC) &&
3235                     channel_count == 2)
3236                 snd_device = SND_DEVICE_IN_HANDSET_STEREO_DMIC;
3237             else if (secondary_mic_state == false)//如果要求的in_device
3238                 snd_device = SND_DEVICE_IN_HANDSET_MIC;
3239             else
3240                 snd_device = SND_DEVICE_IN_SECONDARY_MIC;//如果secondary_mic_state == ture则返回副mic的号
...
3307     return snd_device;
3308 }
";i:1;s:1:"c";i:2;N;}i:2;i:8508;}i:102;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9852;}i:103;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:9852;}}