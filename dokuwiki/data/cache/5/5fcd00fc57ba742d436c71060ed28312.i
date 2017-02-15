a:20:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:476:" 我们的VrLauncher用到了rajawali3D来创建全景背景（Rajawali是一个用于Android应用的3D引擎，基于 OpenGL ES 2.0），
 利用google cardboard来实现分屏（有着3D显示软件的智能手机，透镜会让使用者分别感知左影像和右影像，以建立一个3D影像）。
 即activity继承CardboardActivity即可展现分屏界面。renderer类继承RajawaliCardboardRenderer即可展现全景空间及空间内需要展现染的component。";}i:2;i:0;}i:2;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1228:"  Vrlauncher是一个普通的activity，这个activity设置了一个菜单，此菜单用于设置所使用的眼镜。Vrlauncher Activity，
  加载了所有拥有这两个category的app    
     mainIntent.addCategory("com.google.intent.category.CARDBOARD");       
     mainIntent.addCategory("android.intent.category.LAUNCHER");
     当我们点击与Vrlauncher含有同样包名的app时，将启动MyVr，MyVr是一个继承了CardboardActivity的activity，实现了分屏。
     该activity的布局嵌入了org.rajawali3d.cardboard.RajawaliCardboardView，
     又加入了两个ImageView用于表示界面上指示模拟点击聚焦的点，还加入了sim.testvr.model.RoundProgressBar,用于播放模拟点击动画，
     每完成一次RoundProgressBar动画播放，触发一次模拟点击，调用simulate(mCardboardView);
     随后在Oncreate中创建Renderer并为cardboard设置Renderer，代码如下
    mRajawaliCardboardRenderer=newMyVrRenderer(this,mHandler);      
    mCardboardView.setRenderer(mRajawaliCardboardRenderer);
    随后获取了系统的SENSOR_SERVICE，使用陀螺仪距离传感器的数据用于头部追踪，并根据MagnetSensor的数据变化触发onCardboardTrigger。";}i:2;i:484;}i:3;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:428:"  MyVrRenderer继承了RajawaliCardboardRenderer，主要方法有：
  initScene方法，该方法用于初始化界面，主要设置天空盒，创建菜单以及创建app列表。
  onRender 方法，主要根据isLookingAtScreen判断component是否被选中，设置被选中component的颜色和缩放。
  MyCardboardTrigger方法，点选界面的component，负责界面刷新及点选component后的跳转。如下图";}i:2;i:1738;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1738;}i:5;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:27:":android:application:vr.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:2177;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2213;}i:7;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:807:"  WindVrActivity 同样继承了CardboardActivity。WindVrRenderer继承了RajawaliCardboardRenderer。主要方法有：
  initScene方法，该方法用于初始化界面，创建全景背景调用createBaceSphereWithTexture();并且创建了一个视频纹理，
  调用createMainScreenWithTexture(mVideoTexture);
  用于播放2D视频。同时创建了一些用于控制视频播放的按钮，上一个，下一个，暂停，播放，切换至全景播放设置等。
  onRender方法，主要根据isLookingAtScreen判断component是否被选中，设置被选中component的颜色和缩放。
  MyCardboardTrigger方法，主要实现了视频播放控制的具体切换。

  videoActivity用于播放全景视频，PhotoActivity用于播放全景图片。 renderer原理同WindVrRenderer。  


";}i:2;i:2215;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2215;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"附：rajawali和google cardboard连接：  ";}i:2;i:3046;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3090;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3090;}i:12;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:109:"http://www.rozengain.com/blog/2011/08/23/announcing-rajawali-an-opengl-es-2-0-based-3d-framework-for-android/";i:1;N;}i:2;i:3093;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:", ";}i:2;i:3206;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3208;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3208;}i:16;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:51:"https://developers.google.com/vr/cardboard/overview";i:1;N;}i:2;i:3210;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3265;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3265;}i:19;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3265;}}