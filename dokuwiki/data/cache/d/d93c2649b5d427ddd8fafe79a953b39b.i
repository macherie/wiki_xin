a:32:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"术语";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:267:"
FSM: Finite State Machine
CC: Coulcomb Counter
FCC: Full Charge Capacity
OCV: Open Circuit Voltage
PMIC: Power Management IC
PC: Percentage Charge
RC: Remaining Charge
SOC: State of Charge
RUC: Remaining Usable Charge
UUC: Unusable Charge
OVP:OverVoltage Protection
";i:1;N;i:2;N;}i:2;i:23;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:300;}i:5;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"【转】基于power supply信息传递的uevent机制";i:1;i:2;i:2;i:300;}i:2;i:300;}i:6;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:300;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:300;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"blog.csdn.net/pillarbuaa/article/details/9062115";}i:2;i:365;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:419;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:9650:"
Linux uevent机制


Uevent是内核通知android有状态变化的一种方法，比如USB线插入、拔出，电池电量变化等等。其本质是内核发送（可以通过socket）一个字符串，应用层（android）接收并解释该字符串，获取相应信息。

一、Kernel侧：

 kernel 发送给battery_logging的uevent格式？
 power_supply_uevent@kernel/drivers/power/power_supply_sysfs.c 该函数添加发送的信息到uevent
 ret = add_uevent_var(env, "POWER_SUPPLY_NAME=%s", psy->name); //psy->name="battery"
 for (j = 0; j < psy->num_properties; j++) {
  attr = &power_supply_attrs[psy->properties[j]]; //得到对应的power supply attr,
  attrname = kstruprdup(attr->attr.name, GFP_KERNEL);//会把属性名字转成大写，比如“status”->"STATUS"
  ret = add_uevent_var(env, "POWER_SUPPLY_%s=%s", attrname, prop_buf); //增加该属性的信息到uevent buffer中
 }
 
 qpnp_charger_probe@kernel/drivers/power/qpnp-charger.c中会定义"battery"的properties = msm_batt_power_props
 static enum power_supply_property msm_batt_power_props[] = { //对应power_supply_attrs[]@kernel/drivers/power/power_supply_sysfs.c
  POWER_SUPPLY_PROP_CHARGING_ENABLED,       //表示这些属性是被battery　psy所需要的属性,具体如何得到可查看 
  POWER_SUPPLY_PROP_STATUS,   　　　//qpnp_batt_power_get_property　函数
  POWER_SUPPLY_PROP_CHARGE_TYPE,  
  POWER_SUPPLY_PROP_HEALTH,  
  POWER_SUPPLY_PROP_PRESENT,  
  POWER_SUPPLY_PROP_TECHNOLOGY,  
  POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
  POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
  POWER_SUPPLY_PROP_VOLTAGE_NOW,  
  POWER_SUPPLY_PROP_CAPACITY,  
  POWER_SUPPLY_PROP_CURRENT_NOW,  
  POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
  POWER_SUPPLY_PROP_TEMP,   
  POWER_SUPPLY_PROP_SYSTEM_TEMP_LEVEL,
 };
 
 static struct device_attribute power_supply_attrs[] = {
  /* Properties of type `int' */
  POWER_SUPPLY_ATTR(status),  //表示attr.name = "status"
  POWER_SUPPLY_ATTR(charge_type),
  ...
 }

UEVENT的发起在Kernel端，主要是通过函数

intkobject_uevent_env(struct kobject *kobj, enum kobject_action action,char *envp_ext[])

该函数的主要功能是根据参数组合一个字符串并发送。一个典型的字符串如下：

ACTION=change

DEVPATH=/devices/qpnp-bms-eab17000/power_supply/bms

SUBSYSTEM=power_supply

POWER_SUPPLY_NAME=bms

POWER_SUPPLY_PRESENT=1

POWER_SUPPLY_CAPACITY=42

POWER_SUPPLY_CURRENT_NOW=-426300

POWER_SUPPLY_CURRENT_MAX=6735829

POWER_SUPPLY_CHARGE_FULL_DESIGN=2350

SEQNUM=3488

 

ACTION=change

DEVPATH=/devices/qpnp-charger-eab16c00/power_supply/battery

SUBSYSTEM=power_supply

POWER_SUPPLY_NAME=battery

//和前面的msm_batt_power_props相对应

POWER_SUPPLY_CHARGING_ENABLED=1

POWER_SUPPLY_STATUS=Charging

POWER_SUPPLY_CHARGE_TYPE=Fast

POWER_SUPPLY_HEALTH=Good 

POWER_SUPPLY_PRESENT=1

POWER_SUPPLY_TECHNOLOGY=Li-ion

POWER_SUPPLY_VOLTAGE_MAX_DESIGN=4200000

POWER_SUPPLY_VOLTAGE_MIN_DESIGN=4200000

POWER_SUPPLY_VOLTAGE_NOW=3833115

POWER_SUPPLY_CAPACITY=42

POWER_SUPPLY_CURRENT_NOW=-395600

POWER_SUPPLY_CHARGE_FULL_DESIGN=2350

POWER_SUPPLY_TEMP=250

POWER_SUPPLY_SYSTEM_TEMP_LEVEL=0

SEQNUM=3489

分析下UEvent如何传递给user space?
 a. @kernel/drivers/power/qpnp-charger.c中只要有任何关于charger的变化，比如charger的各种irq handler
 b. @kernel/drivers/power/qpnp-bms.c中calculate_soc_from_voltage和calculate_state_of_charge
 c. @kernel/arch/arm/boot/dts/msm-pm8226.dtsi中有pm8226_bms的device定义，msm8226-cn3ii.dtsi中有pm8226_bms的定义补充
  其中没有　qcom,use-voltage-soc 的定义所以chip->use_voltage_soc=false, 也就是只用calculate_state_of_charge计算soc
  顺便chip->use_external_rsense=true,表示用外部的rsense.
 d. @kernel/driver/power/power_supply_core.c中的power_supply_changed会被以上内容调用
  schedule_work(&psy->changed_work);
 e. power_supply_changed_work@kernel/driver/power/power_supply_core.c
  kobject_uevent(&psy->dev->kobj, KOBJ_CHANGE); //action=KOBJ_CHANGE
 f. kobject_uevent_env@kernel/lib/kobject_uevent.c

下面看这个函数：

int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,char *envp_ext[])

{

struct kobj_uevent_env *env;

const char *action_string = kobject_actions[action];//获取object的动作

//蓝色为为方便看代码加入的

static const char *kobject_actions[] = {

[KOBJ_ADD] = "add",

[KOBJ_REMOVE] = "remove",

[KOBJ_CHANGE] = "change",

[KOBJ_MOVE] = "move",

[KOBJ_ONLINE] = "online",

[KOBJ_OFFLINE] = "offline",

};

//以上为kobject标准的动作，调用时需要传入相应的enum值

const char *devpath = NULL;

const char *subsystem;

struct kobject *top_kobj;

struct kset *kset;

const struct kset_uevent_ops *uevent_ops;

u64 seq;

int i = 0;

int retval = 0;

#ifdef CONFIG_NET

struct uevent_sock *ue_sk;

#endif



pr_debug("kobject: '%s' (%p): %s\n",

kobject_name(kobj), kobj, __func__);

=========================================================

这段代码用来查找该kobject所属于的kset，得到uevent_ops

top_kobj = kobj;

while (!top_kobj->kset && top_kobj->parent)

top_kobj = top_kobj->parent;



if (!top_kobj->kset) {

pr_debug("kobject: '%s' (%p): %s: attempted to send uevent "

"without kset!\n", kobject_name(kobj), kobj,

__func__);

return -EINVAL;

}



kset = top_kobj->kset;

uevent_ops = kset->uevent_ops;

=========================================================

if (kobj->uevent_suppress) {

pr_debug("kobject: '%s' (%p): %s: uevent_suppress "

"caused the event to drop!\n",

kobject_name(kobj), kobj, __func__);

return 0;

}

if (uevent_ops && uevent_ops->filter)

if (!uevent_ops->filter(kset, kobj)) {

pr_debug("kobject: '%s' (%p): %s: filter function "

"caused the event to drop!\n",

kobject_name(kobj), kobj, __func__);

return 0;

}



====================================================

获取subsystem信息,

if (uevent_ops && uevent_ops->name)

subsystem = uevent_ops->name(kset, kobj);

else

subsystem = kobject_name(&kset->kobj);

if (!subsystem) {

pr_debug("kobject: '%s' (%p): %s: unset subsystem caused the "

"event to drop!\n", kobject_name(kobj), kobj,

__func__);

return 0;

}

=========================================================

env = kzalloc(sizeof(struct kobj_uevent_env), GFP_KERNEL);

if (!env)

return -ENOMEM;



devpath = kobject_get_path(kobj, GFP_KERNEL);//获取kobject的设备路径,

if (!devpath) {

retval = -ENOENT;

goto exit;

}

//下面准备要传递的信息数据

retval = add_uevent_var(env, "ACTION=%s", action_string); //action_string="change"

if (retval)

goto exit;

retval = add_uevent_var(env, "DEVPATH=%s", devpath);//devpath="/devices/qpnp-charger-eab16c00/power_supply/battery"

if (retval)

goto exit;

retval = add_uevent_var(env, "SUBSYSTEM=%s", subsystem);//subsystem="power_supply"

if (retval)

goto exit;

//envp_ext[i]是传进来的参数，为该event时携带的一些自定义的信息,

if (envp_ext) {//对于power_supply_changed_work->kobject_uevent->kobject_uevent_env(kobj, action, NULL);所以envp_ext=NULL

for (i = 0; envp_ext[i]; i++) {

retval = add_uevent_var(env, "%s", envp_ext[i]);

if (retval)

goto exit;

}

}



if (uevent_ops && uevent_ops->uevent) {

retval = uevent_ops->uevent(kset, kobj, env);//会调用到power_supply_uevent@kernel/drivers/power/power_supply_sysfs.c,回到了前面的分析,

                                                                 //也就是会添加具体的power battery信息到uevent buffer中了

if (retval) {

pr_debug("kobject: '%s' (%p): %s: uevent() returned "

"%d\n", kobject_name(kobj), kobj,

__func__, retval);

goto exit;

}

}



if (action == KOBJ_ADD)

kobj->state_add_uevent_sent = 1;

else if (action == KOBJ_REMOVE)

kobj->state_remove_uevent_sent = 1;



//加入该event的序号

spin_lock(&sequence_lock);

seq = ++uevent_seqnum;

spin_unlock(&sequence_lock);

retval = add_uevent_var(env, "SEQNUM=%llu", (unsigned long long)seq); //用cat sys/kernel/uevent_seqnum 可以查看

if (retval)

goto exit;



#if defined(CONFIG_NET)

//下面通过网络socket将数据发送出去

mutex_lock(&uevent_sock_mutex);

list_for_each_entry(ue_sk, &uevent_sock_list, list) {//在函数uevent_net_init会初始化一个uevent_sock，也只有一个

struct sock *uevent_sock = ue_sk->sk;

struct sk_buff *skb;

size_t len;



len = strlen(action_string) + strlen(devpath) + 2;

skb = alloc_skb(len + env->buflen, GFP_KERNEL);//申请网络skb数据

if (skb) {

char *scratch;


//以下内容是发送内容打包

scratch = skb_put(skb, len);

sprintf(scratch, "%s@%s", action_string, devpath);

此时scratch中就增加了change@/devices/platform/msm-battery/power_supply/usb的

//组长网络skb数据结构

for (i = 0; i < env->envp_idx; i++) {

len = strlen(env->envp[i]) + 1;

scratch = skb_put(skb, len);

strcpy(scratch, env->envp[i]);

}



NETLINK_CB(skb).dst_group = 1;//下面开始发送数据

retval = netlink_broadcast_filtered(uevent_sock, skb,  //该函数很关键后面再具体分析

0, 1, GFP_KERNEL,

kobj_bcast_filter,

kobj);

if (retval == -ENOBUFS || retval == -ESRCH)

retval = 0;

} else

retval = -ENOMEM;

}

mutex_unlock(&uevent_sock_mutex);

#endif



if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {

char *argv [3];



argv [0] = uevent_helper;

argv [1] = (char *)subsystem;

argv [2] = NULL;

retval = add_uevent_var(env, "HOME=/");

if (retval)

goto exit;

retval = add_uevent_var(env,

"PATH=/sbin:/bin:/usr/sbin:/usr/bin");

if (retval)

goto exit;



retval = call_usermodehelper(argv[0], argv,

env->envp, UMH_WAIT_EXEC);

}



exit:

kfree(devpath);

kfree(env);

return retval;

}
";i:1;N;i:2;N;}i:2;i:419;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10081;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"基于Netlink的Uevent的具体实现";i:1;i:2;i:2;i:10081;}i:2;i:10081;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10081;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10081;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"参考 ";}i:2;i:10130;}i:16;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:78:"http://www.ibm.com/developerworks/cn/linux/l-netlink/?ca=dwcn-newsletter-linux";i:1;N;}i:2;i:10137;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10215;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10215;}i:19;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:45:"http://www.chinaunix.net/old_jh/4/822500.html";i:1;N;}i:2;i:10217;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:10262;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10268;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8152:"
1. Netlink 机制
Linux 内核模块的运行环境与传统进程间通信

在一台运行 Linux 的计算机中，CPU 在任何时候只会有如下四种状态：

【1】 在处理一个硬中断。

【2】 在处理一个软中断，如 softirq、tasklet 和 bh。

【3】 运行于内核态，但有进程上下文，即与一个进程相关。

【4】 运行一个用户态进程。

其中，【1】、【2】和【3】是运行于内核空间的，而【4】是在用户空间。其中除了【4】，其他状态只可以被在其之上的状态抢占。比如，软中断只可以被硬中断抢占。

Linux 内核模块是一段可以动态在内核装载和卸载的代码，装载进内核的代码便立即在内核中工作起来。Linux 内核代码的运行环境有三种：用户上下文环境、硬中断环境和软中断环境。但三种环境的局限性分两种，因为软中断环境只是硬中断环境的延续。比较如表【1】。


表【1】
内核态环境 	介绍 	局限性
用户上下文 	内核态代码的运行与一用户空间进程相关，如系统调用中代码的运行环境。 	不可直接将本地变量传递给用户态的内存区，因为内核态和用户态的内存映射机制不同。
硬中断和软中断环境 	硬中断或软中断过程中代码的运行环境，如 IP 数据报的接收代码的运行环境，网络设备的驱动程序等。 	不可直接向用户态内存区传递数据；
代码在运行过程中不可阻塞。

Linux 传统的进程间通信有很多，如各类管道、消息队列、内存共享、信号量等等。但它们都无法介于内核态与用户态使用，原因如表【2】。


表【2】
通信方法 	无法介于内核态与用户态的原因
管道（不包括命名管道） 	局限于父子进程间的通信。
消息队列 	在硬、软中断中无法无阻塞地接收数据。
信号量 	无法介于内核态和用户态使用。
内存共享 	需要信号量辅助，而信号量又无法使用。
套接字 	在硬、软中断中无法无阻塞地接收数据。

Linux内核态与用户态进程通信方法的提出与实现

 

运行在用户上下文环境中的代码是可以阻塞的，这样，便可以使用消息队列和 UNIX 域套接字来实现内核态与用户态的通信。但这些方法的数据传输效率较低，Linux 内核提供 copy_from_user()/copy_to_user() 函数来实现内核态与用户态数据的拷贝，但这两个函数会引发阻塞，所以不能用在硬、软中断中。一般将这两个特殊拷贝函数用在类似于系统调用一类的函数中，此类函数在使用中往往"穿梭"于内核态与用户态。此类方法的工作原理路如图【1】。


图【1】

其中相关的系统调用是需要用户自行编写并载入内核。 imp1.tar.gz是一个示例，内核模块注册了一组设置套接字选项的函数使得用户空间进程可以调用此组函数对内核态数据进行读写。源码包含三个文件，imp1.h 是通用头文件，定义了用户态和内核态都要用到的宏。imp1_k.c 是内核模块的源代码。imp1_u.c 是用户态进程的源代码。整个示例演示了由一个用户态进程向用户上下文环境发送一个字符串，内容为"a message from userspace\n"。然后再由用户上下文环境向用户态进程发送一个字符串，内容为"a message from kernel\n"。

 
硬、软中断环境

比起用户上下文环境，硬中断和软中断环境与用户态进程无丝毫关系，而且运行过程不能阻塞。

1 使用一般进程间通信的方法

我们无法直接使用传统的进程间通信的方法实现。但硬、软中断中也有一套同步机制--自旋锁（spinlock），可以通过自旋锁来实现中断环境与中断环境，中断环境与内核线程的同步，而内核线程是运行在有进程上下文环境中的，这样便可以在内核线程中使用套接字或消息队列来取得用户空间的数据，然后再将数据通过临界区传递给中断过程。基本思路如图【2】。


图【2】

因为中断过程不可能无休止地等待用户态进程发送数据，所以要通过一个内核线程来接收用户空间的数据，再通过临界区传给中断过程。中断过程向用户空间的数据发送必须是无阻塞的。这样的通信模型并不令人满意，因为内核线程是和其他用户态进程竞争CPU接收数据的，效率很低，这样中断过程便不能实时地接收来自用户空间的数据。
2 netlink 套接字

在 Linux 2.4 版以后版本的内核中，几乎全部的中断过程与用户态进程的通信都是使用 netlink 套接字实现的，同时还使用 netlink 实现了 ip queue 工具，但 ip queue 的使用有其局限性，不能自由地用于各种中断过程。内核的帮助文档和其他一些 Linux 相关文章都没有对 netlink 套接字在中断过程和用户空间通信的应用上作详细的说明，使得很多用户对此只有一个模糊的概念。

netlink 套接字的通信依据是一个对应于进程的标识，一般定为该进程的 ID。当通信的一端处于中断过程时，该标识为 0。当使用 netlink 套接字进行通信，通信的双方都是用户态进程，则使用方法类似于消息队列。但通信双方有一端是中断过程，使用方法则不同。netlink 套接字的最大特点是对中断过程的支持，它在内核空间接收用户空间数据时不再需要用户自行启动一个内核线程，而是通过另一个软中断调用用户事先指定的接收函数。工作原理如图【3】。


图【3】

很明显，这里使用了软中断而不是内核线程来接收数据，这样就可以保证数据接收的实时性。

当 netlink 套接字用于内核空间与用户空间的通信时，在用户空间的创建方法和一般套接字使用类似，但内核空间的创建方法则不同。图【4】是 netlink 套接字实现此类通信时创建的过程。


图【4】

 

 

 

二android侧


 

private finalUEventObserver mUEventObserver = new UEventObserver() {

@Override

public void onUEvent(UEventObserver.UEvent event) {

if (DEBUG) Slog.v(TAG, "USB UEVENT: " + event.toString());


String state = event.get("USB_STATE");

String accessory = event.get("ACCESSORY");


//Added for USB Develpment debug, more log for more debuging help

if(DEBUG) Log.w(TAG, "mUEventObserver: onUEvent: state = " + state);

//Added for USB Develpment debug, more log for more debuging help


if (state != null) {

mHandler.updateState(state);

} else if ("START".equals(accessory)) {

if (DEBUG) Slog.d(TAG, "got accessory start");

setCurrentFunction(UsbManager.USB_FUNCTION_ACCESSORY, false);

}

}

};


在类初始化时会调用下面的动作，启动监听动作。

mUEventObserver.startObserving(USB_STATE_MATCH);


最终会调用到UEventObserver的addObserver：

private ArrayList<Object> mObservers = new ArrayList<Object>();

public void addObserver(String match, UEventObserver observer) {

synchronized(mObservers) {

mObservers.add(match);

mObservers.add(observer);

}

}



private static final String USB_STATE_MATCH =

"DEVPATH=/devices/virtual/android_usb/android0";

该函数最终会将”DEVPATH=/devices/virtual/android_usb/android0”增加到匹配序列中，当kernel发送具有该字符串的数据时，就返回匹配成功，然后调用mUEventObserver 的onUEvent函数；



UeventObserver.java

private static class UEventThread extends Thread {

 

private ArrayList<Object> mObservers = new ArrayList<Object>();

 

UEventThread() {

super("UEventObserver");

}

 

public void run() {

native_setup();


byte[] buffer = new byte[1024];

int len;

while (true) {

len = next_event(buffer);

if (len > 0) {

String bufferStr = new String(buffer, 0, len); // easier to search a String

synchronized (mObservers) {

for (int i = 0; i < mObservers.size(); i += 2) {

if (bufferStr.indexOf((String)mObservers.get(i)) != -1) {

((UEventObserver)mObservers.get(i+1))

.onUEvent(new UEvent(bufferStr));

}
}
}
}
}
}
";i:1;N;i:2;N;}i:2;i:10268;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18434;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"Android 中电源状态切换";i:1;i:2;i:2;i:18434;}i:2;i:18434;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:18434;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18434;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"blog.csdn.net/pillarbuaa/article/details/9032205";}i:2;i:18474;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18528;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5380:"
在 Android 的上层是使用 goToSleep() 这个函数让系统进入休眠的。但是这个命令为什么会让 Android 进入 Suspend Mode。
 
以前在做其他系统的时候， 一般都要自己手工去控制 apm_bios 这个设备的，比如使用 ioctl() 调用 apm_bios。所有的系统其原理都是差不多的。只是 Android 加入了一个封装， 使程序员可以更简单的操作， 可以不理会底层是如何操作的， 现在解析一个 goToSleep() 是如何工作的。
 
PowerManagerService.java 是 framework 层负责管理 PowerManager 的。goToSleep 就是在这个函数中定义的:
 
goToSleep()->
   goToSleepLocked()->
      setPowerState()->
          setScreenStateLocked()->
             Power.setScreenState(on);  // android_os_Power.cpp
 
goToSleep() 在 PowerManagerService.java 中经过一系列的处理之后， 最终会进入 android_os_Power.cpp 文件中的 setScreenState() 这个函数中。
 
看一下 setScreenState() 的实现：
 
// android_os_Power.cpp
static int
setScreenState(JNIEnv *env, jobject clazz, jboolean on)
{
    return set_screen_state(on);
}
而 set_screen_state() 在 power.c 文件中实现：
int
set_screen_state(int on)
{
    QEMU_FALLBACK(set_screen_state(on));
    LOGI("*** set_screen_state %d", on);
    initialize_fds();
    //LOGI("go_to_sleep eventTime=%lld now=%lld g_error=%s\n", eventTime,
      //      systemTime(), strerror(g_error));
    if (g_error) return g_error;
    char buf[32];
    int len;
    if(on)
        len = sprintf(buf, on_state);
    else
        len = sprintf(buf, off_state);
    len = write(g_fds[REQUEST_STATE], buf, len);
    if(len < 0) {
        LOGE("Failed setting last user activity: g_error=%d\n", g_error);
    }
    return 0;
}
可以发现， 其最终是通过 write(g_fds[REQUEST_STATE], buf, len); 令系统进入休眠的。
 
通过分析这个文件的代码， g_fds[REQUEST_STATE] = open("/sys/power/state", O_RDWR);
 
on_state = "wake", off_state = "standby", 也就是写 standby 到 /sys/power/state 就可以令系统进行休眠了。
 
/sys/power/state 的实现代码可以看 $(Kernel)/kernel/power/main.c 这个文件是怎么实现的。
 
所以，当文件系统起来的时候可以 echo standby > /sys/power/state 令系统进入休眠

 

 

 

1， Android中支持的电源状态：

        PM_SUSPEND_ON -- 设备处于全电源状态，也就是正常工作状态；

        PM_SUSPEND_MEM -- suspend to memory，设备进入睡眠状态，但所有的数据还保存在内存中，只有某些外部中断才可以唤醒设备。

       PM_SUSPEND_STANDBY  ----- 在大部分的Android设备中均不支持。

 

2， Early Suspend / Late Resume

         在Android中，增加了系统休眠的层次，把休眠划分为深度睡眠（sleep）和浅度睡眠（idle）。  

         因此当系统往 /sys/power/state 节点写入 mem （如在命令行 写入： echo mem > /sys/power/state） 将会使系统进入睡眠。参考HAL中：hardware/libhardware_legacy/power/power.c  ：  set_screen_state   ------> write (on / mem )   to  /sys/power/state

         浅度睡眠 仅仅是关掉背光，fb， sensor，触摸屏等在关屏状态下不需要使用的设备，而整个CPU和大部分外设还是正常工作的。

                                                   

            深度睡眠sleep 与 浅度睡眠 idle 之间切换的过程如上所示。

 

3，  Android的 Wake Lock

          Android系统提供了两种类型的锁：

                   WAKE_LOCK_SUSPEND  --  阻止系统进入suspend状态；

                   WAKE_LOCK_IDLE  --  阻止系统进入idle状态；

                   wake lock 可以设置超时释放，在持有wake lock一个固定时间之后自动释放。一般应用在系统正在处理一些事情的时候，防止系统进入深度睡眠而干扰了正在处理的任务； 尤其是在做了硬件唤醒的，当唤醒之后要处理一些响应，为了防止系统马上再次进入休眠，在设置一个超时锁。

          如系统能否进入深度睡眠，当系统处在idle时，会不断判断是否还有WAKE_LOCK_SUSPEND

        

4，  电源状态切换的调试：

           /sys/power/state

          /sys/power/wake_lock

          /sys/power/wake_unlock

          1)  cat  /sys/power/state -----查看系统状态，  echo mem > /sys/power/state    ---- 将系统设置为进入休眠

          2) echo "name"    > /sys/power/wake_lock ----- 申请一个锁

                 cat /sys/power/wake_lock -----查看系统的wake lock 情况

                 wake_unlock 同样。

 

         3)  echo 15 > /sys/module/wakelock/parameters/debug_mask   ------------

               这样wakelock的驱动会把每次的wakelock操作都打印在console上，对于调试为什么suspend不下去这类的问题很有用。如下所示：

               [ 1062.912297] wake_lock: mmc_delayed_work, stop expire timer
               [ 1062.922395] wake_unlock: mmc_delayed_work, start expire timer, 990
               [ 1062.931174] wake_lock: event0-79, start expire timer, 989
               [ 1062.933710] wake_lock: event0-79, start expire timer, 989
               [ 1062.939081] wake_lock: event0-79, start expire timer, 989
               [ 1062.961143] wake_lock: event0-79, start expire timer, 986
";i:1;N;i:2;N;}i:2;i:18528;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23916;}i:31;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:23916;}}