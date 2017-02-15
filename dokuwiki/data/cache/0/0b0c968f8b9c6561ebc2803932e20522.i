a:24:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"1.安装MTK蓝牙demo方法";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:513:" blink ---> /system/bin/blink  777                //BT协议栈主程序,可命令行运行
 blink_config.ini ----> /system/blink_config.ini  //AT指令,内带说明
 blink_ring.mp3 ----> /system/blink_ring.mp3      //来电铃声问题,可修改.只要名称和路径一样即可.删除不影响蓝牙使用.
 libwapm.so ----> /system/lib/libwapm.so 644      //blink 依赖库
 libblinkdriver.so ----> /system/lib/libwapm.so 644  //blink 依赖库
 adb install BTDemo.apk                           //安装apk 
 ";}i:2;i:28;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"2. 先运行blink,再运行apk";}i:2;i:557;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:587;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:587;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"3.常用命令";}i:2;i:589;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:603;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:147:" adb shell "setenforce 0"          //打开一些权限
 adb shell "blink /dev/ttyMT2"     //运行blink
 adb logcat -s blink               //log
 ";}i:2;i:603;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:603;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"4.写一个测试小工具";}i:2;i:760;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:786;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:786;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"添加main.c";}i:2;i:788;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:806;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1894:"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <android/log.h>
#include "utils/log.h"
#include <termios.h>
#include <time.h>
#include <unistd.h>
#include <sys/time.h>

int main()
{
	char buf[50];
	int rc;
	int i=0;
	int file_ptr;
	struct termios c_opt;	
	fd_set readfd;
	struct timeval timeout;
	char sendbuf[7]={0x04,0xE4,0x04,0x00,0x00,0x00,0x00};
	char wakebuf = 0x00;
	char startsession[6] = {0x04,0xE4,0x04,0x00,0xFF,0x14};

	file_ptr = open("/dev/ttyMT2", O_RDWR | O_NOCTTY | O_NDELAY | O_TRUNC);
	if (-1 == file_ptr) {
		__android_log_print(4, LOG_TAG, "Could not open uart port");
		return(-1);
	}
	
	if (tcflush(file_ptr, TCIOFLUSH) <0) {
		__android_log_print(4, LOG_TAG, "Could not flush uart port");
		return(-1);
	}
	
	fcntl(file_ptr, F_SETFL, 0);

	ioctl(file_ptr, TCGETS, &c_opt);

	c_opt.c_cc[VTIME]    = 0;  
	c_opt.c_cc[VMIN]     = 0; 

	c_opt.c_cflag &= ~(CSIZE | CRTSCTS);
        c_opt.c_cflag |= (CS8 | CLOCAL | CREAD);
	c_opt.c_iflag = IGNPAR;
        c_opt.c_oflag = 0;
	c_opt.c_lflag = 0;	
	
	cfsetospeed(&c_opt, B9600);
	cfsetispeed(&c_opt, B9600);
	
	ioctl(file_ptr, TCSETS, &c_opt);

	/*rc = write(file_ptr, buf, 3);
	__android_log_print(4, LOG_TAG, "buf = %x", buf[0]);
	LOGE("rc===========%d\n",rc);*/
	while(1)
	{
		//write(file_ptr,&wakebuf,1);
		memset(buf,0,50);
		usleep(60*1000);
		//write(file_ptr,startsession,7);
		timeout.tv_sec = 1;
		timeout.tv_usec = 0;
		//rc = select(file_ptr+1,&readfd,NULL,NULL,NULL);
		rc = 1;
		if(rc == -1)
		{
			LOGE("select error\n");
		}
		else if(rc)
		{
			LOGE("can read now\n");
			//if(FD_ISSET(file_ptr,&readfd))
			//{
				rc = read(file_ptr,buf,50);
				//for(i = 0; i < rc;i++)
				LOGE("----%s----\n",buf);
			//}

		}
		else if(rc==0)
		{
			LOGE("select time out\n");
		}
		sleep(3);
	}

	close(file_ptr);
	__android_log_print(4, LOG_TAG, "irdaWrite end");
	return 0;
}
";i:1;N;i:2;N;}i:2;i:806;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:806;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"添加Android.mk";}i:2;i:2712;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2734;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:286:"
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= main.c

LOCAL_MODULE:= zzz
LOCAL_MODULE_TAGS := optional eng
#LOCAL_C_INCLUDES :=

#LOCAL_STATIC_LIBRARIES :=

#LOCAL_SHARED_LIBRARIES := libcrypto
LOCAL_MODULE_PATH = $(TARGET_OUT)/bin
include $(BUILD_EXECUTABLE)
";i:1;N;i:2;N;}i:2;i:2734;}i:23;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2734;}}