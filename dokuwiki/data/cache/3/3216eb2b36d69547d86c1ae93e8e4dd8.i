a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:450:"
kernel/include/uapi/video/msm_hdmi_modes.h里有一些的配置信息
打开调试信息
kernel/include/linux/mdss_io_util.h
#define DEBUG 1

查看当前HDMI支持的分辨率
adb shell cat /sys/class/graphics/fb1/modes

动态更改支持的分辨率, 改后重新插拔
adb shell setprop hw.hdmi.resolution 3


查显示HDMI信息display信息
adb shell dumpsys SurfaceFlinger

HDMI支持的分辨率
adb shell cat /sys/class/graphics/fb1/modes

";i:1;N;i:2;N;}i:2;i:8;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8;}}