a:54:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Modem";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"搭建环境";i:1;i:2;i:2;i:19;}i:2;i:19;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:19;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:7;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:37:"platform:892x:modem编译环境安装";i:1;s:24:"Modem 编译环境安装";}i:2;i:43;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:109;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:111;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"设置环境变量";i:1;i:2;i:2;i:111;}i:2;i:111;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:111;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:808:"  @echo off
  REM ======================================================
  rem Sets path for RVDS210, GNU and PERL
  
  set ROOT_DRIVE=C:
  set APPS_DIR=Apps
  set APPS_PATH=%ROOT_DRIVE%\%APPS_DIR%
  set UTILROOT=%ROOT_DRIVE%
  set GNUPATH=%UTILROOT%\cygwin\bin
  set CRMPERL=C:\Perl\bin
  set PERLPATH=C:\Perl\bin
  set PYTHON_PATH=C:\Python26
  set ARMTOOLS=ARMCT501
  set ARMROOT=%APPS_PATH%\ARMCT5.01\94
  set ARMCC5BIN=%ARMROOT%\bin
  set ARMCC5INC=%ARMROOT%\include
  set ARMCC5LIB=%ARMROOT%\lib
  set ARMLMD_LICENSE_FILE=%ARMROOT%\Licenses\license.dat
  
  set HEXAGON_ROOT=C:\Qualcomm\HEXAGON_Tools
  
  rem
  rem Path for RVCT, GNU, Perl tools
  rem
  set path=%PERLPATH%;%CRMPERL%;%PYTHON_PATH%;%GNUPATH%;%ARMCC5BIN%;%UTILROOT%;%path%
  
  REM ======================================================";}i:2;i:139;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1004;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Building MPSS";i:1;i:2;i:2;i:1004;}i:2;i:1004;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1004;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:50:"  cd modem_proc\build\ms
  build.cmd 8926.gen.prod";}i:2;i:1027;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1084;}i:18;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Building boot loaders";i:1;i:2;i:2;i:1084;}i:2;i:1084;}i:19;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1084;}i:20;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:74:"  cd boot_images\build\ms
  build.cmd TARGET_FAMILY=8x26 BUILD_ID=FAAAANAZ";}i:2;i:1115;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1196;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Building TrustZone images";i:1;i:2;i:2;i:1196;}i:2;i:1196;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1196;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:61:"  cd trustzone_images\build\ms
  build.cmd CHIPSET=msm8x26 tz";}i:2;i:1231;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1299;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Building RPM";i:1;i:2;i:2;i:1299;}i:2;i:1299;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1299;}i:28;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:36:"  cd rpm_proc\build
  build_8x26.bat";}i:2;i:1321;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1364;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Building ADSP";i:1;i:2;i:2;i:1364;}i:2;i:1364;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1364;}i:32;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:133:"  cd adsp_proc\build
  python build.py
  可能最终会报错，但只要生成了binary包即可， adsp_proc\obj\qdsp6v5_ReleaseG\";}i:2;i:1387;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1529;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Building WCNSS";i:1;i:2;i:2;i:1529;}i:2;i:1529;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1529;}i:36;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:108:"  无源码所以不需要编译，
  执行 update_common_info.py 将镜像直接打包进Non-HLOS即可。";}i:2;i:1553;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1669;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Updating NON-HLOS.bin";i:1;i:2;i:2;i:1669;}i:2;i:1669;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1669;}i:40;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:51:"  cd common\build
  python update_common_info.py
  ";}i:2;i:1700;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1759;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:2:"AP";i:1;i:1;i:2;i:1759;}i:2;i:1759;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1759;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1773;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"D508";i:1;i:2;i:2;i:1773;}i:2;i:1773;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1773;}i:47;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:59:" source build/envsetup.sh
 choosecombo 1 d508 eng
 make -j4";}i:2;i:1789;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1857;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"高通样机";i:1;i:2;i:2;i:1857;}i:2;i:1857;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1857;}i:51;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:71:"  source build/envsetup.sh
  choosecombo 1 msm8226 eng
  make -j4
  
  ";}i:2;i:1882;}i:52;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1965;}i:53;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1965;}}