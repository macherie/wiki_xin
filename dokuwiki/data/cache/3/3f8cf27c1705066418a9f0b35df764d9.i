a:23:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"如何开关硬件编解码";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:156:"高通默认为使用硬件编解码。而且不能动态切换，也就是一个镜像对应某一种编码要么使用硬件要么使用软件编解码。";}i:2;i:44;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:200;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:202;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"1：硬件编解码配置文件";i:1;i:2;i:2;i:202;}i:2;i:202;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:202;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:101:"  device/qcom/msm8226/media/media_codecs_8226.xml
  device/qcom/msm8226/media/media_profiles_8226.xml";}i:2;i:247;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:247;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:85:"如过要禁用某个profile的硬件编码可以这这个文件里把他注释掉。";}i:2;i:354;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:439;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:442;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"2：通过frameworks中的flag配置";i:1;i:2;i:2;i:442;}i:2;i:442;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:442;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:105:"  frameworks/av/include/media/stagefright/OMXCodec.h
  frameworks/av/media/libstagefright/OMXCodec.cpp
  ";}i:2;i:491;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:823:"
enum CreationFlags
{
    kPreferSoftwareCodecs    = 1,
    kIgnoreCodecSpecificData = 2,
        
    // The client wants to access the output buffer's video
    // data for example for thumbnail extraction.
    kClientNeedsFramebuffer  = 4,
        
    // Request for software or hardware codecs. If request
    // can not be fullfilled, Create() returns NULL.
    kSoftwareCodecsOnly      = 8,
    kHardwareCodecsOnly      = 16, 
        
    // Store meta data in video buffers
    kStoreMetaDataInVideoBuffers = 32, 
        
    // Only submit one input buffer at one time.
    kOnlySubmitOneInputBufferAtOneTime = 64, 
        
    // Enable GRALLOC_USAGE_PROTECTED for output buffers from native window
    kEnableGrallocUsageProtected = 128,
    
    // Secure decoding mode
    kUseSecureInputBuffers = 256,
};

";i:1;s:1:"c";i:2;N;}i:2;i:609;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:609;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"使用上面的 flag 在 OMXCodec Create 中指定就可以";}i:2;i:1444;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1503;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1507;}i:22;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1507;}}