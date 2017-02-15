a:72:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:290:"1. General description
Generally, Qualcomm will use the PMIC to generate PWM signals. Actually, some GPIOs of MSM8926 can be used to output PWM signals too. These gpios are 12, 16, 17, 33, 34, 49, 50, and 51 in MSM8926. This document will guide you to enable the PWM function of these pins.";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:291;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:291;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"To enable the PWM function, you should do following:";}i:2;i:293;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:345;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:132:"  1. Set the GPIO to PWM function.
  2. Combine a clock to this PIN to be PWM base frequency.
  3. Adjust the duty value of the PWM.";}i:2;i:345;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:345;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:110:"2. Detail steps
2.1 Set the GPIO to PWM function:
You can use following function to set the pin to output PWM.";}i:2;i:486;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:596;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:139:"  gpio_tlmm_config(GPIO_CFG(
      PWM_GPIO, 3,
      GPIO_CFG_OUTPUT,
      GPIO_CFG_PULL_UP,
      GPIO_CFG_4MA),
      GPIO_CFG_ENABLE);";}i:2;i:596;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:596;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:211:"Please notice, you should use 3 to enable the PWM function of the GPIO.
Please notice, the PWM_GPIO should be one of 12, 16, 17, 33, 34, 49, 50, and 51.
We tested 34 on some platform. So we prefer to use pin 34.";}i:2;i:749;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:960;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:960;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:"2.2 Combine the clock to the GPIO pin:
You should do following 3 things to combine a clock:";}i:2;i:962;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1053;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:141:"  1. define a new camss clock by CLK_LOOKUP
  2. open the camss clock by clk_get
  3. enable the clock by clk_set_rate and clk_prepare_enable";}i:2;i:1053;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1053;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:"2.2.1 define a new clock
You should change following code in kernel/arch/arm/mach-msm/clock-8226.c to use camss clock";}i:2;i:1203;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1320;}i:22;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:63:"  CLK_LOOKUP("cam_gp1_clk", camss_gp1_clk.c, "mdss_dsi_panel"),";}i:2;i:1320;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1320;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"Please notice, there is old code with the empty third parameter. Please change.";}i:2;i:1387;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1466;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1466;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"2.2.2 open the new clock
Sample code is like following:";}i:2;i:1468;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1523;}i:29;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:283:"  struct device pwm_dev = {.init_name = "mdss_dsi_panel",};
  static struct clk *pwm_gp1_clk = NULL;
  pwm_gp1_clk = clk_get(&pwm_dev, "cam_gp1_clk");
  if (IS_ERR(pwm_gp1_clk))
  {
      printk("%s: Get cam_gp1_clk error!!!\n", __func__);
      pwm_gp1_clk = NULL;
      return;
  }";}i:2;i:1523;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1523;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Please notice following things:";}i:2;i:1826;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1857;}i:33;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:152:"  The pwm_dev.init_name should match the third parameter of CLK_LOOKUP.
  The clk_get's second parameter should match the first parameter of CLK_LOOKUP.";}i:2;i:1857;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1857;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"2.2.3 enable the clock
Sample code is like following:";}i:2;i:2016;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2069;}i:37;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:163:"  clk_set_rate(pwm_gp1_clk, 24000);
  ret = clk_prepare_enable(pwm_gp1_clk);
  if (ret)
  {
      printk("%s: clk_prepare error!!!\n", __func__);
      return;
  }";}i:2;i:2069;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2069;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:272:"Please notice, if you do not change the code, you can use following frequency. For other values, please raise case to check.
For pin 12, 16, 17, 49, 50, 51, you can use 24000 and 19200000
For pin 33, 34, you can use 10000, 24000, 6000000, 12000000, 13000000, and 24000000.";}i:2;i:2248;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2520;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2520;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"2.3 Adjsut the duty value
Sample code is like following:";}i:2;i:2522;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2578;}i:44;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:300:"  unsigned int * mmss_gp1_d_address = NULL;
  unsigned int * mmss_gp1_cmd_RCGR_address = NULL;
  mmss_gp1_d_address = (unsigned int *)(((unsigned char *)virt_bases[MMSS_BASE]) + MMSS_GP1_D);
  mmss_gp1_cmd_RCGR_address = (unsigned int *)(((unsigned char *)virt_bases[MMSS_BASE]) + MMSS_GP1_CMD_RCGR);";}i:2;i:2578;}i:45;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:110:"  mmss_gp1_d_address[0] = (~( N * level / 100)) & 0x0ff;
  mb();
  mmss_gp1_cmd_RCGR_address[0] = 0x3;
  mb();";}i:2;i:2888;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2888;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:202:"Please notice you should always write 3 to RCGR to active the level setting.
Please notice the level in above code is 0 - 100.
Please notice N is the last parameter of the F_MMSS, that is, 50 for 24kHz:";}i:2;i:3008;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3210;}i:49;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3210;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"3. Sample code:
static void set_pwm_gpio(int level)
{";}i:2;i:3217;}i:51;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3270;}i:52;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:44:"  pr_err("%s: level=%d\n", __func__, level);";}i:2;i:3270;}i:53;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:630:"  if (NULL == pwm_gp1_clk)
  {
      gpio_tlmm_config(GPIO_CFG(
          BL_GPIO, 3,
          GPIO_CFG_OUTPUT,
          GPIO_CFG_PULL_UP,
          GPIO_CFG_4MA),
          GPIO_CFG_ENABLE);
      msleep(10);
      pwm_gp1_clk = clk_get(&pwm_dev, "cam_gp1_clk");
      if (IS_ERR(pwm_gp1_clk))
      {
          printk("%s: Get cam_gp1_clk error!!!\n", __func__);
          pwm_gp1_clk = NULL;
          return;
      }
             
      clk_set_rate(pwm_gp1_clk, 24000);
      clk_prepare_enable(pwm_gp1_clk);
  }
             
  mmss_gp1_d_address[0] = level;
  mb();
  mmss_gp1_cmd_RCGR_address[0] = 0x3;
  mb();
  return;";}i:2;i:3318;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3318;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:4002;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4003;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4003;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:247:"4. Debug
You can use following method to test if you cannot get the PWM signals from the pin.
4.1 JTAG
If you have JTAG, you can use following cmm to check whether the clock is correct or not.
core\systemdrivers\clock\scripts\msm8926\testclock.cmm";}i:2;i:4006;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4253;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4253;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:164:"4.2 printk
If you do not have JTAG, please dump below register, check if it is same as your setting, and raise case.
unsigned int * gcc_gp1_cbcr = (unsigned int * )";}i:2;i:4255;}i:62;a:3:{i:0;s:4:"nest";i:1;a:1:{i:0;a:31:{i:0;a:3:{i:0;s:13:"footnote_open";i:1;a:0:{}i:2;i:4419;}i:1;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"(unsigned char *)gcc_base) + 0x1900);
printk(";}i:2;i:4421;}i:2;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4466;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"GCC_GP1_CBCR[0x%08x] value is 0x%08x\n.";}i:2;i:4467;}i:4;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4506;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:", (unsigned int)&(gcc_gp1_cbcr[0]), gcc_gp1_cbcr[0]);
printk(";}i:2;i:4507;}i:6;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4568;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"GCC_GP1_CMD_RCGR value is 0x%08x\n.";}i:2;i:4569;}i:8;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4604;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", gcc_gp1_cbcr[1]);
printk(";}i:2;i:4605;}i:10;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4632;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"GCC_GP1_CFG_RCGR value is 0x%08x\n.";}i:2;i:4633;}i:12;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4668;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", gcc_gp1_cbcr[2]);
printk(";}i:2;i:4669;}i:14;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4696;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"GCC_GP1_M value is 0x%08x\n.";}i:2;i:4697;}i:16;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4725;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", gcc_gp1_cbcr[3]);
printk(";}i:2;i:4726;}i:18;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4753;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"GCC_GP1_N value is 0x%08x\n.";}i:2;i:4754;}i:20;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4782;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", gcc_gp1_cbcr[4]);
printk(";}i:2;i:4783;}i:22;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4810;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"GCC_GP1_D value is 0x%08x\n.";}i:2;i:4811;}i:24;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4839;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", gcc_gp1_cbcr[5]);
printk(";}i:2;i:4840;}i:26;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4867;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"TLMM_GPIO_CFG_34 value is 0x%08x\n.";}i:2;i:4868;}i:28;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4903;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:", *((unsigned int *)ioremap(0xFD511220, 4";}i:2;i:4904;}i:30;a:3:{i:0;s:14:"footnote_close";i:1;a:0:{}i:2;i:4945;}}}i:2;i:4419;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:");";}i:2;i:4947;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4949;}i:65;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4949;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:167:"4.3 debugfs
You can also mount the debugfs, and check the signal with oscilloscope. The steps are following:
adb root
adb shell
mount -t debugfs none /sys/kernel/debug";}i:2;i:4951;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5118;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5118;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:111:"cd /sys/kernel/debug/clk/[clock name]
cat enable
# should return 1
cat rate
# should return the clock frequency";}i:2;i:5120;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5120;}i:71;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5120;}}