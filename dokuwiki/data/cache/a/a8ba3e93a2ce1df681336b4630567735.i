a:46:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1;}i:3;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5;}i:5;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:6;}i:6;a:3:{i:0;s:9:"emaillink";i:1;a:2:{i:0;s:15:"shu.yin@sim.com";i:1;s:6:"尹姝";}i:2;i:8;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" 2013/12/09";}i:2;i:34;}i:8;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:45;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:47;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:48;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"打开Android C++文件中的LOG";i:1;i:1;i:2;i:48;}i:2;i:48;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:48;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:48;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"在C++文件中，打开LOG需要加入如下代码：";}i:2;i:95;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:155;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
#define LOG_TAG "AndroidRuntime"
#include <utils/Log.h>
";i:1;N;i:2;N;}i:2;i:155;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:155;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"默认情况下ALOGE是打开的。";}i:2;i:222;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:257;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:257;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"可以一次打开ALOGV，ALOGI，ALOGD，也可以分别打开：";}i:2;i:259;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:325;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:159:"
#undef NDEBUG       //打开ALOGV/ALOGI/ALOGD
#define LOG_NDEBUG   0  //打开ALOGV
#define LOG_NIDEBUG  0  //打开ALOGI
#define LOG_NDDEBUG 0 //打开ALOGD
";i:1;N;i:2;N;}i:2;i:332;}i:24;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:501;}i:25;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"举例";i:1;i:2;i:2;i:501;}i:2;i:501;}i:26;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:501;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:501;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"举例，如果要看AndroidRuntime的ALOGI和ALOGD，可以有这样2种写法：";}i:2;i:521;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:603;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:605;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"方法一";i:1;i:3;i:2;i:605;}i:2;i:605;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:605;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:605;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"NDEBUG-LOG_NDEBUG=LOG_NIDEBUG +LOG_NIDEBUG";}i:2;i:625;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:667;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:92:"
#define LOG_TAG "AndroidRuntime"
#undef NDEBUG
#define LOG_NDEBUG 1
#include <utils/Log.h>
";i:1;N;i:2;N;}i:2;i:674;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:776;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"方法二";i:1;i:3;i:2;i:776;}i:2;i:776;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:776;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:776;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"LOG_NIDEBUG +LOG_NIDEBUG";}i:2;i:796;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:820;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:101:"
#define LOG_TAG "AndroidRuntime"
#define LOG_NIDEBUG 0
#define LOG_NDDEBUG 0
#include <utils/Log.h>
";i:1;N;i:2;N;}i:2;i:827;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:936;}i:45;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:936;}}