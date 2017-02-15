a:34:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:41:"8625Q平台控制是否显示camera图标";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"此方法可以应用到其他程序中";}i:2;i:57;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:96;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:96;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"1";}i:2;i:98;}i:8;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:99;}i:9;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:102;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:"> packages/apps/Camera/rc/com/android/camera/DisableCameraReceiver.java";}i:2;i:105;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:176;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:176;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:208:"该Receiver用以监听系统完全启动后，检测camera设备数(num>0表示存在)是否存在camera设备，并根据是否存在camera决定加载或者不加载camera应用。
主要要注意的方法";}i:2;i:178;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:387;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1015:"  private static final String ACTIVITIES[] = {
      "com.android.camera.CameraLauncher"}; //AndroidManifset.xml中的<category android:name="android.intent.category.LAUNCHER"/>
                                              设置camera在launcher中启动的android:name
  
  public void onReceive(Context context, Intent intent) {
      .....
      // Disable this receiver so it won't run again.
      disableComponent(context, "com.android.camera.DisableCameraReceiver");
      //这是取消加载该Receiver，也就是只有第一次启动设备后，以后启动设备，该Receiver组件不会再加载，也就是该组件将不会启动。
      每次恢复出厂设置后，重启后都只会启动一次。若camera设备减少,增加或出硬件问题，重启机器后都不会改变。
      去掉该段代码，每次开机后都会去检测camera设备数，来决定加载或不加载camera应用，更灵活，但camera设备硬件出问题
      后重启机器不会加载camera应用。
  }";}i:2;i:387;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:347:"  //不加载控件
  private void disableComponent(Context context, String klass) {
      ComponentName name = new ComponentName(context, klass);
      PackageManager pm = context.getPackageManager();
      pm.setComponentEnabledSetting(name,
          PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
          PackageManager.DONT_KILL_APP);
  }";}i:2;i:1430;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:342:"  //加载控件
  private void enableComponent(Context context, String klass) {
      ComponentName name = new ComponentName(context, klass);
      PackageManager pm = context.getPackageManager();
      pm.setComponentEnabledSetting(name,
          PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
          PackageManager.DONT_KILL_APP);
  }";}i:2;i:1795;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1795;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"2";}i:2;i:2157;}i:20;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2158;}i:21;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2161;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:116:"> packages/apps/Gallery2/Androidmanifset.xml
camera的配置项在Gallery2中，方便二者之间的数据交互。";}i:2;i:2164;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2281;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:621:"      <activity-alias android:icon="@mipmap/ic_launcher_camera"
                      android:label="@string/camera_label"
                      android:name="com.android.camera.CameraLauncher"
                      android:targetActivity="com.android.camera.Camera" >
          <intent-filter>
              <action android:name="android.intent.action.MAIN" />
              <category android:name="android.intent.category.DEFAULT" />
              <category android:name="android.intent.category.LAUNCHER" />
          </intent-filter>
      </activity-alias>
      //加载在launcher中camera的入口类名。
      ";}i:2;i:2281;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2281;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"3";}i:2;i:2928;}i:27;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2929;}i:28;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"---";}i:2;i:2932;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:151:"> packages/apps/Gallery2# cd src/com/android/gallery3d/util/GalleryUtils.java
设置Gallery中的方法类。其中也包括判断是否存在camera。";}i:2;i:2935;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3086;}i:31;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:755:"  private static final String CAMERA_LAUNCHER_NAME = "com.android.camera.CameraLauncher";
  public static boolean isCameraAvailable(Context context) {
      if (sCameraAvailableInitialized) return sCameraAvailable;
      PackageManager pm = context.getPackageManager();
      ComponentName name = new ComponentName(context, CAMERA_LAUNCHER_NAME);
      int state = pm.getComponentEnabledSetting(name);
      sCameraAvailableInitialized = true;
      sCameraAvailable =
          (state == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT)
           || (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED);
      return sCameraAvailable;
  }
  //该方法是获取应用中是否存在camera应用。若不存在则在gallery中去除camera的入口。";}i:2;i:3086;}i:32;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3870;}i:33;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3870;}}