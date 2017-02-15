a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:"操作步骤：
1，设置camera Picture size为13M，
2，预览比如一个物体，
3，点击拍照，照片会多出一些尺寸，该物体周围的图像也被照进来。";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:179;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:179;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:306:"问题在于：预览是全屏显示， 需要保证Sensor的输出于是16：9， 这样sensor 的输出只需要down scale就可以得到正常图像。 如果sensor输出不是16：9 ， 则VFE还需要裁剪（crop） 才能满足preview的显示， 就会导致拍照画面与全屏preview不一致。";}i:2;i:181;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:487;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:487;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"解决方法：更改应用，用google一款camera软件能很好地解决这个问题，不使用全屏预览。";}i:2;i:489;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:603;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:603;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:187:"表示输出比例的代码位置：以imx135为例，  lib文件 vendor/qcom/proprietary/mm-camera/mm-camera2/media-controller/modules/sensors/sensor_libs/imx135_mcnex/imx135_mcnex_lib.c";}i:2;i:605;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:793;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:284:"static struct sensor_lib_out_info_t sensor_out_info[] = {
{
  /* full size @ 22.27 fps*/
  .x_output = 4208,
  .y_output = 3120,
}，
{
  /* full size 16:9 @ 30 fps */
  .x_output = 4208,
  .y_output = 2368,
},
{
  /* 1/2 HV @ 50 fps */
  .x_output = 2104,
  .y_output = 1560,
},
....";}i:2;i:793;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:793;}}