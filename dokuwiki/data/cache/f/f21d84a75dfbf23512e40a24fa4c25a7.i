a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:"基于8625q的camera porting：
分为2个部分：Kernel 和 Vendor
Kernel:1";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:78;}i:4;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:81;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:">Linux\android\kernel\drivers\media\video\msm\sensors\OV5640_v4l2.c";}i:2;i:83;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:150;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1482:"           该文件是具体sensor的驱动文件，其中有需要注意的地方：
      { /* For PREVIEW 30fps*/
              .x_output = 0x500,  /*1280*/  /*for 5Mp*/
              .y_output = 0x3C0,  /*960*/
              .line_length_pclk = 0x768,
              .frame_length_lines = 0x3D8,
              .vt_pixel_clk = 56000000,
              .op_pixel_clk = 56000000,
              .binning_factor = 0x0, 
      },
      vt_pixel_clk = line_length_pclk * frame_length_lines * framerate
      尽量保持与op_pixel_clk一样的数值；这个就是去设置VFE的接受速率；
      binning_factor 是指在sensor输出的时候是不是将数据压缩一起输出，这样不会降低sensor的帧率；
      还需要注意secnt的值，这个需要和内存的频率相关，一般是0x06；0x1b；0x0b；0x14；具体可以和高通确认；
      
     2----->Linux\android\kernel\arch\arm\mach-msm\board-msm7627a-camera.c
            这个文件是扳机文件；配置camera的相关gpio和mipi；I2C的配置；通用的配置 
            注意的几个地方是：对闪光灯的配置与AF（对于YUV的sensor对焦，需要自己添加，该处的AF只是对于raw的sensor来说的）的配置；
                static struct i2c_board_info ad5046_actuator_i2c_info = {
                  I2C_BOARD_INFO("ad5046_act", 0x18 >> 1),
                 };
                 这个是sensor中的对焦马达的i2c读写；这个需要和上层去对应的；";}i:2;i:150;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:299:"     3-----> Linux\android\kernel\arch\arm\mach-msm\clock-pcom.c
            这个地方注意去配置camerasensor的Mclk，必须存在。不然无法工作
            
      整个camera驱动的部分，需要注意的地方以上都有提到；
      然后进去Vendor部分；
      
      ";}i:2;i:1678;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1678;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"Vendor：vendor/qcom/proprietary/mm-camera/server/hardware/sensor/ov5640_U.c";}i:2;i:1993;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2069;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:716:"      主要是这个文件，配置了一下基本的输出控制的参数；
      注意这个：
      float ov5647_register_to_real_gain(uint16_t reg_gain)
     {
        float real_gain;
        real_gain = (float)
        ((float)(reg_gain>>4)+(((float)(reg_gain&0x0f))/16.0));
        return real_gain;
      }
      这个地方是去设置AEC曝光的数值，是一个算法，由sensor提供的算法，高通这边生成一个gain的值，通过算法，设置到sensor的寄存器中，得到正确的AEC的值；
      
      LINUX\android\vendor\qcom\proprietary\mm-camera\ server\hardware\sensor\sensor.c
      SENSORS_PROCCESS_START(ov5640)；
      就是去加载ov5640的so库的地方；
      ";}i:2;i:2069;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2069;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"我这边只是提供了一些需要注意的地方，portingcamera步骤差不多也就是这样的";}i:2;i:2817;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2917;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2917;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"camera bayer的闪光灯的效果调试：";}i:2;i:2920;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2962;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:632:"       /* LED Flash Whitebalance - RGB */
       {1.641000f, 1.065000f, 1.819000f},
       这个地方就是在黑暗的地方闪光灯打开，拍照的照片效果，如果偏色，就按照R/G/B三基色来调整比例；
       如果在黑暗的地方拍照，开着闪光灯，但是没有照片是黑色的，就需要去改这个值：
       8.000000f, /* AEC LED Preview Flux */
       加大这个值，就会让拍照得到的照片的亮度增大；
       所有这些数值都是在server/chromatix/0208/libchromatix/chromatix_s5k4e1_mcnex/preview/chromatix_s5k4e1_mcnex_preview.h中；具体的sensor具体去修改";}i:2;i:2962;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2962;}}