a:74:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"S300P和S200的耗流调试总结";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"首先使机器进入飞行模式，排除待机时modem的干扰。";}i:2;i:82;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:150;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:150;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"1.测量底板电流。";}i:2;i:152;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:175;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:175;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:107:"2.测量整机电流。经过整机和底板的测量，挑选具有代表性的板子作为调试使用。";}i:2;i:177;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:284;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:284;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"3.软件方面: ";}i:2;i:286;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:302;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:302;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"3.1查看是否进入休眠状态，如果无法休眠，看是否由于wake lock引起，判断是哪个设备引起的";}i:2;i:304;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:430;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"cat /proc/wakelocks
cat wakelocks.cap | awk '{print $1 " " $5}' | grep -v " 0" | grep -v active ";i:1;N;i:2;N;}i:2;i:430;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:430;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:"3.2查看各设备相关的GPIO口的配置，如使能引脚、reset引脚等的状态";}i:2;i:536;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:623;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:623;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"3.3更详细的各模块的配置，通过检查spec的要求调试。";}i:2;i:625;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:695;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:695;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"4.硬件方面：";}i:2;i:697;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:714;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:714;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"4.1用排除法，检测拿掉外围器件的电流，如LCD、TP、camera等；";}i:2;i:716;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:796;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:796;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"4.2拿掉或者断开板子上的器件检测电流，如FPGA、BT、USB、OVP等；";}i:2;i:798;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:882;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:882;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:"4.3测量GPIO和LDO的状态，可配合软件修改GPIO或者LDO的状态来检测电流；";}i:2;i:884;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:976;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:976;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:105:"4.4检测线路上所有使用外接电阻的设备的耗流，如UART、USB、I2C、level shift等等。";}i:2;i:978;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1083;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1083;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:282:"5.在现象难以分析时，最好求助高通或者相关厂商，因为有些可能是厂商在对模块本身的设计时就存在BUG。
如s200屏幕耗流的问题，就是厂商屏幕的硬件BUG导致的，在休眠时reset引脚必须保持低电平，否则影响功耗。";}i:2;i:1085;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1367;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1367;}i:44;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1370;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"S300P调试更详细的经历";}i:2;i:1372;}i:46;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1401;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1403;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1403;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:187:"调试过程中，有时候有些问题不一定像我们想象的那样容易找到，所以把经历写下来，作为一定的启示。
总结下来，最主要的还是认真仔细。";}i:2;i:1405;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1592;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1592;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:267:"S300P的调试较S200更为困难，原因是S200在去掉屏幕后电流直接就从3mA下降到1.6mA，问题定位很快，
而S300P原因在底板上面产生，并且还是在较为肯定不容易有问题的部件上，这就没那么容易发现问题所在。";}i:2;i:1594;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1861;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1861;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:260:"1，首先我们测量了板子和整机的电流，并尽快的测量了去掉外围设备的底板的电流，发现电流没有明显下降，
问题可以定位到底板上面。再分析具体是哪个模块造成，从软件和硬件两个方面进行。";}i:2;i:1863;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2123;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2123;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:246:"2，由于S200和S300P硬件结构和软件相似度较高，可以直接从有区别的地方入手，软件上首先确定S300P与S200的差异，
在对照S200进行修改后，重新编译将代码烧到板子里，发现没有明显下降；";}i:2;i:2125;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2371;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2371;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:243:"在最初没有定位到软件问题之后，就从硬件入手，测量去掉不同模块后的电流（断掉了蓝牙、wifi、FPGA、USB、I2C等器件），
同时软件上把代码回退到与高通QRD最接近的时候，测量耗流。";}i:2;i:2373;}i:62;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2616;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2616;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:677:"3，暂时硬件仍然无法将问题定位，软件上继续排查各设备的suspend的状态，GPIO、LDO在kernel,modem,lK中的配置；
把可以配置的GPIO几乎都重新配置了一遍（由于只是想定位问题，所以只是在suspend状态时配成input和pull down模式(高通的一个文档中提到过此方法)，当然这个方法
不一定准确，可能引起GPIO漏电，但也许这个方法速度较快，建议还是参考各模块的spec来配置）。软件同时也回述了相关的QRD、
S100D、S200等的版本。
硬件把几乎全部的GPIO和LDO也进行了测量并记录下来，分别确定各模块对GPIO和LDO的操作是否正确。";}i:2;i:2618;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3295;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3295;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:424:"4，整个过程较为艰辛，在经过反复的软件调试和硬件调试后，最终终于确定问题点发生在UART的level shift漏电上，在对比S200差异化
分析的时候，如果更仔细和大胆的怀疑这个貌似不会出问题的地方的话，这个问题在上面第2步时就可以排查出来。在CB04项目，也遇到插入串口线，底电流降到2.2ma，
拔掉串口线底电流升到3.5ma";}i:2;i:3297;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3721;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3721;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:145:"5，不过仔细想想，这些调试过程也是必要的，只有对一个产品作出全面体检后，才能保证后续更稳定的开发。";}i:2;i:3723;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3868;}i:72;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3868;}i:73;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3868;}}