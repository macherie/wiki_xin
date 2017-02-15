a:36:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"安卓代码按键调试";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:41;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"1.按键驱动原理";i:1;i:3;i:2;i:41;}i:2;i:41;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:41;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:41;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:580:"Linux驱动层中，通常把按键输入驱动设计为输入子系统框架中。输入子系统通常由驱动层、输入子系统核心、事件处理层三部分组成。当实体按键被按下时，Linux驱动层的接收到按键输入中断，进行识别，获取对应的按键扫描码scanKeycode，输入子系统将该扫描码通过事件方式上报至用户空间。在用户空间中，设备驱动都是以文件形式体现出来，即在/dev/input中的具体设备文件，安卓系统中通过线程不断读取该设备文件判断是否有键值上报。";}i:2;i:70;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:650;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:650;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:169:"然后将上报的键值进行处理，将驱动定义的按键扫描码scanKeycode根据按键布局文件Generic.kl 和qwerty.kl映射成按键码标签KeyCodeLabel。";}i:2;i:652;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:821;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:461:"       1. 所有按键的扫描码定义在kernel/include/uapi/linuxinput.h文件中
       2.  这里的Generic.kl 是安卓系统中默认按键布局文件，该文件为linux驱动层及安卓按键定义的连接，将驱动层中的扫描码转换为安卓系统中的按键定义。
            默认优先级没有qwerty.kl高，如果相应键值在qwerty.kl没有找到，会再去Generic.kl里查找，所以Generic.kl不建议修改。
            ";}i:2;i:821;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1292;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"2.按键驱动修改";i:1;i:3;i:2;i:1292;}i:2;i:1292;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1292;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:220:"       按键驱动有两种，一个为矩阵键盘驱动，路径为： kernel\drivers\input\keyboard\matrix_keypad.c
        一个为GPIO接口的键盘驱动，路径为： kernel\drivers\input\keyboard\gpio_keys.c ";}i:2;i:1320;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1320;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:254:"按键驱动一般不需要修改，底层会直接去调用相关驱动，需要将按键相关的物理实体信息添加到设备树上，以方便软件进行匹配调用。
设备树按键相应路径：kernel/arch/arm/boot/dts/qcom/msm8996-cdp.dtsi";}i:2;i:1546;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1806;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1220:"      
        gen-vkeys {                                                                                                                   
                compatible = "qcom,gen-vkeys";
                label = "synaptics_dsx";
                qcom,disp-maxx = <1599>;
                qcom,disp-maxy = <2559>;
                qcom,panel-maxx = <1599>;
                qcom,panel-maxy = <2703>;
                qcom,key-codes = <158 139 102 217>;
        };
        gpio_keys {
                compatible = "gpio-keys";
                input-name = "gpio-keys";
                vol_up {
                        label = "volume_up";
                        gpios = <&pm8994_gpios 2 0x1>;
                        linux,input-type = <1>;
                        linux,code = <115>;
                        gpio-key,wakeup;
                        debounce-interval = <15>;
                };
                camera_on {
                        label = "camera_on";
                        gpios = <&pm8994_gpios 5 0x1>;
                        linux,input-type = <1>;
                        linux,code = <212>;
                        gpio-key,wakeup;
                        debounce-interval = <15>;
                };
";i:1;s:1:"c";i:2;N;}i:2;i:1806;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1806;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:342:"其中gen-vkeys代表虚拟按键，gpio_keys代表实体按键。主要修改项为gpio管脚（gpios）和上报值（linux,code）。
然后将上报键值加到device\qcom\cb09\gpio-keys.kl中增加键盘扫描码对应的键盘码
键盘码是Android系统收到底层驱动提交的扫描码后，向App发送的键盘码，比如本例";}i:2;i:3039;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3387;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:226:"
key 115   VOLUME_UP
key 114   VOLUME_DOWN
key 102   HOME
key 528   FOCUS
key 103   DPAD_UP
key 105   DPAD_LEFT
key 106   DPAD_RIGHT
key 108   DPAD_DOWN
key 136   DPAD_UP
key 158   BACK
key 232   DPAD_CENTER
key 212   CAMERA
 ";i:1;s:1:"c";i:2;N;}i:2;i:3387;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3387;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:223:"扫描码对应给App的键盘码是DPAD_CENTER.
DPAD_CENTER对应的值在framework/base/data/keyboard/Generic.kl里面有相关定义。
同时会在frameworks\base\core\java\android\view\KeyEvent.java有进行上报。
 ";}i:2;i:3626;}i:27;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:3849;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:3852;}i:29;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:3853;}i:30;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:18:"jinxin.liu@sim.com";i:1;s:10:"jinxin.liu";}i:2;i:3855;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" 2016/10/31 11:55";}i:2;i:3888;}i:32;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:3905;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3907;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3908;}i:35;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3908;}}