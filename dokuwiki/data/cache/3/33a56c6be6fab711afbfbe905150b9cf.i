a:29:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"一、使用Drv_Tool配置GPIO相应参数";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:43;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:43;}i:5;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:45;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"1.各列参数说明:";}i:2;i:47;}i:7;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:68;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:70;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:654:" 1.1.Def.Mode: 表示开机后gpio模块初始化后的GPIO的模式，每个GPIO pin最多有7种模式，MODE0总是为GPIO mode.
 1.2.M0--M7:M0-M1-M3-M4-M5-M6-M7各个GPIO的模式分别代表Def.Mode各个模式是enable还是disable的状态
 备注：
 1)GPIO一般有4种模式M0/M1/M2/M3，是指在gpio模块初始化以后，我们需要选用的gpio模式的种类和个数，如GPIO0有如下M0,M1,M2,M3四种工作模式：0：GPIO,1:CMRST,2:CLKM0,3:DSP_GPO0
 2)Def.Mode 和M0--M7 总共9列组合用来设置GPIO的模式
 1.3.InPull En:表示enable Inpull 还是disable Inpull。
 1.4.InPull SelHigh:表示是否需要拉高（上拉）。";}i:2;i:70;}i:10;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:340:" 备注：
 1)是否enable pull 取决于连接到这个GPIO pin脚的外围设备
 2)如果为enable pull ,则可以配置成 pull-up or pull down.
 1.5.R0/R1:
 1.6.Def.Dir:表示开机后gpio模块初始化后的GPIO的输入输出方向配置。
 1.7.In/Out:表示gpio模块初始化以后，我们需要选用的输入或输出方向。";}i:2;i:740;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:913:" 备注：
 1)每个GPIO pin都可以配置成input or output.。
 2)Def.Dir和In/Out:三列组合起来一起用于配置GPIO的输入输出方向。
 3)如果GPIO pin如果是output pin，则output value 可以配置成high(1) or low(0).
 4)如果GPIO pin如果是input pin，则input value 可以配置成high(1) or low(0).
 
 1.8.INV:GPIO 的数值是否可以被改变。(The GPIO data can be inverted or un-inverted)
 备注：此项暂不使用，默认全部不勾选，不处理不考虑。
 1.9.OutHigh:It set the default output value is high(1).(Only valid when GPIO is output mode)
 1.10.VarName1/2/3:给gpio口一个名称，这样你就可以在程序里使用初始化的名字来调用这个gpio口。
 备注：VarName2/3 is for special class when  a GPIO pin is shared  between two applications or modules.
 1.11.Uem GPIO String:作调试用，在工程模式的dev->GPIO里面可以检查到。";}i:2;i:1094;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1094;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2034;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"二、GPIO有关的函数";}i:2;i:2036;}i:15;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2061;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2063;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1106:" 1．void GPIO_ModeSetup(kal_uint16 pin, kal_uint16 conf_dada)
 功能：设置GPIO的工作模式是作为GPIO，还是作为专有功能接口。
 参数：
 pin：GPIO 的pin脚号，对应于原理图上MTK62XX 主CPU芯片的上的GPIO标号
 conf_dada：值有0~7。其中0是表示作为GPIO模式，其他根据专有功能的不同进行设置。
 2．void GPIO_InitIO(char direction, char port)
 功能：初始化GPIO的工作方向是作为输入，还是作为输出
 参数：
 direction：工作方向，0表示输入，1表示输出
 port：GPIO的pin脚
 3．char GPIO_ReadIO(char port)
 功能：从GPIO读取数据
 参数：
 port：GPIO的pin脚 
 4．void GPIO_WriteIO(kal_char data, kal_char port)
 功能：往GPIO写数据
 参数：
 data： 1表示给高电平，0表示给低电平
 port：GPIO的pin脚
 备注：这些函数在Gpio.C中可以找到。 
 eg:具体GPIO操作：
 GPIO_ModeSetup(led_signal_power_en_pin, 0);
 //GPIO pin模式设置成GPIO模式
 GPIO_InitIO(1, led_signal_power_en_pin); //输出方向
 GPIO_WriteIO(1, led_signal_power_en_pin); //写入高电平";}i:2;i:2063;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2063;}i:19;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3221;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"三、GPIO其他事项说明";}i:2;i:3223;}i:21;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3251;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3253;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3254;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:841:"1.GPIO口在系统上电的时候，有的是默认高电平，有的是默认低电平，这是MCU内部决定的，软件无法更改，但是在系统开机过程中，会对GPIO进行初始化，MCU中有几个GPIO模式初始化寄存器，通过这个寄存器给GPIO设置初始模式。
2.这个初始化过程在Gpio_Drv.C中的函数GPIO_init()中，项目开始的时候，先要检查这个部分的模式设置是否正确。
3.GPIO的设置相对来讲比较简单，只要仔细参对原理图，基本上就可以将GPIO配置好。当然有些时候GPIO配置好了也达不到效果，就需要和硬件工程师一起来进行检测分析，测量对应电路的工作电压或电流，来判断工作是否正常。
总之在前期的调试方面，多跟硬件工程师沟通、讨论、分析，会很快解决问题。";}i:2;i:3254;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3254;}i:26;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:54:":platform:6735:screenshot_from_2016-03-14_10_02_08.png";i:1;s:0:"";i:2;s:4:"left";i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:6:"nolink";}i:2;i:4105;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4172;}i:28;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4172;}}