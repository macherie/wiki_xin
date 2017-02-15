a:23:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"1. Change the programmable range in DTSI.";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:42;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:247:"             pm8226_l16: regulator-l16 {
                      regulator-name = "8226_l16";
                      regulator-min-microvolt = <3000000>;/*minimal voltage*/
                      regulator-max-microvolt = <3350000>;/*maximal voltage*/";}i:2;i:42;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:42;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"2. Change the programmable range in RPM.";}i:2;i:300;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:340;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:255:"  Pm_config_target.c (rpm_proc\core\systemdrivers\pmic\config\msm8x26\)
  pm_rpm_ldo_rail_info_type ldo_rail_a[NUM_OF_LDO_A] =
  {
      {5,  25, 0, 1, 0, PM_NPA_SW_MODE_LDO__IPEAK, 1200, 1250}, // L1 N1200, min = 1200, max = 1250, regulator type is N1200";}i:2;i:340;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:340;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"3. Change the HW range in SBL.  ";}i:2;i:606;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:638;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:173:"  a. Check the regulator type
      Every regulator belong to different type, for example pmos, nmos...
      You can check this type in HW spec or Pm_config_target.c(RPM). ";}i:2;i:638;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:571:"  b. Select the regulator range.
      Every type of regulator has several ranges for different voltage limits.
      You can find these ranges in pm_config_common.c(rpm_proc\core\systemdrivers\pmic\config\commom\)
      Below is the example for PMOS range.
      pm_pwr_volt_info_type pmos_volt[5] =
      {    //min,         max,                step
          { 750000,   1537500,         12500},  //LDO     2 (low range)
          {1500000,   3075000,         25000},  //LDO     3 (mid range)
          {1750000,   4900000,         50000},  //LDO     4(high range)    ";}i:2;i:819;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:819;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"      c. Set the range in SBL.";}i:2;i:1412;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1442;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:274:"         Pm_init.c (core\systemdrivers\pmic\framework\src)
         pm_err_flag_type pm_oem_init ( void )
         {   pm_err_flag_type errFlag = PM_ERR_FLAG__SUCCESS;
             pm_ldo_volt_level(0,PM_LDO_16,1200000); //this API will change the range according to voltage";}i:2;i:1442;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1442;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"4. Check the HW limits(exclude 8916)";}i:2;i:1727;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1763;}i:21;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:331:"   Every regulator have the HW limits those are named UL(up limit) and LL(low limit).
   So you should read these limits to check whether your voltage within these limits.
   These registers named in software interface as below:
      LDOXX_LL_VOLTAGE_CTL1   LDOXX_LL_VOLTAGE_CTL2
      LDOXX_UL_VOLTAGE_CTL1  LDOXX_UL_VOLTAGE_CTL2";}i:2;i:1763;}i:22;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1763;}}