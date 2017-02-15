a:106:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:136:"本文以系统中已经有的LightsService为例，逐步讲解在系统中搭建系统服务的过程。有几个前提需要说明：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:137;}i:4;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:137;}i:5;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:137;}i:6;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:137;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:242:" 由于系统内部就有LightsService这个类（在原生的代码中，它并不是一个真正的服务，只是一个普通类），所以我们无需再建立此类，并且可以根据此类的内容确定需要提供的服务内容。";}i:2;i:141;}i:8;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:383;}i:9;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:383;}i:10;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:383;}i:11;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:383;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:" 此处LightsService中需要提供的服务主要是将Light（内部类）的一些操作提供出去";}i:2;i:387;}i:13;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:490;}i:14;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:490;}i:15;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:490;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"编写aidl";i:1;i:1;i:2;i:491;}i:2;i:491;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:491;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:491;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:191:"所有远程服务的开始都是从编写aidl开始，新建一个aidl的了文件LightsManager.aidl，放在framework/base/core/java/android/app目录下。文件里的内容主要如下：";}i:2;i:514;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:711;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:199:"
interface ILightsManager {
    void setLight(int light);
    void setColor(int color);
    void setFlashing(int color, int mode, int onMS, int offMS);
    void turnOff();
    void stopFlashing();
}
";i:1;s:4:"java";i:2;N;}i:2;i:711;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:711;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"文件里的内容根据LightsService需要提供的服务内容确定。";}i:2;i:924;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:997;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:997;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:172:"如果在一般的程序中编写自己的aidl文件后，你需要使用google提供的aidl工具编译生成对应的java文件，然后将java文件加入到项目中。";}i:2;i:999;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1171;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1171;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:318:"但是现在我们只需要添加aidl文件，而不用手动生成，因为在系统编译的过程中会自动根据aidl生成对应的java文件。不过这样的前提是，我们需要告诉编译器我们添加了这个文件。我们找到framework/base下的Android.mk文件，并向里面加入下面这行：";}i:2;i:1173;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1497;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:45:"
core/java/android/app/ILightsManager.aidl \
";i:1;s:4:"java";i:2;N;}i:2;i:1497;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1497;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:198:"生成以后的java文件为ILightsManager.java。因为新添的文件会生成新的api，所以需要更新frameworks/base/api/current.txt。否则在编译的时候会中断，并提示更新。";}i:2;i:1556;}i:34;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1754;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"也可以直接运行";}i:2;i:1757;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1783;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15:"make update-api";i:1;s:5:"shell";i:2;N;}i:2;i:1783;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1783;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"自动更新此文件，检查确认正确后，跟代码一起提交即可。";}i:2;i:1812;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1890;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1890;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"关于ILightsManager有几个重要的描述：";}i:2;i:1892;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1939;}i:44;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1939;}i:45;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1939;}i:46;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1939;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:" ILightsManager是一个接口类，并且继承语android.os.IInterface";}i:2;i:1943;}i:48;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2015;}i:49;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2015;}i:50;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2015;}i:51;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2015;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:136:" ILightsManager里面会有一个名叫Stub的内部实现类，该类继承android.os.Binder，后面LightsService将继承于这个类";}i:2;i:2019;}i:53;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2155;}i:54;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2155;}i:55;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2155;}i:56;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2155;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:148:" 同时里面还会有一个私有内部实现类Proxy，这个类将作为LightsService的代理在Stub类的asInterface中返回给远程客户端";}i:2;i:2159;}i:58;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2307;}i:59;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2307;}i:60;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2307;}i:61;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2308;}i:62;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"改写LightsService（服务端）";i:1;i:1;i:2;i:2308;}i:2;i:2308;}i:63;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2308;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2308;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:208:"首先我们要让LightsService继承于ILightsManager.Stub，作为远程服务端。其次我们需要添加一个Light的内部变量，方便直接操作。其次需要将对应的方法都实现一遍：";}i:2;i:2355;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2569;}i:67;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:712:"
    public void setColor(int color) throws RemoteException {
        if (mLight != null) {
            mLight.setColor(color);
        }
    }
    public void setFlashing(int color, int mode, int on, int off)
            throws RemoteException {
        if (mLight != null) {
            mLight.setFlashing(color, mode, on, off);
        }
    }
    public void setLight(int light) throws RemoteException {
        mLight = getLight(light);
    }
    public void stopFlashing() throws RemoteException {
        if (mLight != null) {
            mLight.stopFlashing();
        }
    }
    public void turnOff() throws RemoteException {
        if (mLight != null) {
            mLight.turnOff();
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:2569;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2569;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:181:"LightsService实现好以后，还需要将其注册到ServiceManager中，客户端才可以获取到该服务。在SystemServer文件中LightsService初始化后面添加一行。";}i:2;i:3295;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3482;}i:71;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
ServiceManager.addService(Context.LIGHTS_SERVICE, lights);
";i:1;N;i:2;N;}i:2;i:3482;}i:72;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3552;}i:73;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:50:"添加LightsManager（客户端/服务端代理）";i:1;i:1;i:2;i:3552;}i:2;i:3552;}i:74;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3552;}i:75;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3552;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:139:"在远程服务段搭建好了以后，我们需要搭建客户端LightsManager，在core/java/android/app建立该文件。内容如下：";}i:2;i:3615;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3760;}i:78;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2402:"
package android.app;

import android.content.Intent;
import android.os.RemoteException;
import android.util.Log;

public class LightsManager {

    private static final String TAG = "LightsManager";
    public static final int LIGHT_ID_BACKLIGHT = 0;
    public static final int LIGHT_ID_KEYBOARD = 1;
    public static final int LIGHT_ID_BUTTONS = 2;
    public static final int LIGHT_ID_BATTERY = 3;
    public static final int LIGHT_ID_NOTIFICATIONS = 4;
    public static final int LIGHT_ID_ATTENTION = 5;
    public static final int LIGHT_ID_BLUETOOTH = 6;
    public static final int LIGHT_ID_WIFI = 7;
    public static final int LIGHT_ID_COUNT = 8;

    public static final int LIGHT_FLASH_NONE = 0;
    public static final int LIGHT_FLASH_TIMED = 1;
    public static final int LIGHT_FLASH_HARDWARE = 2;

    private final ILightsManager mService;

    /**
     * package private on purpose
     */
    public LightsManager(ILightsManager service) {
        mService = service;
    }
    /**
     * Set the light by light id
     * eg:LIGHT_ID_BATTERY/LIGHT_ID_NOTIFICATIONS is leds light
     * @param light
     */
    public void setLight(int light) {
        try {
            mService.setLight(light);
        } catch (RemoteException ex) {
        }
    }
    /**
     * Set the light color. The Color is GRB by 16 digits.
     * eg: 0xFF0000 is red.
     * @param color
     */
    public void setColor(int color){
        try {
            mService.setColor(color);
        } catch (RemoteException ex) {
        }
    }
    /**
     *
     * @param color The light color same as setColor
     * @param mode  The flash mode. LIGHT_FLASH_NONE,LIGHT_FLASH_TIMED or LIGHT_FLASH_HARDWARE
     * @param onMS  The flash time. It's millisecond. eg: 200
     * @param offMS The flash time interval. It's millisecond. eg: 200
     */
    public void setFlashing(int color, int mode, int onMS, int offMS){
        try {
            mService.setFlashing(color, mode, onMS, offMS);
        } catch (RemoteException ex) {
        }
    }
    /**
     * Turn off the light
     */
    public void turnOff(){
        try {
            mService.turnOff();
        } catch (RemoteException ex) {
        }
    }
    /**
     * Stop the playing flashing
     */
    public void stopFlashing(){
        try {
            mService.stopFlashing();
        } catch (RemoteException ex) {
        }
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:3760;}i:79;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6176;}i:80;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"建立连接";i:1;i:1;i:2;i:6176;}i:2;i:6176;}i:81;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6176;}i:82;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6176;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:188:"我们常见的获取系统的方法是通过上下文调用getSystemService()获取相应的服务。该方法的实现在ContextImpl中，我们需要将一下代码加入静态块中。";}i:2;i:6201;}i:84;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6395;}i:85;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:272:"
registerService(LIGHTS_SERVICE, new StaticServiceFetcher() {
    public Object createStaticService() {
    IBinder b = ServiceManager.getService(LIGHTS_SERVICE);
    ILightsManager service = ILightsManager.Stub.asInterface(b);
    return new LightsManager(service);
}});
";i:1;N;i:2;N;}i:2;i:6395;}i:86;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6395;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:234:"这里将已经与远程服务端建立好连接的客户端的实例注册在ContextImpl的一个HashMap中，后面getSystemService中将从该HashMap取出客户端的实例返回。
到这里为止，我们的服务就搭建好了";}i:2;i:6676;}i:88;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6911;}i:89;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6911;}i:90;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"其它注意事项";i:1;i:1;i:2;i:6911;}i:2;i:6911;}i:91;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6911;}i:92;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6941;}i:93;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6941;}i:94;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6941;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:248:" 普通列表项目如果我们的服务需要在其他某些项目启动好以后再执行一些操作，可以在LightService中添加systemReady（）方法，让后在所有其他项目都准备好以后在调用该服务的systemReady方法。";}i:2;i:6945;}i:96;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7193;}i:97;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7193;}i:98;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:7193;}i:99;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:7193;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:" 新添加的服务的初始化尽量放在别的服务的启动后面";}i:2;i:7197;}i:101;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:7267;}i:102;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:7267;}i:103;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:7267;}i:104;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7267;}i:105;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7267;}}