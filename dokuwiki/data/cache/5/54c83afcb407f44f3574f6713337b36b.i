a:73:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"1 代码分析";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:17;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:503:"SBL1主要重点描述以下几点:
１、  CDT ： Platform ID和DDR参数
２、　debug log　：
３、　download　： msm8K 新平台软件download支持两种协议，sahara和firehose
４、　ramdump　：死机异常信息dump
在sbl1.S汇编代码中有几句注释:
Set up the hardware to continue boot process
Initialize DDR memory
Load Trust-Zone OS
Load RPM firmware
Load APPSBL and continue boot process
 入口函数
./BOOT.BF.3.3/boot_images/core/boot/secboot3/hw/msm8952/sbl1/sbl1.S
";}i:2;i:19;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:8;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:26:":msm:20140703175914890.jpg";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:552;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:583;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:583;}i:11;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:587;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"2 初始化启动log和timer";}i:2;i:589;}i:13;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:617;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:619;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:571:"177 void boot_log_init(boot_log_init_data *init_data)
178 {
179   /*we must first set meta info becasue boot_log_init_ram and
180    * boot_log_init_timer will use the meta info structure*/
181   boot_log_set_meta_info(init_data->meta_info_start);
182   boot_log_init_ram(init_data);
183   boot_init_timer(init_data);
184   boot_log_init_uart();
185 
186   /* Write image version values out to the log. */
187   boot_log_image_version(); 
188 
189   /* Write the Boot Config register out to the log. */
190   boot_log_boot_config_register();
191 }
192 /* boot_log_init */";}i:2;i:619;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:619;}i:17;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1224;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"3 配置PMIC";}i:2;i:1226;}i:19;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1238;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1240;}i:21;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1044:"1552   /* Call sbl1_hw_init to config pmic device so we can use PS_HOLD to reset */
1553   sbl1_hw_init(&bl_shared_data);
1583   /*----------------------------------------------------------------------
1584    In SBL builds the function below is stubbed out (does nothing).
1585    When building Deviceprogrammer the function below never returns.
1586    The function below becomes active by defining the feature
1587    FEATURE_BOOT_EXTERN_DEVICEPROGRAMMER_LITE_COMPLETED.
1588   ----------------------------------------------------------------------*/
1589   boot_hand_control_to_deviceprogrammer_lite_main (pbl_shared);
1590   
1591   /*-----------------------------------------------------------------------
1592     Process the target-dependent SBL1 procedures
1593   -----------------------------------------------------------------------*/
1594   boot_config_process_bl(&bl_shared_data,
1595                          SBL1_IMG,                 
1596                          sbl1_config_table);       
1597 
1598 } /* sbl1_main_ctl() */  ";}i:2;i:1240;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1240;}i:23;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2322;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"4 CDT配置 PlatformID 和DDR参数";}i:2;i:2324;}i:25;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2359;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2361;}i:27;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:538:"CDT包含CDB0:platformId和CDB1:DDR配置参数 注:CDB(configure data block)
1594   boot_config_process_bl(&bl_shared_data,
1595                          SBL1_IMG,                 
1596                          sbl1_config_table); 
由上面的这个函数来来传入一个sbl1_config_table结构体
./BOOT.BF.3.3/boot_images/core/boot/secboot3/hw/msm8952/sbl1/sbl1_config.c
606 boot_configuration_table_entry sbl1_config_table[] = {
所有GPIO，PMIC，DDR，等等都在这里,所以追代码的话，追到这里就都能看懂了。";}i:2;i:2361;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2361;}i:29;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_03_26.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:2918;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:2967;}i:31;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_06_04.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:2968;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3017;}i:33;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_07_43.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3018;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3067;}i:35;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_08_22.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3068;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3117;}i:37;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_08_56.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3118;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3167;}i:39;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:23:"CDB0和CBD1详细描述";}i:2;i:3167;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3167;}i:41;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_10_04.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3194;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3243;}i:43;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_10_44.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3244;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3293;}i:45;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_11_14.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3294;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3343;}i:47;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_11_46.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3344;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:3393;}i:49;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":msm:screenshot_from_2017-01-22_10_12_06.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3394;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3443;}i:51;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:71:"详细请看80-N3411-1 G文档 Software Configuration Data Table (CDT)
";}i:2;i:3443;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3443;}i:53;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3524;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"5 SW Download";}i:2;i:3526;}i:55;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3539;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3541;}i:57;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:2392:"高通8K以后平台支持如下两种，说到下载模式，忍不住又得骂高通。以前6K, 7K平台不支持紧急下载模式，工厂生产软件要down到手机里，
非常复杂。要嘛先用烧录器烧一段sbl image，然后剩下的image自己开发升级软件用usb多路升级。要嘛全部image用烧录器一次性烧完。
紧急下载模式：pbl负责与ＰＣ交互，实现软件下载:
自动进入紧急下载模式：主板刚生产emmc是裸片时，或者sbl运行异常时，系统自动进入紧急下载模式。
手动进入紧急下载模式：通过硬件一个gpio下拉，pbl检测到该gpio后强制进入紧急下载模式。这种主要以防不测。这种是硬件短接测试点
另外一种就是软件通过设置magic number，然后由热重启，pbl检测到magic number后，强制进入下载模式。adb reboot edl

187 /*=============================================================================
188 
189 **  Function :  boot_dload_transition_pbl_forced_dload
190 
191 ** ==========================================================================
192 */
193 /*!
194 * 
195 * @brief
196 *   This function sets the magic numbers for PBL to detect and enter forced
197 *   download mode.  It then calls the target specific function to trigger a
198 *   system reset.
199 * 
200 * @par Dependencies
201 *   None
202 *   
203 * @retval
204 *   None
205 * 
206 * @par Side Effects
207 *   Set's PBL magic numbers to enter forced download, resets target, never to
208 *   return.
209 * 
210 */
211 void boot_dload_transition_pbl_forced_dload( void )
212 {
213   /* PBL uses the last four bits of BOOT_MISC_DETECT to trigger forced download.
214      Preserve the other bits of the register. */
215 
216   uint32 register_value =   
217     HWIO_TCSR_BOOT_MISC_DETECT_INM(HWIO_TCSR_BOOT_MISC_DETECT_RMSK);
218 
219   /* Clear the PBL masked area and then apply HS_USB value */
220   register_value &= ~(FORCE_DLOAD_MASK);
221   register_value |= FORCE_DLOAD_HS_USB_MAGIC_NUM;
222 
223   /* Write the new value back out to the register */
224   HWIO_TCSR_BOOT_MISC_DETECT_OUTM(FORCE_DLOAD_MASK,                                                                                 
225                                   register_value);          
226 
227   boot_hw_reset(BOOT_WARM_RESET_TYPE);
228 } /* boot_dload_transition_pbl_forced_dload() */";}i:2;i:3541;}i:58;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:3122:"2 普通下载模式：sbl负责与ＰＣ交互，实现软件下载
手机第一次下载完软件以后，普通情况下，可不进入pbl紧急下载模式，可由sbl进行软件升级。
boot_dload_check()检测到USB D+ 接地、或者sbl发生异常时调用boot_dload_set_cookie()设置了cookie，
进自动进入普通的下载模式。可以看boot_dload_check函数
267 /*===========================================================================
268 
269 **  Function :  boot_dload_check
270 
271 ** ==========================================================================
272 */
273 /*!
274 * 
275 * @brief
276 *   This function will check to see if the downloader should be entered
277 *   for QPST download, and enter the downloader if directed to.
278 *  
279 * @param[in] bl_shared_data Pointer to the shared data 
280 *
281 * @par Dependencies
282 *   Download ID must be present in IRAM if downloader is to be entered.
283 * 
284 * @retval
285 *   None
286 * 
287 * @par Side Effects
288 *   Boot may be halted and QPST downloader entered.
289 * 
290 */
291 void boot_dload_check
292 ( 
293   bl_shared_data_type *bl_shared_data 
294 )                                                                                                                                   
295 {
296   boolean status = FALSE;
297   pm_err_flag_type warm_reset_status;
298   
299   /* Determine if the downloader should be entered at this time,
300      instead of continuing with the normal boot process. */
301   if ( boot_dload_entry( ) == TRUE )
302   {
303     /* Check the UEFI ram dump cookie, we enter download mode
304        only if UEFI ram dump cookie is NOT set*/
305     if ( !( boot_shared_imem_cookie_ptr != NULL &&
306             boot_shared_imem_cookie_ptr->uefi_ram_dump_magic == 
307             UEFI_CRASH_DUMP_MAGIC_NUM ) )
308     {
309       /* Enter downloader for QPST */  
310       sbl_dload_entry();
311     }
312   }
313  /* Check if PMIC warm reset occured */
314   BL_VERIFY((warm_reset_status=boot_pm_pon_warm_reset_status(0, &status)) == 
PM_ERR_FLAG__SUCCESS,     (uint16)warm_reset_status|BL_ERRO
315 
316   /* If status is true, set abonormal reset cookie and 
317      clear the warm reset status in PMIC */
318   if(status)
319   { 
320     if ( boot_shared_imem_cookie_ptr != NULL )
321        boot_shared_imem_cookie_ptr->abnormal_reset_occurred = ABNORMAL_RESET_ENABLED;
322 
323     BL_VERIFY((warm_reset_status=boot_pm_pon_warm_reset_status_clear(0)) == 
PM_ERR_FLAG__SUCCESS,   (uint16)warm_reset_status|BL_ERROR
324   }
325 } /* boot_dload_check() */   

167 /*===========================================================================
168 **  Function :  boot_dload_set_cookie
169 ** ==========================================================================
170 */
171 /*!
172 * 
173 * @brief
174 *   Set the SBL dload mode cookie
175 **        
176 * @par Dependencies  
177 *  None
178 *   
179 */
180 void boot_dload_set_cookie()
181 {
182   HWIO_TCSR_BOOT_MISC_DETECT_OUTM(SBL_DLOAD_MODE_BIT_MASK,
183                                   SBL_DLOAD_MODE_BIT_MASK); 
184 }";}i:2;i:6033;}i:59;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:2022:"void (*sbl_dload_entry)(void) = boot_dload_transition_pbl_forced_dload;
函数指针sbl_dload_entry默认指向紧急下载模式的入口：boot_dload_transition_pbl_forced_dload,
该下载方式会切换到pbl，由pbl通过firehose协议实现download。
sbl1_target.c
139 void sbl1_dload_entry ()
140 {
141   static uint32 dload_entry_count = 0;
142 
143   dload_entry_count++; 
144 
145   /* Only execute the pre-dload procedures the first time we try to enter
146    * dload in case there is an error within these procedures. */
147   if( dload_entry_count == 1 && &bl_shared_data != NULL ) 
148   {                                                                                                                                  
149     /* Entering dload routine for the first time */
150     boot_do_procedures( &bl_shared_data, sbl1_pre_dload_procs );
151   }
152   
153   /* Enter boot Sahara */
154   boot_dload_transition_enter_sahara();
155   
156 }/* sbl_dload_entry() */
而sbl1定义了另一个下载模式的入口：sbl1_dload_entry，它支持直接在sbl1中通过sahara协议download，
还支持crash ram dump 功能。包括dump to raw partition ,and dump to sdcard 。
见：boot_do_procedures( &bl_shared_data, sbl1_pre_dload_procs );　
crash ramdump章节再详细看看。

sbl1_mc.c
<pre name="code" class="cpp">/*DLOAD flag for SBL1 to enter PBL error handler*/  
#ifdef BOOT_ENTER_PBL_DLOAD_ON_SBL_ERROR  
  static boot_boolean edload_flag = TRUE;  
#else  
  static boot_boolean edload_flag = FALSE;  
#endif  
</pre><pre name="code" class="cpp">void sbl1_post_ddr_init(bl_shared_data_type *bl_shared_data)  
{  
   ..........  
  
  if (edload_flag != TRUE)  
  {  
    /* Update the dload entry to sbl1 sahara dload entry function */  
    sbl_dload_entry = sbl1_dload_entry;  
  }   
}
好，既然在sbl1有两个download入口，如何选则呢？   
sbl1_mc.c 中通过宏BOOT_ENTER_PBL_DLOAD_ON_SBL_ERROR控制。
如果定义该宏，则dload处理会转交给PBL帮忙处理了。";}i:2;i:9325;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9325;}i:61;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11443;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"3  进入升级模式的方法";}i:2;i:11445;}i:63;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11475;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11477;}i:65;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:4688:"上节描述的高通默认进入下载模式的方法，都是自动的，显然无法满足开发、生产、售后等需求。
因此如下两种方法，实用于开发、生产、售后。
sbl1扫描按键组合：
关机状态下，sbl1扫描按键组合，比如，扫描到power & vol+ 两个按键同时按下，则进入pbl紧急下模模式。
当然，有些结构设计可能导致power & vol+ 两个按键开机容易误触，则可以采用别的硬件组合方式。比如，
vol+ & usb　等等！
关机状态，进入下载模式，没有ram dump的需求，因此当扫描到相应的硬件组合，
直接调用：boot_dload_transition_pbl_forced_dload
adb reboot + edl / dload:
手机正常开机，能连接usb上的状态下，可以使用 adb reboot edl 或者 adb reboot dload 命令，
使手机进入pbl紧急下载模式，或者进入sbl1普通下载模式。
kernel/drivers/power/reset/msm-poweroff.c　，相关代码由宏CONFIG_MSM_DLOAD_MODE控制。
  static int msm_restart_probe(struct platform_device *pdev)  
{  
    struct device *dev = &pdev->dev;  
    struct resource *mem;  
    struct device_node *np;  
    int ret = 0;  

#ifdef CONFIG_MSM_DLOAD_MODE  
    if (scm_is_call_available(SCM_SVC_BOOT, SCM_DLOAD_CMD) > 0)  
        scm_dload_supported = true;  

    atomic_notifier_chain_register(&panic_notifier_list, &panic_blk);  
    np = of_find_compatible_node(NULL, NULL, DL_MODE_PROP);  
    if (!np) {  
        pr_err("unable to find DT imem DLOAD mode node\n");  
    } else {  
        dload_mode_addr = of_iomap(np, 0);  
        if (!dload_mode_addr)  
            pr_err("unable to map imem DLOAD offset\n");  
    }  

    np = of_find_compatible_node(NULL, NULL, EDL_MODE_PROP);  
    if (!np) {  
        pr_err("unable to find DT imem EDLOAD mode node\n");  
    } else {  
        emergency_dload_mode_addr = of_iomap(np, 0);  
        if (!emergency_dload_mode_addr)  
            pr_err("unable to map imem EDLOAD mode offset\n");  
    }  

    set_dload_mode(download_mode);  
#endif  
    np = of_find_compatible_node(NULL, NULL,  
                "qcom,msm-imem-restart_reason");  
    if (!np) {  
        pr_err("unable to find DT imem restart reason node\n");  
    } else {  
        restart_reason = of_iomap(np, 0);  
        if (!restart_reason) {  
            pr_err("unable to map imem restart reason offset\n");  
            ret = -ENOMEM;  
            goto err_restart_reason;  
        }  
    }  

  mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);  
  msm_ps_hold = devm_ioremap_resource(dev, mem);  
  if (IS_ERR(msm_ps_hold))  
      return PTR_ERR(msm_ps_hold);  

  pm_power_off = do_msm_poweroff;  
  arm_pm_restart = do_msm_restart;  

  if (scm_is_call_available(SCM_SVC_PWR, SCM_IO_DISABLE_PMIC_ARBITER) > 0)  
      scm_pmic_arbiter_disable_supported = true;  

  return 0;  

err_restart_reason:  
#ifdef CONFIG_MSM_DLOAD_MODE  
    iounmap(emergency_dload_mode_addr);  
    iounmap(dload_mode_addr);  
#endif  
    return ret;  
}  
说明，scm dload是支持的。因此，接下来的两个函数，都是通过scm dload实现download模式切换。
  static void enable_emergency_dload_mode(void)  
{  
    int ret;  

    if (emergency_dload_mode_addr) {  
        __raw_writel(EMERGENCY_DLOAD_MAGIC1,  
                emergency_dload_mode_addr);  
        __raw_writel(EMERGENCY_DLOAD_MAGIC2,  
                emergency_dload_mode_addr +  
                sizeof(unsigned int));  
        __raw_writel(EMERGENCY_DLOAD_MAGIC3,  
                emergency_dload_mode_addr +  
                (2 * sizeof(unsigned int)));  

        /* Need disable the pmic wdt, then the emergency dload mode 
         * will not auto reset. */  
        qpnp_pon_wd_config(0);  
        mb();  
    }  

    if (scm_dload_supported) {  
        ret = scm_call_atomic2(SCM_SVC_BOOT,  
                SCM_DLOAD_CMD, SCM_EDLOAD_MODE, 0);  
        if (ret)  
            pr_err("Failed to set EDLOAD mode: %d\n", ret);  
    }  
}  
使能紧急下载模式。
  static void set_dload_mode(int on)  
{  
    int ret;  

    if (dload_mode_addr) {  
        __raw_writel(on ? 0xE47B337D : 0, dload_mode_addr);  
        __raw_writel(on ? 0xCE14091A : 0,  
               dload_mode_addr + sizeof(unsigned int));  
        mb();  
    }  

    if (scm_dload_supported) {  
        ret = scm_call_atomic2(SCM_SVC_BOOT,  
                SCM_DLOAD_CMD, on ? SCM_DLOAD_MODE : 0, 0);  
        if (ret)  
            pr_err("Failed to set DLOAD mode: %d\n", ret);  
    }  

    dload_mode_enabled = on;  
}  
这样adb reboot edl 或者 adb reboot dload 命令就可以使手机进入下载模式了。";}i:2;i:11477;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11477;}i:67;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:16421;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"4、软件升级工具及协议";}i:2;i:16423;}i:69;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16454;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16456;}i:71;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:483:"高通平台，从MSM6K 、7K 到8K，　download的方法和协议，一直在更新。
协议经历了从stream dload到sahara，再到现在firehose 。
每一种协议的具体描述参考如下文档： 
80-V5348-1_J_Streaming_DLoad_Protocol.pdf
80-N1008-1_H_SaharaProtocolSpecification.pdf
80-NG319-1_A_Firehose Protocol V1.0_Def_Doc.pdf
根据使用不同协议，相应的，高通提供两个下载工具：eMMC Software Download  和 QFIL (Qualcomm Flash Image Loader ) 


";}i:2;i:16456;}i:72;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:16456;}}