a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"添加GPS模块SKG10D";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"一、添加kernel代码";}i:2;i:24;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:48;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:163:"  加宏定义CONFIG_GPS_MODULE_SKG10D
  添加文件：kernel/driver/misc/gps_skg10d.c中，主要是控制GPIO，给模块上电，上电后就可以工作。
  ";}i:2;i:48;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:48;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"二、添加HAL层代码";}i:2;i:219;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:243;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:732:" 1) 在hardware/qcom/gps/loc_api/libloc_api_50001/gps.c中
 添加GPS接口，并兼容高通内置的GPS。
 用属性：hw.gps.type来判断是是内置GPS还是外置GPS。0是内置，1是外置，属性值的设置见下面三。
 2）hardware/qcom/gps/loc_api/libloc_api_50001/hitown_beidou.c
 是GPS接口函数的实现。若打开GPS，就会启动一个线程，监听串口，串口每隔1秒会发一次数据，数据格式遵循NMEA协议。
 修改代码使其支持三种模式切换，分别是：0代表gps跟beidou模式；1代表beidou模式； 2代表gps模式。
 这个模式在设置菜单里控制，模式设置后会写属性值persist.sys.gps.mode,HAL层在每次开GPS之前会去读这个属性值。
 ";}i:2;i:243;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:243;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"三、外置GPS自动识别";}i:2;i:993;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1020;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:419:" 通过开机自启动一个服务来实现，GpsDetector
 代码在packages/simcom/里。
 原理是给GPS模块上电后，3秒内如果从串口读到“$PMTK”这5个字符，就判断是外置GPS，并设置属性hw.gps.type = 1，否则是内置GPS，属性设置为0。
 应用根据这个值来判断要不要加前面二说的模式控制菜单。因为高通内置GPS目前没做模式切换这个功能。
 ";}i:2;i:1020;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1020;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"四、GPIO105控制";}i:2;i:1451;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1470;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:340:" GPIO105是天线的放大使能脚，高通内置GPS也是用这个pin作为天线LNA控制，因此在modem被RF占有，在AP侧用gpio_set_value()这种方式不行。
 目前的解决方案是打开外置GPS，同时也打开内置GPS，但这样耗电会比较大，在问高通，看AP侧有没有接口直接可以控制GPIO105.
 
 ";}i:2;i:1470;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1470;}}