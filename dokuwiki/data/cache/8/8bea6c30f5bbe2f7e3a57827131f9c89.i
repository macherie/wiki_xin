a:90:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"基于adsp sensor架构";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:"linux:892x:sensor1.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:39;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:66;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:66;}i:7;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:23:"linux:892x:sns_arch.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:68;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:96;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:98;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"代码路径";i:1;i:2;i:2;i:98;}i:2;i:98;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:98;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:98;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"1.kernel/arch/arm/mach-msm/sensors_adsp.c";}i:2;i:123;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:164;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:79:" 主要是通过PIL load adsp的image,以及为sensor framework提供一些API.";}i:2;i:164;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:164;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"2.vendor/qcom/proprietary/sensors/dsps/*";}i:2;i:247;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:287;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:400:"  dsps目录下主要包含了HAL, sensordaemon, libsensor1, 以及test相关的代码.
  HAL自然是为framework那边对接, 提供相关接口.
  sensordaemon主要负责与ADSP侧交互,是通过QMI的接口.
  libsensor1主要是提供接口为sensor client  sensd/receive sensor message from/to sensordaemon.
  test相关代码包括了功能测试,sensor校准等相关,关注QSensorTest.apk.";}i:2;i:287;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:287;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"3.Non-HLOS/adsp_proc/*";}i:2;i:699;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:721;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:245:" 整个adsp侧代码都在此,adsp架构包括SMGR, SAM, SCM, DD等模块.调试过程中主要在SMGR和DD. 
 SMGR管理所有sensor的电源管理,sensor配置,sensor采样频率,数据上报等, DD则就是所有支持的sensors的 driver层.";}i:2;i:721;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:973;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"S55/G55 Sensors 相关bug";i:1;i:2;i:2;i:973;}i:2;i:973;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:973;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:973;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"1.问题描述:
工厂那边报告装机前测试过正常的板子装上整机或者放一段时间后所有的sensors都不工作了.";}i:2;i:1010;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1145;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1145;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:337:"刚开始从产线带过来一台整机分析,整机确认所有sensors都不工作,通过sns_cm_test来测试也读取不到数据,这样就确认了与软件HAL层以上没有关系.确认/data/misc/sensors/sns.reg这个文件存在并且读写权限正常,并且运行sns_regedit_ssi -r来看当前sensors的配置情况,一切正常.";}i:2;i:1147;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1484;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1484;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:318:"然后准备打开adsp侧log来看是否有有用的debug信息,至于adsp侧如何打开debug,请见文末debug方法.
在qxdm的log中果然看到有错误的log, 是sensors driver中写寄存器时i2c错误. 一般遇到i2c错误无非就是电没上或者i2c被拉死了,所以准备找硬件量电和抓i2c波形.";}i:2;i:1486;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1804;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1804;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"然后就悲剧了,拆机后所有sensors正常工作了";}i:2;i:1806;}i:38;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:1862;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:".好吧,初步怀疑哪里短路了";}i:2;i:1865;}i:40;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:1900;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"然后就再也复现不出来了,装上整机也复现不出来";}i:2;i:1903;}i:42;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:1967;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1970;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1970;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:317:"好吧,接下来和硬件一起去了工厂分析这个问题, 到工厂后果然一批板子sensors都不工作,好吧,开量, 电都有, i2c波形悲剧了, clk线和data线同高同低,感觉被哪里短了,到这里基本可以确定是硬件问题了,但是不清楚哪个sensor或者器件把i2c搞成了这样.";}i:2;i:1972;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2289;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2289;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:258:"然后我们罪恶的拆挂在i2c上的东西,拆拆拆,到对吼发现是几个TVS管的问题,原来是他们在DVT时换了TVS的替换料,而原先用的TVS和现在用的TVS封装上不兼容,焊盘尺寸都不一样,结果很有可能造成短路问题";}i:2;i:2291;}i:49;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:2549;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2552;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2552;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:194:"2.问题描述:
 客户报告概率性出现所有的sensors都不工作的情况,一旦不工作了,必须重新烧录代码才能正常, 关机休眠唤醒恢复出厂设置等都没有作用.";}i:2;i:2554;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2748;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2748;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:300:" 刚开始一直担心是上面TVS短路那个问题,如果这样就没办法解决了,但是客户很肯定的说重新烧录代码就会好,如果真这样的话那应该是可以解决的,但是我们这边死活复现不出来,客户那边复现出来抓取的log又没有有价值含量的信息";}i:2;i:2752;}i:56;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:3052;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:615:" 低概率性的问题很难熬，终于在一块板子上发现了个很奇怪的问题，现象也是所有sensors都不工作，但是用sns_cm_test测试下来发现只有g-sensor拿不到数据，别的sensors都可以拿到数据，而高通的设计是当g-sensor不工作的时候所有的sensors hal以上都没办法拿到数据了，造成的假象就是所有的sensors不工作！这个问题可以通过注释掉依赖g-sensor的几个API来使得别的sensors能正常工作，具体注释哪几个API见gerrit提交。怀疑客户遇到的问题就是g sensor不工作导致所有sensors不工作。";}i:2;i:3055;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3670;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3670;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:458:"量电正常，i2c clk data都有！很崩溃不知道g sensor哪里出问题了。然后在多次实验后发现个规律，当接着TP时g sensor很大概率不工作，拿掉tp,重启g sensor就工作了。应该是TP哪里影响到了g sensor，而TP和所有的sensors是共用lvs1这路1.8V的电。可是当adsp image被load前这路电量着是有的啊，别的sensors也都能工作，从这点来讲不应该是电有问题啊。。。纠结中。";}i:2;i:3672;}i:61;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4130;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4130;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"看来还是得从log看起，跟踪到底是g sensor死在了哪里。qxdm打出来的log很少，没有有价值的信息，只能从hal侧log看起。";}i:2;i:4132;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4285;}i:65;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4285;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"enable所有hal侧的debug mask，具体方法见文末。";}i:2;i:4287;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4345;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4345;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:180:"因为我们已经知道了只有g sensor不工作，为了避免其他sensors的log干扰，我们在sensor的配置文件中只留了g sensor，其他的sensors全部拿掉了。";}i:2;i:4347;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4527;}i:71;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4527;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:300:"在log里看到get_sensors_list时发现Error: No sensors found。 Number of sensors: 0。具体代码在sensors_qcom_hal.c中的_hal_sensors_get_sensors_list。为什么拿到的sensors_list_len=0呢，如果探测到了gsensor,应该number为1。又是怎么知道系统支持的哪些sensors呢？";}i:2;i:4529;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4829;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4829;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:221:"3.问题描述：
在较新的版本上出现了最初2.5k机器有的出现概率性的开不了机的情况，机器停留在开机logo的界面，如果能开机发现sensor无功能。抓了log分析发现以下log：";}i:2;i:4832;}i:76;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5059;}i:77;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6000:"
01-01 13:20:39.794 E/libsensor1(  226): sensor1_open: Error in connect() errno=2 No such file or directory
01-01 13:20:39.794 E/gsiff_dmn(  226): I/main: Pending Sensor1 connection opening!
01-01 13:20:39.794 E/gpsone_dmn(  226): gpsone_glue_pipeget:46] /data/misc/location/gsiff/gsiff_ctrl_q, mode = 2
01-01 13:20:39.794 W/Resources(  201): Preloaded drawable resource #0x10800fa (android:drawable/btn_check_on_disabled_focused_holo_dark) that varies with configuration!!
01-01 13:20:39.794 E/gpsone_dmn(  226): gpsone_glue_pipeget:65] fd = 11, /data/misc/location/gsiff/gsiff_ctrl_q
01-01 13:20:39.794 E/gsiff_sp_sns1(  226): I/sp_sns1_init: Initializing Sensor1
01-01 13:20:39.794 E/gsiff_sp_sns1(  226): W/sensor process is not up and running yet!
01-01 13:20:39.794 I/QCNEA   (  215): |CAC| [CNE CLIENT STATE MACHINE] transition CONNECTED_PENDING_PERM_RESPONSE -> CONNECTED_ACCESS_ALLOWED
01-01 13:20:39.794 D/QCNEA   (  215): |CAC| readCallback: read len:0, ret:-1, errno:11
01-01 13:20:39.794 I/wcnss_service(  228): wcnss_read_and_store_cal_data trying to read cal
01-01 13:20:39.794 W/Resources(  201): Preloaded drawable resource #0x10800e5 (android:drawable/btn_check_off_disabled_focused_holo_dark) that varies with configuration!!
01-01 13:20:39.794 E/Diag_Lib(  735): [IMS_FATAL]| 2920 | 768 |ims-rtp-daemon ims_rtp_qmi_handler_thread_func waiting on select thread>
01-01 13:20:39.794 W/Resources(  201): Preloaded drawable resource #0x10800e7 (android:drawable/btn_check_off_disabled_holo_dark) that varies with configuration!!
01-01 13:20:39.794 W/Resources(  201): Preloaded drawable resource #0x10800fc (android:drawable/btn_check_on_disabled_holo_dark) that varies with configuration!!
01-01 13:20:39.794 W/Resources(  201): Preloaded drawable resource #0x10800db (android:drawable/btn_check_holo_dark) that varies with configuration!!
01-01 13:20:39.814 D/dalvikvm(  201): GC_EXPLICIT freed 250K, 12% free 2581K/2904K, paused 1ms+2ms, total 15ms

. . . . . .

01-01 13:20:41.503 I/Zygote  (  201): Accepting command socket connections
01-01 13:20:41.563 D/SensorService( 1095): nuSensorService starting...
01-01 13:20:41.563 I/SystemServer( 1095): Entered the Android system server!
01-01 13:20:41.824 E/Sensors (  429): sns_smr_util.c(104):Unable to initialize service 259 with QCCI, timed out (2000 ms)
01-01 13:20:41.834 E/Sensors (  429): sns_acm_mr.c(469):Error getting info for service 3
01-01 13:20:41.834 E/gsiff_dmn(  226): I/gsiff_dmn_init: Sensor Provider initialized on attempt 0!
01-01 13:20:41.834 E/LocSvc_api_v02(  226): I/locClientOpen:2216]: Service instance id is -1
01-01 13:20:41.834 E/LocSvc_api_v02(  226): I/---> locClientOpenInstance line 2100 loc client open
01-01 13:20:41.834 E/Diag_Lib(  226): Setting internal use port to rmnet0
01-01 13:20:41.873 E/libsensor1( 1095): sensor1_open: Error in connect() errno=14 Bad address
01-01 13:20:41.873 E/sensor_reg( 1095): sensor_reg_sensor1_open: sensor1_open returned 5
01-01 13:20:41.873 E/qcom_sensors_hal( 1095): hal_init: Error in sensor_reg_open(): -1
01-01 13:20:41.873 E/Sensors (  429): sns_main.c(298):Error writing to ctl sock fd 66, err 32
01-01 13:20:41.873 E/LocSvc_api_v02(  226): I/---> locClientSendReq line 2360 QMI_LOC_REG_EVENTS_REQ_V02
01-01 13:20:41.873 E/gsiff_dmn(  226): I/gsiff_loc_api_open: locClientOpen 0 3076981776

. . . . . .

01-01 13:20:42.283 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:43.284 W/Atfwd_Sendcmd(  217): AtCmdFwd service not published, waiting... retryCnt : 1
01-01 13:20:44.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWiFi-PE] unknown deliver target [OS-Agent]
01-01 13:20:44.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XT-CS] unknown deliver target [OS-Agent]
01-01 13:20:44.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWWAN-PE] unknown deliver target [OS-Agent]
01-01 13:20:48.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:49.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:49.763 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWiFi-PE] unknown deliver target [OS-Agent]
01-01 13:20:49.763 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XT-CS] unknown deliver target [OS-Agent]
01-01 13:20:49.763 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWWAN-PE] unknown deliver target [OS-Agent]
01-01 13:20:50.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:51.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:52.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:20:53.284 W/Atfwd_Sendcmd(  217): AtCmdFwd service not published, waiting... retryCnt : 2
01-01 13:20:54.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWiFi-PE] unknown deliver target [OS-Agent]
01-01 13:20:54.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XT-CS] unknown deliver target [OS-Agent]
01-01 13:20:54.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWWAN-PE] unknown deliver target [OS-Agent]
01-01 13:20:59.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWiFi-PE] unknown deliver target [OS-Agent]
01-01 13:20:59.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XT-CS] unknown deliver target [OS-Agent]
01-01 13:20:59.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWWAN-PE] unknown deliver target [OS-Agent]
01-01 13:21:03.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:21:04.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:21:04.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWiFi-PE] unknown deliver target [OS-Agent]
01-01 13:21:04.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XT-CS] unknown deliver target [OS-Agent]
01-01 13:21:04.764 E/QCALOG  (  372): [MessageQ] ProcessNewMessage: [XTWWAN-PE] unknown deliver target [OS-Agent]
01-01 13:21:05.283 I/ServiceManager(  217): Waiting for service AtCmdFwd...
01-01 13:21:06.284 I/ServiceManager(  217): Waiting for service AtCmdFwd...

";i:1;N;i:2;N;}i:2;i:5059;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5059;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:226:"从log上看sensor在connect的时候出错了，后面导致了整个QMI等通信有问题，这样导致的结果是有需要和cp通讯的服务就挂掉了，引起死等。
所以就出现了开机开不起来的情况。";}i:2;i:11069;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11295;}i:81;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11295;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:145:"再从硬件上看，这批板子也是用了当初怀疑有问题的TVS管，所以把sensor上3个TVS管去掉。测试后发现机器好了。";}i:2;i:11297;}i:83;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11442;}i:84;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11442;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"最终结论是： TVS管引起了sensor无功能问题，但是前期开机的时候有时会出现QMI消息堵塞导致开机开不起来。";}i:2;i:11444;}i:86;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11587;}i:87;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:144:"     擦除ADSP的方法
     adb root
     adb remount
     adb shell mount -o remount rw /firmware
     adb shell rm -rf /firmware/image/adsp*";}i:2;i:11587;}i:88;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11587;}i:89;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:11587;}}