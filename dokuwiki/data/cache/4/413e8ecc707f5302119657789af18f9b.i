a:9:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"修改ddr频率";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"DDR频率在ClockSBLConfig.c和ClockBSP.c中要对应";}i:2;i:28;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:81;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2126:"
For example:Replace 533 MHz with 518.4 MHz
1. Modify SBL1 first.
The calculation is 19.2*(L+(M/N))/2
2. Modify BIMCClockConfig[] for your frequency entry in ClockBSP.c in RPM.
boot_images/core/systemdrivers/clock/hw/msm8939/src/ClockSBLConfig.c
/* BIMCPLL @ 1036.8MHz. */
.BIMCPLL_Cfg =
{
.nPLLModeAddr = HWIO_ADDR(GCC_BIMC_PLL_MODE),
.nVoteAddr = HWIO_ADDR(GCC_RPM_GPLL_ENA_VOTE),
.nVoteMask = HWIO_FMSK(GCC_RPM_GPLL_ENA_VOTE, BIMC_PLL),
.nVCO = 0,
.nPreDiv = 1,
.nPostDiv = 1,
.nL = 54, // change here
.nM = 0, // change here
.nN = 1, // change here
.nConfigCtl = 0x00031000 },
rpm_proc/core/systemdrivers/clock/config/msm8939/ClockBSP.c
/*-----------------------------------------------------------------------*/
/* GPLL3 is retained here to avoid adding a new enum for BIMC_PLL */ /*----
-------------------------------------------------------------------*/
{
/* .eSource = */ HAL_CLK_SOURCE_GPLL3,
/* .HALConfig */ {
/* .HALConfig.eSource = */ HAL_CLK_SOURCE_XO,
/* .HALConfig.eVCO = */ HAL_CLK_PLL_VCO1,
/* .HALConfig.nPreDiv = */ 1,
/* .HALConfig.nPostDiv = */ 1,
/* .HALConfig.nL = */ 54, // change here
/* .HALConfig.nM = */ 0, // change here
/* .HALConfig.nN = */ 1, // change here },
/* .nConfigMask = */ CLOCK_CONFIG_PLL_FSM_MODE_ENABLE,
/* .nFreqHz = */ 1036800 * 1000, // // change here
/* .eVRegLevel = */ CLOCK_VREG_LEVEL_LOW, },
const ClockMuxConfigType BIMCClockConfig[] = { { 9600000,
{ HAL_CLK_SOURCE_XO, 1, 1, 1, 1 }, CLOCK_VREG_LEVEL_LOW }, { 50000000,
{ HAL_CLK_SOURCE_GPLL0, 16, 1, 1, 1 }, CLOCK_VREG_LEVEL_LOW }, { 100000000,
{ HAL_CLK_SOURCE_GPLL0, 8, 1, 1, 1 }, CLOCK_VREG_LEVEL_LOW }, { 200000000,
{ HAL_CLK_SOURCE_GPLL0, 4, 1, 1, 1 }, CLOCK_VREG_LEVEL_LOW }, { 400000000,
{ HAL_CLK_SOURCE_GPLL0, 2, 1, 1, 1 }, CLOCK_VREG_LEVEL_NOMINAL },
- { 533000000, { HAL_CLK_SOURCE_GPLL3, 2, 1, 1, 1 },
DDR Workflow and Debugging Guide DDR issues debugging
80-P7202-3 A Confidential and Proprietary – Qualcomm Technologies, Inc. 35
MAY CONTAIN U.S. AND INTERNATIONAL EXPORT CONTROLLED INFORMATION
CLOCK_VREG_LEVEL_HIGH },
+ { 518400000, { HAL_CLK_SOURCE_GPLL3, 2, 1, 1, 1 },
CLOCK_VREG_LEVEL_HIGH },
{ 0 }
";i:1;N;i:2;N;}i:2;i:88;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2222;}i:8;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2222;}}