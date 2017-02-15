a:8:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"1. 预充电";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:15;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1566:" 在完成基本的初始化工作以后，系统需要检查供电系统，包括Battery及Battery Debug Board是否存在，Charger是否存在及Charger类型等，调用关系如下:
 sbl1_hw_init_secondary()->boot_pm_driver_init()->pm_driver_post_init()->pm_chg_sbl_charging_init()
 (1)Charging Init
 
 a） sbl_chg_app_ds =(uint16*)pm_target_information_get_module_lut_info(CHG_APP, NULL);
 获取充电算法的指定数据，sbl_chg_app_ds的取值为pm_config_target.c里面的chg_app_ds
 uint16 chg_app_ds[] = {
 3500,    //PM_CHG_FLCB_OS_BOOT_UP_THRESHOLD
 3200,    //PM_CHG_FLCB_WEAK_BATTERY_THRESHOLD
 2900,    //PM_CHG_FLCB_FAST_CHG_THRESHOLD
 2800,    //PM_CHG_FLCB_DEAD_BATTERY_THRESHOLD
  500,     // PM_CHG_DC_CHARGER_IMAX
 1050,    // PM_CHG_IMAX_DEFAULT
 1500,    // PM_CHG_USB_IDEV_DCHG
 1500,    //PM_CHG_USB_IUSB_NON_COMPLIANT_DCP
  500,     // PM_CHG_USB_IDEV_SDP
   90,     // PM_CHG_USB_IUNIT
   45,     // PM_CHG_USB_TRKL_TIMEOUT
 2050,    // PM_CHG_VBAT_TRKL_MIN_THRESHOLD
 2100,    //PM_CHG_VBAT_WEAK_MIN_THRESHOLD
 3600,    //PM_CHG_VBAT_WEAK_MAX_THRESHOLD
 3500,    //PM_CHG_FLCB_OS_BOOTUP_AFTER_USB_SUSPEND_THRESHOLD. 
    0,     // PM_CHG_PMIC_DEVICE_INDEX
    1     //PM_CHG_INTERNAL_PMIC_CHARGER_USED
 };
 
 b）pm_smbb_chg_get_internal_charger_present()
 检测Internal Charger是否存在，最终会调用pm_smbb_chg_get_internal_charger_present_alg()；
 注意：如果使用外部充电芯片的话，此处应该修改为直接返回True，否则可能导致板子不停重启；
 
 c）pm_chg_sbl_charging_state_entry()
 
 ";}i:2;i:17;}i:7;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:17;}}