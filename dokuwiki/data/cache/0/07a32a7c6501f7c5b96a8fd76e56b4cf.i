a:24:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"1. 预充电";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:290:" 在完成基本的初始化工作以后，系统需要检查供电系统，包括Battery及Battery Debug Board是否存在，
 Charger是否存在及Charger类型等，调用关系如下:
 sbl1_hw_init_secondary()->boot_pm_driver_init()->pm_driver_post_init()->
 pm_chg_sbl_charging_init()";}i:2;i:27;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:327;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"2. Charging Init";i:1;i:1;i:2;i:327;}i:2;i:327;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:327;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:184:" sbl_chg_app_ds =(uint16*)pm_target_information_get_module_lut_info(CHG_APP, NULL);
 获取充电算法的指定数据，sbl_chg_app_ds的取值为pm_config_target.c里面的chg_app_ds";}i:2;i:360;}i:8;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:833:"
   uint16 chg_app_ds[] = {
   3500,    //PM_CHG_FLCB_OS_BOOT_UP_THRESHOLD   可以通过修改此值来改变开机电压值
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
";i:1;s:1:"c";i:2;N;}i:2;i:555;}i:9;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:460:" pm_smbb_chg_get_internal_charger_present()
 检测Internal Charger是否存在，最终会调用pm_smbb_chg_get_internal_charger_present_alg()；
 注意：如果使用外部充电芯片的话，此处应该修改为直接返回True，否则可能导致板子不停重启；
 
 pm_chg_sbl_charging_state_entry()
 如果内部充电存在，则会进一步检查供电系统；
 
 pm_chg_dvdd_hard_reset()
 如果内部充电不存在，则会执行重启；
 ";}i:2;i:1398;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1880;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"3.检测Battery和Debug  Board状态";i:1;i:1;i:2;i:1880;}i:2;i:1880;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1880;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:84:" 1: 如果Debug Board存在，则执行启动流程（当然这里是不存在的）";}i:2;i:1930;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:103:"
   if( debug_board_present== TRUE) {
       next_state_ptr = &pm_chg_state__bootup_ok;  //Bootup OK
}
";i:1;s:1:"c";i:2;N;}i:2;i:2023;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:259:" 2: 如果电池也不存在，则设置USB输出最大电流（500mA）注S700项目遇到电池没接ID脚，会识别电池不存在,会造成无论电池电压多少，都会开机，
 如果插入低功率的充电器的话，会造成重复的开关机.";}i:2;i:2136;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:248:"
if( battery_present ==FALSE)
{      //No battery presence is detected
       err_flag |= pm_smbb_chg_set_iusb_max(device_index, PM_SMBB_1, \
               sbl_chg_app_ds[PM_CHG_USB_IDEV_DCHG]);
       next_state_ptr = &pm_chg_state__bootup_ok;
}
";i:1;s:1:"c";i:2;N;}i:2;i:2406;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:103:" 3: 如果电池存在，则检查是否低电，低电则进入充电模式，否则执行开机流程";}i:2;i:2664;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:757:"
pm_err_flag_type pm_chg_is_battery_weak(boolean  *battery_weak)
{
    pm_err_flag_type err_flag = PM_ERR_FLAG__SUCCESS;
    uint32 batt_voltage = 0x0; 

    err_flag = pm_chg_get_battery_volt_level(&batt_voltage);
    if(err_flag == PM_ERR_FLAG__SUCCESS)
    {   
        pm_chg_status.batt_level = batt_voltage;  //update global var

        if(batt_voltage < sbl_chg_app_ds[PM_CHG_FLCB_OS_BOOT_UP_THRESHOLD])
        {   
            *battery_weak = TRUE;  //battery is weak
        }   
        else
        {   
            *battery_weak = FALSE;  //battery is good
        }   
    }                                                                                                                                             

    return err_flag;
}


";i:1;s:1:"c";i:2;N;}i:2;i:2776;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:282:" 如果电池低电的话，接下来就是检查DCCharger或者USB Charger是否存在，如果存在则执行充电流程，不存在则关机，
 详细可以参考pm_chg_state__charger_type_detect；
 4: 预充电
 以USB充电为例，下面简单介绍下预充电的流程：";}i:2;i:3543;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1209:"
while( battery_weak)  //While battery is in weak state
{
       // Check for batterydisconnection
       err_flag |= pm_chg_is_battery_present(&battery_present);
       if(err_flag == PM_ERR_FLAG__SUCCESS)
       {
              if(battery_present == FALSE) //Battery is disconnected
              {
                     next_state_ptr = &pm_chg_state__bootup_ok;//boot up without battery
                     break;
              }
       }
 
       //Check USB chargerpresence
       err_flag =pm_chg_is_usb_charger_present(&usb_charger_present);
       if( (usb_charger_present == FALSE) || (err_flag !=PM_ERR_FLAG__SUCCESS) )
       {
              err_flag |= pm_smbb_chg_set_mode(device_index,PM_SMBB_1, \
                                                 PM_SMBB_CHG_MODE__CHARGE_OFF);
              next_state_ptr = &pm_chg_state__shutdown;
              battery_weak = TRUE;
              break;
       }
 
       //Enable chargingand LED blinking
       toggle_led = !toggle_led;
       err_flag |= pm_chg_sbl_enable_led(device_index, toggle_led);
 
       DALSYS_BusyWait(1000*500); // Poll every 500ms
 
       //Check battery weakstate
       err_flag |= pm_chg_is_battery_weak(&battery_weak);
}
";i:1;s:1:"c";i:2;N;}i:2;i:3840;}i:21;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:237:" 从上面的代码能看出，在充电循环里面先后检查了Battery和USB Charger是否存在，不存在则会退出循环，
 同时LED灯会有红色闪烁，最后检查低电，当电池电压大于3.5v时，系统启动；  ";}i:2;i:5059;}i:22;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5059;}i:23;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5059;}}