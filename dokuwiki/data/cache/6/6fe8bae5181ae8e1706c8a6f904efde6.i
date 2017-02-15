a:23:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"ALOGX 打印函数问题";i:1;i:3;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"打印函数变更名称，但其实现与原来还是一样";}i:2;i:35;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:95;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:95;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"最简单方式:";}i:2;i:97;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:119;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
system\core\include\cutils 路径下新定义一个 log_legacy.h
";i:1;N;i:2;N;}i:2;i:119;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:119;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"实现如下：";}i:2;i:195;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:216;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:429:"
#ifndef __LOG_LEGACY_H__
#define __LOG_LEGACY_H__

#define LOGV ALOGV
#define LOGD ALOGD
#define LOGI ALOGI
#define LOGW ALOGW
#define LOGE ALOGE

#define LOGV_IF ALOGV_IF
#define LOGD_IF ALOGD_IF
#define LOGI_IF ALOGI_IF
#define LOGW_IF ALOGW_IF
#define LOGE_IF ALOGE_IF

#define IF_LOGV IF_ALOGV
#define IF_LOGD IF_ALOGD
#define IF_LOGI IF_ALOGI
#define IF_LOGW IF_ALOGW
#define IF_LOGE IF_ALOGE

#endif /* __LOG_LEGACY_H__*/
";i:1;N;i:2;N;}i:2;i:216;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:216;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"然后在 log.h 中最后引用一下即可";}i:2;i:654;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:703;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:25:"
#include "log_legacy.h"
";i:1;N;i:2;N;}i:2;i:703;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:703;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"其他的地方都不用变更";}i:2;i:737;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:767;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:767;}i:22;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:767;}}