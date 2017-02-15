a:142:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"该流程基于S100D 源码分析，以程序启动和常用操作为主要引导线。水平有限，如有错误，请及时更正。";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:137;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"程序启动";i:1;i:1;i:2;i:137;}i:2;i:137;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:137;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:137;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:239:"phone部分对应到系统进程中的“com.android.phone”，系统启动时默认启动。该应用的application文件“PhoneApp”中定义了许多关键的对象，并初始化了这些对象。后面会逐渐解释这些对象。";}i:2;i:162;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:407;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:390:"
// A few important fields we expose to the rest of the package
// directly (rather than thru set/get methods) for efficiency.
Phone phone;
CallController callController;
InCallUiState inCallUiState;
CallerInfoCache callerInfoCache;
CallNotifier notifier;
NotificationMgr notificationMgr;
Ringer ringer;
BluetoothHandsfree mBtHandsfree;
PhoneInterfaceManager phoneMgr;
CallManager mCM;
...
";i:1;s:4:"java";i:2;N;}i:2;i:407;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1823:"
// Initialize the telephony framework
PhoneFactory.makeDefaultPhones(this);

// Get the default phone
phone = PhoneFactory.getDefaultPhone();

// Start TelephonyDebugService After the default phone is created.
Intent intent = new Intent(this, TelephonyDebugService.class);
startService(intent);

mCM = CallManager.getInstance();
mCM.registerPhone(phone);

// Create the NotificationMgr singleton, which is used to display
// status bar icons and control other status bar behavior.
notificationMgr = NotificationMgr.init(this);

phoneMgr = PhoneInterfaceManager.init(this, phone);

mHandler.sendEmptyMessage(EVENT_START_SIP_SERVICE);

...

mReceiver = new PhoneAppBroadcastReceiver();
mMediaButtonReceiver = new MediaButtonBroadcastReceiver();

...

// Create the CallController singleton, which is the interface
// to the telephony layer for user-initiated telephony functionality
// (like making outgoing calls.)
callController = CallController.init(this);
// ...and also the InCallUiState instance, used by the CallController to
// keep track of some "persistent state" of the in-call UI.
inCallUiState = InCallUiState.init(this);

// Create the CallerInfoCache singleton, which remembers custom ring tone and
// send-to-voicemail settings.
//
// The asynchronous caching will start just after this call.
callerInfoCache = CallerInfoCache.init(this);

// Create the CallNotifer singleton, which handles
// asynchronous events from the telephony layer (like
// launching the incoming-call UI when an incoming call comes
// in.)
notifier = CallNotifier.init(this, phone, ringer, mBtHandsfree, new CallLogAsync());

// register for ICC status
IccCard sim = phone.getIccCard();
if (sim != null) {
    if (VDBG) Log.v(LOG_TAG, "register for ICC status");
    sim.registerForPersoLocked(mHandler, EVENT_PERSO_LOCKED, null);
}
";i:1;s:4:"java";i:2;N;}i:2;i:816;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2653;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"打电话";i:1;i:2;i:2;i:2653;}i:2;i:2653;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2653;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2653;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"打电话的入口从OutgoingCallBroadcaster类开始，该类继承与Activity，接受CALL 、 CALL_PRIVILEGED 和 CALL_EMERGENCY 的intent的action。";}i:2;i:2673;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2826;}i:17;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2826;}i:18;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2826;}i:19;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2826;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" CALL 代表普通的拨号";}i:2;i:2830;}i:21;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2857;}i:22;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2857;}i:23;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2857;}i:24;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2857;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:" CALL_PRIVILEGED 代表来自通讯录、蓝牙、语音等的拨号";}i:2;i:2861;}i:26;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2929;}i:27;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2929;}i:28;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2929;}i:29;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2929;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:" CALL_EMERGENCY 意味着紧急拨号，如120、119等";}i:2;i:2933;}i:31;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2988;}i:32;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2988;}i:33;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2988;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2988;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:"该类在接到需要打电话的通知以后，会有一系列的判断来最终确定该次呼叫的类型，同时CALL_PRIVILEGED最终也会被确认为CALL/CALL_EMERGENCY。";}i:2;i:2989;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3173;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:965:"
/* Change CALL_PRIVILEGED into CALL or CALL_EMERGENCY as needed. */
// TODO: This code is redundant with some code in InCallScreen: refactor.
if (Intent.ACTION_CALL_PRIVILEGED.equals(action)) {
    // We're handling a CALL_PRIVILEGED intent, so we know this request came
    // from a trusted source (like the built-in dialer.)  So even a number
    // that's *potentially* an emergency number can safely be promoted to
    // CALL_EMERGENCY (since we *should* allow you to dial "91112345" from
    // the dialer if you really want to.)
    if (isPotentialEmergencyNumber) {
        Log.i(TAG, "ACTION_CALL_PRIVILEGED is used while the number is a potential"
                + " emergency number. Use ACTION_CALL_EMERGENCY as an action instead.");
        action = Intent.ACTION_CALL_EMERGENCY;
    } else {
        action = Intent.ACTION_CALL;
    }
    if (DBG) Log.v(TAG, " - updating action from CALL_PRIVILEGED to " + action);
    intent.setAction(action);
}
";i:1;s:4:"java";i:2;N;}i:2;i:3173;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3173;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:"如果最终判断是紧急呼叫则直接调用callcontrol的placeCall(intent)播出电话";}i:2;i:4152;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4249;}i:41;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:162:"
// Initiate the outgoing call, and simultaneously launch the
// InCallScreen to display the in-call UI:
PhoneApp.getInstance().callController.placeCall(intent);
";i:1;s:4:"java";i:2;N;}i:2;i:4249;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4249;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"这里比较有意思的一点是这里并没有返回，而是按照普通呼叫一样的继续执行。后面会讲到它最终是怎么处理的。";}i:2;i:4425;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4575;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4575;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:257:"在普通呼叫的状态下，它会发出一个ACTION_NEW_OUTGOING_CALL广播，让别的程序可以接受这条广播并可以打断这次通话。如果没有被打断的话，这个广播最终会回到该类的子类OutgoingCallReceiver的实例中。";}i:2;i:4577;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4840;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1214:"
Intent broadcastIntent = new Intent(Intent.ACTION_NEW_OUTGOING_CALL);
if (number != null) {
    broadcastIntent.putExtra(Intent.EXTRA_PHONE_NUMBER, number);
}
PhoneUtils.checkAndCopyPhoneProviderExtras(intent, broadcastIntent);
broadcastIntent.putExtra(EXTRA_ALREADY_CALLED, callNow);
broadcastIntent.putExtra(EXTRA_ORIGINAL_URI, uri.toString());
broadcastIntent.putExtra(SUBSCRIPTION_KEY, mSubscription);
// Need to raise foreground in-call UI as soon as possible while allowing 3rd party app
// to intercept the outgoing call.
broadcastIntent.addFlags(Intent.FLAG_RECEIVER_FOREGROUND);
if (DBG) Log.v(TAG, " - Broadcasting intent: " + broadcastIntent + ".");

// Set a timer so that we can prepare for unexpected delay introduced by the broadcast.
// If it takes too much time, the timer will show "waiting" spinner.
// This message will be removed when OutgoingCallReceiver#onReceive() is called before the
// timeout.
mHandler.sendEmptyMessageDelayed(EVENT_OUTGOING_CALL_TIMEOUT,
        OUTGOING_CALL_TIMEOUT_THRESHOLD);
sendOrderedBroadcast(broadcastIntent, PERMISSION, new OutgoingCallReceiver(),
        null,  // scheduler
        Activity.RESULT_OK,  // initialCode
        number,  // initialData: ini
";i:1;s:4:"java";i:2;N;}i:2;i:4840;}i:49;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4840;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:170:"在OutgoingCallReceiver的处理中我们发现她首先就做了是否已经有通话在进行的判断，从而解决了上面“紧急呼叫”没有返回的问题。";}i:2;i:6068;}i:51;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6238;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6238;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:260:"紧接着OutgoingCallReceiver将请求传递到SipCallOptionHandler，SipCallOptionHandler 里面主要是判断选择这次呼叫的类型（不同与上面的类型，这次是SIP or PSTN）并最终在setResultAndFinish中向callController发起通话请求";}i:2;i:6240;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6506;}i:55;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:120:"
// Woo hoo -- it's finally OK to initiate the outgoing call!
PhoneApp.getInstance().callController.placeCall(mIntent);
";i:1;s:4:"java";i:2;N;}i:2;i:6506;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6506;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:106:"placeCall发起通话，并在该方法的末尾打开通话过程中显示的页面 InCallScreen Activity";}i:2;i:6640;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6752;}i:59;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:205:"
if(mApp instanceof MSimPhoneApp){
      ((MSimPhoneApp)mApp).displayCallScreen(intent.getIntExtra(MSimConstants.SUBSCRIPTION_KEY, mApp.getDefaultSubscription()));
}else{
      mApp.displayCallScreen();
}
";i:1;s:4:"java";i:2;N;}i:2;i:6752;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6752;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:95:"该界面的视图主要参考InCallTouchUi，并且已将事件传递到InCallScreen 中处理";}i:2;i:6971;}i:62;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7072;}i:63;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:835:"
/**
 * Handles button clicks from the InCallTouchUi widget.
 */
/* package */ void handleOnscreenButtonClick(int id) {
    log("handleOnscreenButtonClick(id " + id + ")...");

    switch (id) {
        // Actions while an incoming call is ringing:
        case R.id.incomingCallAnswer:
            internalAnswerCall();
            break;
        ...
        case R.id.manageConferenceButton:
            // Show the Manage Conference panel.
            setInCallScreenMode(InCallScreenMode.MANAGE_CONFERENCE);
            requestUpdateScreen();
            break;

        default:
            Log.w(LOG_TAG, "handleOnscreenButtonClick: unexpected ID " + id);
            break;
    }
     // Clicking any onscreen UI element counts as explicit "user activity".
    mApp.pokeUserActivity();
    /**...*/
    updateInCallTouchUi();
}
";i:1;s:4:"java";i:2;N;}i:2;i:7072;}i:64;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7921;}i:65;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"来电";i:1;i:2;i:2;i:7921;}i:2;i:7921;}i:66;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7921;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7921;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:338:"来电的入口需要从CallNotifier（在PhoneApp里有看=到他的初始化）这个类讲起，这个类的主要职责是监听通话状态的改变和来自telephony层的事件（如来电），并且触发相应的UI变化。在该类的构造函数中可以看到它将自己作为监听注册给telephony监听了许多事件。";}i:2;i:7938;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8282;}i:70;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1065:"
private void registerForNotifications() {
    mCM.registerForNewRingingConnection(this, PHONE_NEW_RINGING_CONNECTION, null);
    mCM.registerForPreciseCallStateChanged(this, PHONE_STATE_CHANGED, null);
    mCM.registerForDisconnect(this, PHONE_DISCONNECT, null);
    mCM.registerForUnknownConnection(this, PHONE_UNKNOWN_CONNECTION_APPEARED, null);
    mCM.registerForIncomingRing(this, PHONE_INCOMING_RING, null);
    mCM.registerForCdmaOtaStatusChange(this, EVENT_OTA_PROVISION_CHANGE, null);
    mCM.registerForCallWaiting(this, PHONE_CDMA_CALL_WAITING, null);
    mCM.registerForDisplayInfo(this, PHONE_STATE_DISPLAYINFO, null);
    mCM.registerForSignalInfo(this, PHONE_STATE_SIGNALINFO, null);
    mCM.registerForInCallVoicePrivacyOn(this, PHONE_ENHANCED_VP_ON, null);
    mCM.registerForInCallVoicePrivacyOff(this, PHONE_ENHANCED_VP_OFF, null);
    mCM.registerForRingbackTone(this, PHONE_RINGBACK_TONE, null);
    mCM.registerForResendIncallMute(this, PHONE_RESEND_MUTE, null);
    mCM.registerForSuppServiceNotification(this, SUPP_SERVICE_NOTIFY, null);
}
";i:1;s:4:"java";i:2;N;}i:2;i:8282;}i:71;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8282;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:332:"来电的过程中，telephony层的RIL.java类有一个RILReceiver类继承于Runnable代表了一个线程。该线程接收来自c库RIL的消息（如incoming），调用processResponse进行处理，后者将根据Response的类型，调用processSolicited 和processUnsolicited，然后辗转调用到CallNotifier的handler。";}i:2;i:9361;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9693;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9693;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:284:"RIL: (Radio Interface Layer between Android telephony services (android.telephony) and the radio hardware)是介于android telephony 和 Radio 硬件层的接口层，包含两个部分：RIL守护进程和RIL供应商，RIL守护进程与telephony服务交互并往RIL供应商分发";}i:2;i:9695;}i:76;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:9979;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"solicited commands";}i:2;i:9980;}i:78;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:9998;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"，RIL供应商是Radio的特定实现并分发";}i:2;i:9999;}i:80;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:10046;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"unsolicited commands";}i:2;i:10047;}i:82;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:10067;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"事件到RIL守护进程。（参考Wikipedia）";}i:2;i:10068;}i:84;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10116;}i:85;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1536:"
@Override
public void handleMessage(Message msg) {
    switch (msg.what) {
        case RINGER_WAIT_FOR_QUERY:
             int subscription = mCM.getRingingPhone().getSubscription();
             mRinger.ring(subscription);
        break;
        
        case PHONE_NEW_RINGING_CONNECTION:
             log("RINGING... (new)");
             onNewRingingConnection((AsyncResult) msg.obj);
             mSilentRingerRequested = false;
        break;

        case PHONE_INCOMING_RING:
            // repeat the ring when requested by the RIL, and when the user has NOT
            // specifically requested silence.
            if (msg.obj != null && ((AsyncResult) msg.obj).result != null) {
                PhoneBase pb =  (PhoneBase)((AsyncResult)msg.obj).result;

                if ((pb.getState() == Phone.State.RINGING)
                        && (mSilentRingerRequested == false)) {
                    if (DBG) log("RINGING... (PHONE_INCOMING_RING event)");
                    sendEmptyMessageDelayed(RINGER_WAIT_FOR_QUERY, RINGTONE_QUERY_WAIT_TIME);
                } else {
                    if (DBG) log("RING before NEW_RING, skipping");
                }
            }
            break;

        case PHONE_STATE_CHANGED:
            onPhoneStateChanged((AsyncResult) msg.obj);
            break;

        case PHONE_DISCONNECT:
            if (DBG) log("DISCONNECT");
            onDisconnect((AsyncResult) msg.obj);
            break;

        ...

        default:
            // super.handleMessage(msg);
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:10123;}i:86;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10123;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:240:"这么多的状态那个才是来电第一个首先触发的状态呢，我第一眼看到了PHONE_INCOMING_RING。决定跟踪下去，判断是否静音，到了RINGER_WAIT_FOR_QUERY然后调用mRinger.ring(subscription)，进入方法。";}i:2;i:11673;}i:88;a:3:{i:0;s:6:"smiley";i:1;a:1:{i:0;s:3:"^_^";}i:2;i:11913;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"，开始震动了。";}i:2;i:11916;}i:90;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11943;}i:91;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:213:"
if (shouldVibrate(subscription) && mVibratorThread == null) {
    mContinueVibrating = true;
    mVibratorThread = new VibratorThread();
    if (DBG) log("- starting vibrator...");
    mVibratorThread.start();
}
";i:1;N;i:2;N;}i:2;i:11943;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11943;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:"然后处理PLAY_RING_ONCE响铃，然后、然后没了，一滴汗。。。";}i:2;i:12165;}i:94;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:12242;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:280:"没有了，界面没有启动，所以回去再找。PHONE_NEW_RINGING_CONNECTION、PHONE_STATE_CHANGED都蛮像的，决定先看PHONE_STATE_CHANGED。因为如果是它的话，一定会转到PHONE_NEW_RINGING_CONNECTION。跳转到onPhoneStateChanged((AsyncResult) msg.obj)。";}i:2;i:12245;}i:96;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:12525;}i:97;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:"不过很遗憾，从注释可以看到该方法不处理新的来电和断开连接。（注释真是好,赞一个！！！）";}i:2;i:12528;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12661;}i:99;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:338:"
/**
 * Updates the phone UI in response to phone state changes.
 *
 * Watch out: certain state changes are actually handled by their own
 * specific methods:
 *   - see onNewRingingConnection() for new incoming calls
 *   - see onDisconnect() for calls being hung up or disconnected
 */
private void onPhoneStateChanged(AsyncResult r) {
";i:1;s:4:"java";i:2;N;}i:2;i:12661;}i:100;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12661;}i:101;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"既然来了，就呆一会再走吧。首先看它支持的状态。";}i:2;i:13013;}i:102;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13082;}i:103;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:13082;}i:104;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13082;}i:105;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13082;}i:106;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:" IDLE 代表处于空闲状态";}i:2;i:13086;}i:107;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13116;}i:108;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13116;}i:109;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13116;}i:110;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13116;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" RINGING 正在通话状态";}i:2;i:13120;}i:112;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13147;}i:113;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13147;}i:114;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13147;}i:115;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13147;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:" OFFHOOK 相当于电话的没挂好的状态";}i:2;i:13151;}i:117;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13196;}i:118;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13196;}i:119;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:13196;}i:120;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13196;}i:121;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:"研究了一下这个方法的内容，感觉跟UI关系不是很大，处理的都是声音播放器、近距离传感器、屏幕锁定等的状态。";}i:2;i:13197;}i:122;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13349;}i:123;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13349;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:315:"接下来跟踪PHONE_NEW_RINGING_CONNECTION的处理，进入onNewRingingConnection（）方法，该方法先进行一些过滤，在某些情况下（比如正在视频通话）直接挂断该次通话请求。此外还看到这样一句,在源码中经常会看到类似的语句，以增强代码的健壮性。";}i:2;i:13351;}i:125;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13672;}i:126;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:184:"
if (c == null) {
    Log.w(LOG_TAG, "CallNotifier.onNewRingingConnection(): null connection!");
    // Should never happen, but if it does just bail out and do nothing.
    return;
}
";i:1;s:4:"java";i:2;N;}i:2;i:13672;}i:127;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13672;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:248:"然后再经过获取callerinfo，进入该处理流程的最后步骤onCustomRingQueryComplete()。这个方法里主要做了两件事情：响铃和显示来电界面。补充一句，在获取callerinfo超时的情况也直接跳到该方法。";}i:2;i:13870;}i:129;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14124;}i:130;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:347:"
// Ring, either with the queried ringtone or default one.
if (VDBG) log("RINGING... (onCustomRingQueryComplete)");
int subscription = mCM.getRingingPhone().getSubscription();
mRinger.ring(subscription);

// ...and display the incoming call to the user:
if (DBG) log("- showing incoming call (custom ring query complete)...");
showIncomingCall();
";i:1;s:4:"java";i:2;N;}i:2;i:14124;}i:131;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14124;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:216:"继续跟踪到updateInCallNotification(boolean allowFullScreenIntent)，从这个方法可以看出它是通过发通知的方式来告诉用户，然后通过设置fullScreenIntent为true直接启动InCallScreen。";}i:2;i:14485;}i:133;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14707;}i:134;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:420:"
// Ok, we actually want to launch the incoming call
// UI at this point (in addition to simply posting a notification
// to the status bar).  Setting fullScreenIntent will cause
// the InCallScreen to be launched immediately *unless* the
// current foreground activity is marked as "immersive".
if (DBG) log("- Setting fullScreenIntent: " + inCallPendingIntent);
builder.setFullScreenIntent(inCallPendingIntent, true);
";i:1;s:4:"java";i:2;N;}i:2;i:14707;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14707;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:309:"至此来电过程已经基本结束。但是细心的你有没有发现有两个地方（PHONE_INCOMING_RING、PHONE_NEW_RINGING_CONNECTION）都有机会调用了mRinger.ring(subscription)这个方法，这是怎么回事，这还是不能判断那个会先行调用。于是本人决定使用debug模式。";}i:2;i:15141;}i:137;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:15450;}i:138;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:379:"通过调试可以发现，先行接受到的事件是PHONE_INCOMING_RING，但是这是的状态不是处于RINGING，所以直接忽略掉了。然后才会接受到PHONE_NEW_RINGING_CONNECTION的事件。而此后还会接受到PHONE_INCOMING_RING事件，同样会执行mRinger.ring(subscription)，不过这道是很像android源码的风格，以增强产品的适应性。";}i:2;i:15453;}i:139;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15832;}i:140;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15832;}i:141;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:15832;}}