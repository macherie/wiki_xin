a:26:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"5M YUV sensor camera 拍照卡死";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"MSM8625Q平台上移植5M的 OV5640 Camera 会出现几个大小卡死。";}i:2;i:49;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:122;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:122;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:124;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"主要原因：";}i:2;i:126;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:141;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:143;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:216:"  VFE 在 设置 pixel crop info 的代码有bug。没有考虑大像素的 YUV sensor。
  计算 delta 值的时候错了，应该是大的减去小的。还有就是 YUV 的时候是2个byte，所以还要乘以2.";}i:2;i:143;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:143;}i:13;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:367;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"修改";}i:2;i:369;}i:15;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:375;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:377;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2321:"
diff --git a/mm-camera/server/hardware/vfe/vfe2x/common/vfe.c b/mm-camera/server/hardware/vfe/vfe2x/common/vfe.c
index 75d93db..59e4537 100755
--- a/mm-camera/server/hardware/vfe/vfe2x/common/vfe.c
+++ b/mm-camera/server/hardware/vfe/vfe2x/common/vfe.c
@@ -1517,6 +1517,7 @@ vfe_status_t vfe_set_pixel_crop_info(vfe_ctrl_info_t *p_obj, void *parm)
   vfe_sensor_params_t *sparams = &(p_obj->vfe_params.sensor_parms);
   vfe_active_region_t *active_params = &(p_obj->vfe_params.active_crop_info);
   uint32_t delta;
+  uint32_t MaxVFEWidth = MAX_VFE_WIDTH; //for yuv sensor
 
   sparams->firstPixel =  info->first_pixel;
   sparams->lastPixel =  info->last_pixel;
@@ -1526,9 +1527,7 @@ vfe_status_t vfe_set_pixel_crop_info(vfe_ctrl_info_t *p_obj, void *parm)
                               &(p_obj->vfe_params));
   if ((active_params->lastLine - active_params->firstLine + 1) >
            MAX_VFE_HEIGHT) {
-                    delta = (MAX_VFE_HEIGHT -
-                                (active_params->lastLine -
-                                      active_params->firstLine + 1)) / 2;
+                   delta = ((active_params->lastLine -active_params->firstLine + 1)-MAX_VFE_HEIGHT) / 2;
                     p_obj->vfe_params.demosaic_op_params.first_line =
                                          active_params->firstLine + delta - 1;
                      p_obj->vfe_params.demosaic_op_params.last_line =
@@ -1541,10 +1540,11 @@ vfe_status_t vfe_set_pixel_crop_info(vfe_ctrl_info_t *p_obj, void *parm)
                                       active_params->lastLine;
   }
 
-  if ((active_params->lastPixel - active_params->firstPixel + 1) >
-             MAX_VFE_WIDTH) {
-                delta = (MAX_VFE_WIDTH -
-                   (active_params->lastPixel - active_params->firstPixel + 1)) / 2;
+  if (p_obj->vfe_params.sensor_parms.vfe_snsr_fmt == SENSOR_YCBCR) // for yuv sensor
+       MaxVFEWidth *=2; // for yuv sensor
+
+  if ((active_params->lastPixel - active_params->firstPixel + 1) > MaxVFEWidth) {
+               delta = ((active_params->lastPixel - active_params->firstPixel + 1)-MaxVFEWidth) / 2;
                 p_obj->vfe_params.demosaic_op_params.first_pixel =
                 active_params->firstPixel + delta - 1;
                 p_obj->vfe_params.demosaic_op_params.last_pixel =

";i:1;s:4:"diff";i:2;N;}i:2;i:384;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:384;}i:19;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2721;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"修改后的 vfe_set_pixel_crop_info：";}i:2;i:2723;}i:21;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2762;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2764;}i:23;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2671:"
vfe_status_t vfe_set_pixel_crop_info(vfe_ctrl_info_t *p_obj, void *parm)
{
  pixel_crop_info_t *info = (pixel_crop_info_t *)parm;
  vfe_sensor_params_t *sparams = &(p_obj->vfe_params.sensor_parms);
  vfe_active_region_t *active_params = &(p_obj->vfe_params.active_crop_info);
  uint32_t delta;
  uint32_t MaxVFEWidth = MAX_VFE_WIDTH; //for yuv sensor
  
  sparams->firstPixel =  info->first_pixel;
  sparams->lastPixel =  info->last_pixel;
  sparams->firstLine =  info->first_line;
  sparams->lastLine =  info->last_line;
  vfe_init_active_crop_info(&(p_obj->vfe_module.active_crop_mod),
                              &(p_obj->vfe_params));
  if ((active_params->lastLine - active_params->firstLine + 1) >
           MAX_VFE_HEIGHT) {
                    delta = ((active_params->lastLine -active_params->firstLine + 1)-MAX_VFE_HEIGHT) / 2;
                    p_obj->vfe_params.demosaic_op_params.first_line =
                                         active_params->firstLine + delta - 1;
                     p_obj->vfe_params.demosaic_op_params.last_line =
                                              active_params->lastLine - delta;
     }              
  else {                                 
    p_obj->vfe_params.demosaic_op_params.first_line =
                                     active_params->firstLine;
    p_obj->vfe_params.demosaic_op_params.last_line =
                                      active_params->lastLine;
  } 
                                     
  if (p_obj->vfe_params.sensor_parms.vfe_snsr_fmt == SENSOR_YCBCR) // for yuv sensor
        MaxVFEWidth *=2; // for yuv sensor
  
  if ((active_params->lastPixel - active_params->firstPixel + 1) > MaxVFEWidth) {
                delta = ((active_params->lastPixel - active_params->firstPixel + 1)-MaxVFEWidth) / 2;
                p_obj->vfe_params.demosaic_op_params.first_pixel =
                active_params->firstPixel + delta - 1;
                p_obj->vfe_params.demosaic_op_params.last_pixel =
                active_params->lastPixel - delta;
  } else {      
     p_obj->vfe_params.demosaic_op_params.first_pixel =
                                      active_params->firstPixel;
    p_obj->vfe_params.demosaic_op_params.last_pixel =
                                       active_params->lastPixel;
  }  
                                      
  p_obj->vfe_params.demosaic_op_params.first_pixel += DEMOSAIC_WIDTH_DELTA/2;
  p_obj->vfe_params.demosaic_op_params.last_pixel -= DEMOSAIC_WIDTH_DELTA/2;
  p_obj->vfe_params.demosaic_op_params.first_line += DEMOSAIC_HEIGHT_DELTA/2;
  p_obj->vfe_params.demosaic_op_params.last_line -= DEMOSAIC_HEIGHT_DELTA/2;
  
  return VFE_SUCCESS;
}
";i:1;s:1:"c";i:2;s:25:"vfe_set_pixel_crop_info.c";}i:2;i:2771;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5483;}i:25;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5483;}}