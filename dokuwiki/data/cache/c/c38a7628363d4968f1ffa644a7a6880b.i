a:49:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"关于camera录制视频的分析";i:1;i:3;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:43;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"camera 录像流程";i:1;i:4;i:2;i:43;}i:2;i:43;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:43;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:584:"  1. camera模块将从hal层的预览线程中，获取原始的未压缩的yvu视屏帧，通过回调函数传递到CameraSource模块。
  
  2. OMXCodec模块将从CameraSource模块的read接口获取yuv视频帧拷贝到编码模块提供的输入端口的buffer列表中。
      编码模块从输入端口的buffer列表读取包含yuv的buffer、编码、然后送回到输出端口的buffer列表，供OMXCodec模块取回。
      
  3. 从OMXCodec模块的read接口读取压缩编码后的h264帧，通过TS容器写到输出文件句柄上，得到TS流的文件。
  ";}i:2;i:69;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:669;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"camera 的视频预览流程";i:1;i:4;i:2;i:669;}i:2;i:669;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:669;}i:10;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:288:"  1. mediaserver进程是Camera Service的容器进程，它会动态加载Camera HAL和Gralloc HAL。
      视频数据帧首先必须从Camera驱动程序到达Camera硬件抽象层。
      在Camera硬件抽象层，视频数据帧被从video capture buffer拷贝到gralloc buffer。";}i:2;i:703;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:193:"  2. surfaceflinger进程作为显示服务器会动态加载HWComposer HAL和Gralloc HAL。
      在HWComposer硬件抽象层，会把数据帧从gralloc buffer拷贝到video output buffer。";}i:2;i:999;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:98:"  3. 经过上述过程，Camera Sensor采集的图像最终通过LCDC HEO显示在显示屏上。";}i:2;i:1198;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1301;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"录制视频模糊的分析";i:1;i:3;i:2;i:1301;}i:2;i:1301;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1301;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1301;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:177:"录制视频之后可能出现模糊、花屏等情况，在分析具体问题之前。可以尝试dump input/output相关数据，缩小问题的范围。
具体方法如下：";}i:2;i:1337;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1520;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:262:"
adb root 
adb remount 
adb shell chmod 777 /data/misc/media 
adb shell setprop vidc.enc.log.in 1 
adb shell getprop vidc.enc.log.in //ensure this value is set.
adb shell setprop vidc.enc.log.out 1 
adb shell getprop vidc.enc.log.out //ensure this value is set.
";i:1;s:1:"c";i:2;N;}i:2;i:1520;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1520;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:166:"h264/yuv 数据将会被存储在手机目录 /data/misc/media/下。
利用ffplay去播放原始数据和编码之后的数据，查看是否存在模糊的现象。";}i:2;i:1793;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1959;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:86:"  播放方法：
  ffplay -f rawvideo -video_size 1920x1080 ***.yuv
  ffplay ***.h264";}i:2;i:1959;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1959;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"如果存在“chmod: chmod '/data/misc/media' to 40777: Permission denied”的情况，主要是因为selinux访问控制导致。";}i:2;i:2054;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2186;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2186;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"解决方法：
adb shell setenforce 0即可。";}i:2;i:2188;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2235;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2235;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:113:"ffplay可以在linux环境下安装，也可直接使用可执行文件。可执行文件我放在共享里了。";}i:2;i:2237;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2350;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2350;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"路径smb:";}i:2;i:2352;}i:35;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:2362;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"192.167.100.225/share/Tool/ffplay
";}i:2;i:2364;}i:37;a:3:{i:0;s:6:"smiley";i:1;a:1:{i:0;s:3:":-P";}i:2;i:2398;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"
 ";}i:2;i:2401;}i:39;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2403;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:2406;}i:41;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:2407;}i:42;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:18:"jinxin.liu@sim.com";i:1;s:10:"jinxin.liu";}i:2;i:2409;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" 2017/02/08 09:24";}i:2;i:2442;}i:44;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:2459;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:2461;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2461;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2461;}i:48;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2461;}}