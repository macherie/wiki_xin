a:15:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:138:"                                                                                                                     席芳清  2014-03-21";}i:2;i:0;}i:2;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"此处简单地描述一下Camera CCI I2C的注册和调用。";}i:2;i:143;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:206;}i:5;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:59:"主要的驱动文件： msm_cci.c ， msm_camera_cci_i2c.c";}i:2;i:206;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:703:"用source insight搜索：
---- msm_sensor_cci_i2c_util Matches (5 in 5 files) ----
Msm_actuator.c (kernel\drivers\media\platform\msm\camera_v2\sensor\actuator):	.i2c_util = msm_sensor_cci_i2c_util,
Msm_camera_cci_i2c.c (kernel\drivers\media\platform\msm\camera_v2\sensor\io):int32_t msm_sensor_cci_i2c_util(struct msm_camera_i2c_client *client,
Msm_camera_i2c.h (kernel\drivers\media\platform\msm\camera_v2\sensor\io):int32_t msm_sensor_cci_i2c_util(struct msm_camera_i2c_client *client,
Msm_eeprom.c (kernel\drivers\media\platform\msm\camera_v2\sensor\eeprom):	.i2c_util = msm_sensor_cci_i2c_util,
Msm_sensor.c (kernel\drivers\media\platform\msm\camera_v2\sensor):	.i2c_util = msm_sensor_cci_i2c_util,";}i:2;i:270;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:595:"msm_camera_cci_i2c.c中CCI I2C  接口：
int32_t msm_sensor_cci_i2c_util(struct msm_camera_i2c_client *client, uint16_t cci_cmd)
{
      int32_t rc = 0;
      struct msm_camera_cci_ctrl cci_ctrl;
      CDBG("%s line %d\n", __func__, __LINE__);
      cci_ctrl.cmd = cci_cmd;
      cci_ctrl.cci_info = client->cci_client;
      rc = v4l2_subdev_call(client->cci_client->cci_subdev,
              core, ioctl, VIDIOC_MSM_CCI_CFG, &cci_ctrl);
      if (rc < 0)  {
              pr_err("%s line %d rc = %d\n", __func__, __LINE__, rc);
              return rc;
      }
      return cci_ctrl.status;
}";}i:2;i:990;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:461:"msm_cci.c probe中调用该函数，获取I2C_SDA && I2C_CLK
static int32_t msm_cci_init_gpio_params(struct cci_device *cci_dev)
{
      for (i = 0; i < tbl_size; i++) {
              gpio_tbl[i].gpio = of_get_gpio(of_node, i);
              CDBG("%s gpio_tbl[%d].gpio = %d\n", __func__, i,
              gpio_tbl[i].gpio);
      }
}
改文件还提供g_cci_subdev，供其他模块调用。
struct v4l2_subdev *msm_cci_get_subdev(void)
{
return g_cci_subdev;
}";}i:2;i:1620;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1009:" msm8226-camera.dtsi中I2C DATA 和CLK对应的GPIO。
 114         cci: qcom,cci@fda0c000 {
 115                 cell-index = <0>;
 116                 compatible = "qcom,cci";
 117                 reg = <0xfda0c000 0x1000>;
 118                 #address-cells = <1>;
 119                 #size-cells = <0>;
 120                 reg-names = "cci";
 121                 interrupts = <0 50 0>;
 122                 interrupt-names = "cci";
 123                 gpios = <&msmgpio 29 0>,
 124                         <&msmgpio 30 0>;
 125                 qcom,gpio-tbl-num = <0 1>;
 126                 qcom,gpio-tbl-flags = <1 1>;
 127                 qcom,gpio-tbl-label = "CCI_I2C_DATA0",
 128                                       "CCI_I2C_CLK0";
 129                 master0: qcom,cci-master0 {
 130                         status = "disabled";
 131                 };
 132                 master1: qcom,cci-master1 {
 133                         status = "disabled";
 134                 };
 135         };";}i:2;i:2111;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2111;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"msm_sensor.c中：";}i:2;i:3170;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3188;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:171:"int32_t msm_sensor_platform_probe(struct platform_device *pdev, void *data)  -->  cci_client->cci_subdev = msm_cci_get_subdev();
就可以调用到msm_cci.c中的数据。";}i:2;i:3188;}i:14;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3188;}}