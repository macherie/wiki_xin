a:20:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"1 SBL";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:2044:"/* PON KPDPWR configuration: s1_timer=10256ms, S2_timer=100ms, Warm Reset */
err_flag |= pm_pon_reset_source_cfg(0, PM_PON_RESET_SOURCE_KPDPWR, 10256, 2000,
PM_PON_RESET_CFG_WARM_RESET);
/* PON KPDPWR reset function enable */
err_flag = pm_pon_reset_source_ctl (0, PM_PON_RESET_SOURCE_KPDPWR, PM_ON);
/* PON KPDPWR reset function disable */
err_flag = pm_pon_reset_source_ctl (0, PM_PON_RESET_SOURCE_KPDPWR, PM_OFF);
Usually set it in pm_device_post_init(void) from:
@boot_images/core/systemdrivers/pmic/target/msm89xx_pm89xx_pmi89xx/system/src/pm_sbl_boot_oem.c
Timer:
@ boot_images/core/systemdrivers/pmic/drivers/pon/src/pm_pon.c
static uint32
pon_s1_timer_val[] =
{0, 32, 56, 80, 128, 184, 272, 408, 608, 904, 1352, 2048, 3072, 4480, 6720, 10256};
static uint32
pon_s2_timer_val[] =
{0, 10, 50, 100, 250, 500, 1000, 2000};
Reset type:
@ boot_images/core/api/systemdrivers/pmic/pm_pon.h
typedef enum
{
PM_PON_RESET_CFG_WARM_RESET,
PM_PON_RESET_CFG_NORMAL_SHUTDOWN,
/* Shutdown to a state of main battery removal */
PM_PON_RESET_CFG_D_VDD_BATT_REMOVE_SHUTDOWN,
/* Shutdown to a state of main battery and coin cell removal*/
PM_PON_RESET_CFG_X_VDD_COIN_CELL_REMOVE_SHUTDOWN,
/* Shutdown + Auto pwr up */
PM_PON_RESET_CFG_HARD_RESET,
/* Main Batt and coin cell remove Shutdown + Auto pwr up 8: DVDD_HARD_RESET */
PM_PON_RESET_CFG_D_VDD_BATT_REMOVE_HARD_RESET,
PM_PON_RESET_CFG_D_VDD_COIN_CELL_REMOVE_HARD_RESET,
PM_PON_RESET_CFG_X_VDD_COIN_CELL_REMOVE_HARD_RESET,
PM_PON_RESET_CFG_IMMEDIATE_X_VDD_COIN_CELL_REMOVE_SHUTDOWN,
/* Warm Reset and Main Batt/coin cell remove Shutdown */
PM_PON_RESET_CFG_WARM_RESET_AND_D_VDD_BATT_REMOVE_SHUTDOWN,
PM_PON_RESET_CFG_WARM_RESET_AND_X_VDD_COIN_CELL_REMOVE_SHUTDOWN,
PM_PON_RESET_CFG_WARM_RESET_AND_SHUTDOWN,
/* Warm Reset then Main Batt/coin cell remove Shutdown + Auto pwr up */
PM_PON_RESET_CFG_WARM_RESET_THEN_HARD_RESET,
PM_PON_RESET_CFG_WARM_RESET_THEN_D_VDD_BATT_REMOVE_HARD_RESET,
PM_PON_RESET_CFG_WARM_RESET_THEN_X_VDD_COIN_CELL_REMOVE_HARD_RESET,
PM_PON_RESET_CFG_INVALID
}pm_pon_reset_cfg_type;";}i:2;i:10;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10;}i:8;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2144;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"2. in kernel";}i:2;i:2146;}i:10;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2158;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2160;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:349:"Configure the dtsi file:
Example:
@ arch/arm/boot/dts/qcom/msm-pm8953.dtsi
qcom,power-on@800 {
compatible = "qcom,qpnp-power-on";
qcom,pon_1 {
qcom,pon-type = <0>;
qcom,pull-up = <1>;
linux,code = <116>;
qcom,support-reset = <1>; //support reset
qcom,s1-timer = <10256>; //10256ms
qcom,s2-timer = <2000>; //2000ms
qcom,s2-type = <1>; //warm reset
};";}i:2;i:2160;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2160;}i:14;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2539;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"3 参考文档";}i:2;i:2541;}i:16;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2555;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2557;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:797:"Refer to doc @Documentation/devicetree/bindings/platform/msm/qpnp-power-on.txt
- qcom,support-reset Indicates if this PON source supports
reset functionality.
0 = Not supported
1 = Supported
If this property is not defined, then do not modify S2 reset values.

- qcom,s1-timer The debounce timer for the BARK interrupt for
that reset source. Value is specified in ms.
Supported values are -
- 0, 32, 56, 80, 128, 184, 272, 408, 608, 904
1352, 2048, 3072, 4480, 6720, 10256

- qcom,s2-timer The debounce timer for the S2 reset specified
in ms. On the expiry of this timer, the PMIC
executes the reset sequence. Supported values -
- 0, 10, 50, 100, 250, 500, 1000, 2000
- qcom,s2-type The type of reset associated with this source. The supported resets are - SOFT(0), WARM(1), SHUTDOWN(4), HARD(7)

";}i:2;i:2557;}i:19;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2557;}}