a:41:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"搭建native service";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:134:"Native Service ：又称为 System Service ，是实现在 Runtime 层里的 Server 。搭建Native Service需要注意以下几点：";}i:2;i:36;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:177;}i:6;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:756:"
&nbsp;&nbsp;（ 1 ）核心服务通常在独立的进程 (Process) 里执行。<BR>

&nbsp;&nbsp;（ 2 ）必须提供 IBinder 接口，让应用程序可以进行跨进程的绑定 (Binding) 和呼叫。<BR>

&nbsp;&nbsp;（ 3 ）因为共享，所以必须确保多线裎安全 (Thread-safe) 。<BR>

&nbsp;&nbsp;（ 4 ）以 C++ 类别定义，诞生其对象，透过 SM 之协助，将该对象参考值传给 IServiceManager::addService() 函数，就加入到 Binder Driver 里了。<BR>

&nbsp;&nbsp;（ 5 ）应用程序可透过 SM 之协助而远距绑定该核心服务，此时 SM 会回传 IBinder 接口给应用程序。<BR>

&nbsp;&nbsp;（ 6 ）应用程序可透过 IBinder::transact() 函数来与核心服务互传数据。 <BR><BR>
";}i:2;i:177;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:177;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"下面通过一个例子来详细描述Native Service的搭建";}i:2;i:943;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1006;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1006;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"一、接口实现";i:1;i:3;i:2;i:1006;}i:2;i:1006;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1006;}i:13;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:228:"
&nbsp;&nbsp;在源码external目录下新建目录android-native-service-demo，在该目录下新建client，common，service目录，在common中编写native service接口类<BR>
&nbsp;&nbsp;头文件IDataSourceService.h<BR>
";}i:2;i:1041;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:783:"
#include <utils/RefBase.h>
#include <binder/IInterface.h>
#include <binder/Parcel.h>
#include "IPluginControler.h"

using namespace android;
using android::sp;

enum {
    IS_PLUGIN_ENABLE = IBinder::FIRST_CALL_TRANSACTION,    //枚举表示接口类提供的功能
    SET_PLUGIN_ENABLE
};

class IDataSourceService : public IInterface     //继承IInterface
{
public:
    DECLARE_META_INTERFACE(DataSourceService);   //宏定义，完成IBinder转化成IInterface，与宏IMPLEMENT_META_INTERFACE是一对

    virtual bool isPluginEnable(void) = 0;
    virtual void setPluginEnable(bool enable) = 0;
};

class BnDataSourceService : public BnInterface<IDataSourceService>
{
    virtual status_t onTransact(uint32_t code, const Parcel& data, Parcel* reply, uint32_t flags = 0);
};
";i:1;s:1:"c";i:2;N;}i:2;i:1282;}i:15;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:40:"
&nbsp;&nbsp;IDataSourceService.cpp<BR>
";}i:2;i:2082;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2164:"
#include "IDataSourceService.h"

using namespace android;

class BpDataSourceService : public BpInterface<IDataSourceService>           //继承IDataSourceService
{
public:
    BpDataSourceService(const sp<IBinder>& impl) : BpInterface<IDataSourceService>(impl){};

    bool isPluginEnable()
    {
        Parcel data, reply;                                                 //Parcel类是专门用于binder通信的数据传送，提供了多种类型数据的封装
        data.writeInterfaceToken(IDataSourceService::getInterfaceDescriptor());      //写入接口描述，用于接口验证，避免调用错误
        remote()->transact(IS_PLUGIN_ENABLE, data, &reply);                          //调用transact函数将data发送给binder，返回数据封装在reply中
        bool ret = reply.readInt32();
        return ret;
    };
    void setPluginEnable(bool enable)
    {
        printf("[BpDataSourceService] setPluginEnable\n");
        Parcel data, reply;
        data.writeInterfaceToken(IDataSourceService::getInterfaceDescriptor());
        data.writeInt32(enable);
        remote()->transact(SET_PLUGIN_ENABLE, data, &reply);
    };
};

IMPLEMENT_META_INTERFACE(DataSourceService, "yancy.github.plugin.service");


status_t BnDataSourceService::onTransact(uint32_t code, const Parcel & data, Parcel * reply, uint32_t flags)
{
    switch(code)
    {
        case IS_PLUGIN_ENABLE:
        {
            CHECK_INTERFACE(IDataSourceService, data, reply);
            bool ret = isPluginEnable();
            reply->writeInt32(ret);
            return NO_ERROR;
        }
        case SET_PLUGIN_ENABLE:
        {
            printf("[BnDataSourceService] onTransact SET_PLUGIN_ENABLE\n");
            CHECK_INTERFACE(IDataSourceService, data, reply);                         //Parcel为先进先出存储，数据的写入顺序和读出顺序要一致
            bool enable =  data.readInt32();
            setPluginEnable(enable);                                                  //调用真正实现的函数
            return NO_ERROR;
        }
        default:
            return BBinder::onTransact(code, data, reply, flags);
    }
}

";i:1;s:1:"c";i:2;N;}i:2;i:2135;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4310;}i:18;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"二、服务实现";i:1;i:3;i:2;i:4310;}i:2;i:4310;}i:19;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4310;}i:20;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:118:"
&nbsp;&nbsp;在service目录中编写native service服务实现类<BR>
&nbsp;&nbsp;头文件IDataSourceService.h<BR>
";}i:2;i:4345;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:541:"
#include <binder/IServiceManager.h>
#include <binder/IPCThreadState.h>
#include <IPluginControler.h>
#include <IDataSourceService.h>

class DataSourceServiceImpl : public BnDataSourceService     //继承接口类中的BnDataSourceService，具体实现功能
{
public:
    bool isPluginEnable(void);
    void setPluginEnable(bool enable);

    static void instance()
    {
        defaultServiceManager()->addService(String16("DataPluginService"), new DataSourceServiceImpl());//将自身注册到ServiceManager供客户端绑定
    }

};
";i:1;s:1:"c";i:2;N;}i:2;i:4476;}i:22;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:40:"
&nbsp;&nbsp;IDataSourceService.cpp<BR>
";}i:2;i:5034;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1024:"
#define LOG_TAG "DataSourceServiceImpl"
#include <utils/Log.h>
#include "DataSourceService.h"

bool DataSourceServiceImpl::isPluginEnable()
{
    printf("DataSourceService isPluginEnable \n");

    printf("DataSourceService exec isPluginEnable \n");
    return this->isEnable;
}

void DataSourceServiceImpl::setPluginEnable(bool enable)
{
    printf("DataSourceService setPluginEnable \n");
    printf("DataSourceService exec setPluginEnable \n");
    mthis->isEnable=enable;
    printf("DataSourceService exec setPluginEnable over \n");
}


int main(int argc, char** argv)
{
    printf("DataSourceService start \n");                   
    DataSourceServiceImpl::instance();                      
    printf("DataSourceService add service \n");
    ProcessState::self()->startThreadPool();                //将自身启动
     printf("DataSourceService startThreadPool ok \n");
    IPCThreadState::self()->joinThreadPool();               //将自身加入线程池
    printf("DataSourceService end \n");
    return 0;
}
";i:1;s:1:"c";i:2;N;}i:2;i:5087;}i:24;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:28:"
&nbsp;&nbsp;Android.mk<BR>
";}i:2;i:6128;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:458:"
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
    ../common/IDataSourceService.cpp \                     //引入写好的接口类
    DataSourceService.cpp

LOCAL_C_INCLUDES := \
    external/android-native-service-demo/common

LOCAL_SHARED_LIBRARIES:= libcutils libutils libbinder      

LOCAL_MODULE := DataSourceService             

include $(BUILD_EXECUTABLE)        //生成可执行程序
";i:1;s:1:"c";i:2;N;}i:2;i:6169;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6638;}i:27;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"三、客户端实现";i:1;i:3;i:2;i:6638;}i:2;i:6638;}i:28;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6638;}i:29;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:111:"
&nbsp;&nbsp;在client目录中编写native service客户端实现类<BR>
&nbsp;&nbsp;DataSourceClient.cpp<BR>
";}i:2;i:6676;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1595:"
#include <binder/IServiceManager.h>
#include <IDataSourceService.h>

using namespace android;
using android::sp;

int main()
{
    sp<IBinder> binder = defaultServiceManager()->getService(String16("DataPluginService"));      //从defaultServiceManager得到服务的binder
    if(binder == NULL)
    {
        printf("Get service fail media.watermark\n");
        return 0;
    }

    sp<IDataSourceService> service = IDataSourceService::asInterface(binder);                   //将服务binder转化为接口类
    if(service == NULL)
    {
        printf("connect service fail media.watermark\n");
        return 0;
    }

    int input = -1;
    int result= -1;
    while(1)
    {
        printf("[1]Enable plugin; [2]Disable plugin; [3]Quit: ");
        scanf("%d", &input);

        switch(input)
        {
            case 1:
                printf("DataSourceClient enable plugin\n");                                      //客户端直接调用接口函数
                service->setPluginEnable(true);
                break;
            case 2:
                printf("DataSourceClient disable plugin\n");
                service->setPluginEnable(false);
                break;
           case 3:
                printf("DataSourceClient isPluginEnable\n");
                service->isPluginEnable(&result);
                printf("DataSourceClient isPluginEnable %d\n",result);
                break;
            case 4:
                printf("DataSourceClient exit \n");
                goto Exit;
        }
    } // while

Exit:
    printf("Client exit...\n");

    return 0;
}
";i:1;s:1:"c";i:2;N;}i:2;i:6800;}i:31;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:28:"
&nbsp;&nbsp;Android.mk<BR>
";}i:2;i:8412;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:422:"
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

#引入接口类
LOCAL_SRC_FILES := \
    ../common/IDataSourceService.cpp \
    DataSourceClient.cpp

LOCAL_C_INCLUDES := \
    external/android-native-service-demo/common

LOCAL_SHARED_LIBRARIES:= libcutils libutils libbinder

LOCAL_MODULE := DataSourceClient

include $(BUILD_EXECUTABLE)                        #生成可执行程序
";i:1;s:1:"c";i:2;N;}i:2;i:8453;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8886;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:47:"四、将native service添加为开机启动项";i:1;i:3;i:2;i:8886;}i:2;i:8886;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8886;}i:36;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:47:"
&nbsp;&nbsp;1.修改init.rc,添加service<BR>
";}i:2;i:8950;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:72:"
service DataSourceService /system/bin/DataSourceService
    class main
";i:1;s:1:"c";i:2;N;}i:2;i:9010;}i:38;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:164:"
&nbsp;&nbsp;2.添加linux安全策略，方法请参考<a href="http://172.21.1.23/dokuwiki/doku.php/android;sepolicy%E8%A7%84%E5%88%99">添加linux策略</a><BR>
";}i:2;i:9099;}i:39;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9270;}i:40;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:9270;}}