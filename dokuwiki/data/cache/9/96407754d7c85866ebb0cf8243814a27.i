a:43:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5;}i:5;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:6;}i:6;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:23:"liangjiong.zhou@sim.com";i:1;s:15:"liangjiong.zhou";}i:2;i:8;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:" 2014/04/02 03:34";}i:2;i:51;}i:8;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:68;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:70;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"打开Android C/C++文件中的LOG";i:1;i:1;i:2;i:72;}i:2;i:72;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:72;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:72;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"在Android的C/C++文件中可以用以下的方法来打开关闭不同级别的log";}i:2;i:122;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:206;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:206;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"把要打开的log对应的宏加到想要看log的cpp文件里就可以。";}i:2;i:208;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:289;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:159:"
#undef  NDEBUG          //打开LOGV/LOGI/LOGD
#define LOG_NDEBUG   0  //打开LOGV
#define LOG_NIDEBUG  0  //打开LOGI
#define LOG_NDDEBUG  0  //打开LOGD
";i:1;s:1:"c";i:2;N;}i:2;i:289;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:289;}i:20;a:3:{i:0;s:6:"smiley";i:1;a:1:{i:0;s:3:"8-O";}i:2;i:460;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:463;}i:22;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:1;i:1;a:2:{i:0;s:3:"red";i:1;s:0:"";}}i:2;i:1;i:3;s:11:"<color red>";}i:2;i:464;}i:23;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:3;i:1;s:82:"注意： 上面的定义要放在  #include <utils/Log.h>  这个include之前。";}i:2;i:3;i:3;s:82:"注意： 上面的定义要放在  #include <utils/Log.h>  这个include之前。";}i:2;i:475;}i:24;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:5:"color";i:1;a:2:{i:0;i:4;i:1;s:0:"";}i:2;i:4;i:3;s:8:"</color>";}i:2;i:557;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:565;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:565;}i:27;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:567;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"
具体这些宏的定义在log.h文件里     ";}i:2;i:569;}i:29;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:616;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"system/core/include/cutils/log.h";}i:2;i:618;}i:31;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:650;}i:32;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:652;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:654;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:342:"
 49 /*
 50  * Normally we strip ALOGV (VERBOSE messages) from release builds.
 51  * You can modify this (for example with "#define LOG_NDEBUG 0"
 52  * at the top of your source file) to change that behavior.
 53  */
 54 #ifndef LOG_NDEBUG
 55 #ifdef NDEBUG
 56 #define LOG_NDEBUG 1
 57 #else
 58 #define LOG_NDEBUG 0
 59 #endif
 60 #endif
";i:1;s:1:"c";i:2;N;}i:2;i:662;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:662;}i:36;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1016;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"例 ALOGV:";}i:2;i:1018;}i:38;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1028;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1030;}i:40;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:272:"
 73 /*
 74  * Simplified macro to send a verbose log message using the current LOG_TAG.
 75  */
 76 #ifndef ALOGV
 77 #if LOG_NDEBUG
 78 #define ALOGV(...)   ((void)0)
 79 #else
 80 #define ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
 81 #endif
 82 #endif
";i:1;s:1:"c";i:2;N;}i:2;i:1037;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1321;}i:42;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1321;}}