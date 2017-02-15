a:33:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"双摄像头后台录制方案";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"研发平台：MT6735";}i:2;i:46;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:67;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:69;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"一、主要遇到的问题";i:1;i:3;i:2;i:69;}i:2;i:69;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:69;}i:9;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:1273:"
1.1&nbsp;&nbsp;前期的录像编码采用过的API 包括：MediaCodec、MediaExtractor、MediaMuxer、MediaFormat这部分需要开发者非常熟悉这套API，不然开发、维护起来比较耗时。所以我使用的是MediaRecorder封装好的接口进行编码，但是MediaRecorder默认不支持两个摄像头录像编码，需要打开限制。(PS：MediaCodec、MediaExtractor这块API使用可参考<a href="http://172.21.1.23/dokuwiki/doku.php/android;application;%E4%B8%8D%E4%B8%A2%E7%A7%92%E5%88%86%E6%AE%B5%E5%BD%95%E5%83%8F%E6%96%B9%E6%A1%88">不漏秒分段录像方案</a>)<br><BR>

1.2&nbsp;&nbsp;在显示上曾用过SurfaceView来进行过预览，需要支持后台录像功能的话不能使用它，因为每次Activity退到后台时会不可控执行surfaceDestroyed销毁控件，再进入Activity的时候就会再次创建SurfaceView。在使用上SurfaceView控件必须与Camera绑定，直接影响了数据获取、文件编码，所以不能使用这种方式预览。后来我们采用GLSurfaceView来解决此问题，GLSurfaceView是SurfaceView的子类，在功能上进行了强大的扩展，绑定纹理ID号之后采用OpenGL的一些渲染函数进行画面绘制。避开了SurfaceView的销毁重新创建问题。<BR><BR>
";}i:2;i:113;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1395;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"二、目前的方案流程";i:1;i:3;i:2;i:1395;}i:2;i:1395;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1395;}i:13;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:358:"
2.1&nbsp;&nbsp;Camera负责open摄像头。GLSurfaceView创建纹理ID传递给SurfaceTexture然后与Camera进行绑定。<BR>
2.2&nbsp;&nbsp;GLSurfaceView负责录像时画面渲染<BR>
2.3&nbsp;&nbsp;MediaRecorder负责Camera捕获的数据进行编码，封装成媒体文件。<BR>
2.4&nbsp;&nbsp;Service负责后台运行时的进程保持。<BR><BR>
";}i:2;i:1439;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1806;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"三、关键代码";i:1;i:3;i:2;i:1806;}i:2;i:1806;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1806;}i:17;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:174:"
3.1&nbsp;&nbsp;解除MTK对MediaRecorder双摄像头编码限制。<BR>
修改路径：vendor/mediatek/proprietary/platform/mt6735/hardware/mtkcam/D1/hwutils/CamManager.cpp
";}i:2;i:1841;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:339:"
getPermission() const
{
    Mutex::Autolock _l(mLockMtx);
    MY_LOGD("mDeviceCnt(%d), mbRecord(%d), mbAvailable(%d), mbStereo(%d), 0:fps(%d); 1:fps(%d)",
            mDeviceCnt, mbRecord, mbAvailable, mbStereo, getFrameRate(0), getFrameRate(1));
    //return !mbRecord && mbAvailable && !mbStereo;
    return mbAvailable && !mbStereo;
}
";i:1;s:1:"C";i:2;N;}i:2;i:2028;}i:19;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:201:"
3.2&nbsp;&nbsp;使用Camera打开摄像头以及绑定SurfaceTexture，从图像流中捕获帧作为OpenGL纹理，Camera的预览数据，变成纹理后可以交给GLSurfaceView直接显示。<BR>
";}i:2;i:2384;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:405:"
public void startCameraPreview(SurfaceTexture st) {
    try {
        mCamera = Camera.open(mCameraId);
        Parameters parameters = mCamera.getParameters();
        parameters.setPreviewSize(mVideoWidth, mVideoHeight);
        mCamera.setParameters(parameters);
        mCamera.setPreviewTexture(st);
        mCamera.startPreview();
    } catch (IOException e) {
        e.printStackTrace();
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:2598;}i:21;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:51:"
3.3&nbsp;&nbsp;CameraGLSurfaceView.java实现<BR>
";}i:2;i:3023;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3973:"
public class CameraGLSurfaceView extends GLSurfaceView implements Renderer,
        SurfaceTexture.OnFrameAvailableListener {

    private static final String TAG = "CameraGLSurfaceView";

    private SurfaceTexture mSurface;
    private int mTextureID = -1;
    private DirectDrawer mDirectDrawer;

    private CameraProxy mProxyFront, mProxyBack;

    public CameraGLSurfaceView(Context ctx, CameraProxy proxy, int cameraId) {
        super(ctx);

        setEGLContextClientVersion(2);
        setRenderer(this);
        setRenderMode(RENDERMODE_WHEN_DIRTY);// 脏模式，意思就是有数据的时候才进入onDrawFrame进行渲染

        if (proxy != null) {
            if (cameraId == 1) {
                mSurface = proxy.getSurfaceTexureFront();
                mTextureID = proxy.getTexureIdFront();
                proxy.registerFrameAvailableListenerFront(this);
                mProxyFront = proxy;
            } else if (cameraId == 0) {
                mSurface = proxy.getSurfaceTexureBack();
                mTextureID = proxy.getTexureIdBack();
                proxy.registerFrameAvailableListenerBack(this);
                mProxyBack = proxy;
            }
        }

    }

    /** 创建纹理ID **/
    public static int createTextureID(int cameraId) {
        int[] texture = new int[2];
        texture[0] = 0;// 后摄
        texture[1] = 1;// 前摄

        GLES20.glGenTextures(1, texture, 0);
        GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, texture[0]);
        GLES20.glTexParameterf(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                GL10.GL_TEXTURE_MIN_FILTER, GL10.GL_LINEAR);
        GLES20.glTexParameterf(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                GL10.GL_TEXTURE_MAG_FILTER, GL10.GL_LINEAR);
        GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                GL10.GL_TEXTURE_WRAP_S, GL10.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                GL10.GL_TEXTURE_WRAP_T, GL10.GL_CLAMP_TO_EDGE);
        if (cameraId == 0)
            return texture[1];
        else
            return texture[0];
    }

    @Override
    public void onSurfaceCreated(GL10 gl, EGLConfig config) {
        Log.i(TAG, "onSurfaceCreated...");
        mDirectDrawer = new DirectDrawer(mTextureID);// 当创建时把纹理ID下发给渲染封装类
    }

    @Override
    public void onSurfaceChanged(GL10 gl, int width, int height) {
        Log.i(TAG, "onSurfaceChanged...");
        GLES20.glViewport(0, 0, width, height);
    }

    @Override
    public void onDrawFrame(GL10 gl) {
        Log.i(TAG, "onDrawFrame...");
        // 获取手机屏幕尺寸并计算出一半尺寸-两个画面分割线高度
        DisplayMetrics dm = MainActivity.getDisplayMetrics();
        GLES20.glViewport(0, 0, dm.widthPixels, dm.heightPixels / 2 - 2);
        GLES20.glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT | GLES20.GL_DEPTH_BUFFER_BIT);
        try {
            mSurface.updateTexImage();
        } catch (Exception e) {
        }

        float[] mtx = new float[16];
        mSurface.getTransformMatrix(mtx);
        mDirectDrawer.draw(mtx);// 主要在此进行渲染
    }

    @Override
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        Log.i(TAG, "onFrameAvailable...");
        this.requestRender();
    }

    @Override
    protected void onDetachedFromWindow() {
        Log.d(TAG, "onDetachedFromWindow");
        if (null != mProxyFront) {
            mProxyFront.registerFrameAvailableListenerFront(null);
        }
        if (null != mProxyBack) {
            mProxyBack.registerFrameAvailableListenerBack(null);
        }
        super.onDetachedFromWindow();
    }

    @Override
    public void onPause() {
        Log.d(TAG, "onPause");
        super.onPause();
    }

    @Override
    public void onResume() {
        Log.d(TAG, "onResume");
        super.onResume();
    }

}
";i:1;s:4:"java";i:2;N;}i:2;i:3087;}i:23;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:53:"
3.4&nbsp;&nbsp;DirectDrawer.java渲染封装类<BR>
";}i:2;i:7080;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4826:"
public class DirectDrawer {

    private final String vertexShaderCode =
            "attribute vec4 vPosition;" +
                    "attribute vec2 inputTextureCoordinate;" +
                    "varying vec2 textureCoordinate;" +
                    "void main()" +
                    "{" +
                    "gl_Position = vPosition;" +
                    "textureCoordinate = inputTextureCoordinate;" +
                    "}";

    private final String fragmentShaderCode =
            "#extension GL_OES_EGL_image_external : require\n" +
                    "precision mediump float;" +
                    "varying vec2 textureCoordinate;\n" +
                    "uniform samplerExternalOES s_texture;\n" +
                    "void main() {" +
                    "  gl_FragColor = texture2D( s_texture, textureCoordinate );\n" +
                    "}";

    private FloatBuffer vertexBuffer, textureVerticesBuffer;
    private ShortBuffer drawListBuffer;
    private final int mProgram;
    private int mPositionHandle;
    private int mTextureCoordHandle;

    private short drawOrder[] = {
            0, 1, 2, 0, 2, 3
    }; // order to draw vertices

    // number of coordinates per vertex in this array
    private static final int COORDS_PER_VERTEX = 2;

    private final int vertexStride = COORDS_PER_VERTEX * 4; // 4 bytes per vertex

    static float squareCoords[] = {
            -1.0f, 1.0f,
            -1.0f, -1.0f,
            1.0f, -1.0f,
            1.0f, 1.0f,
    };

    static float textureVertices[] = {
            0.0f, 1.0f,
            1.0f, 1.0f,
            1.0f, 0.0f,
            0.0f, 0.0f,
    };

    private int texture;

    public DirectDrawer(int texture)
    {
        this.texture = texture;
        // initialize vertex byte buffer for shape coordinates
        ByteBuffer bb = ByteBuffer.allocateDirect(squareCoords.length * 4);
        bb.order(ByteOrder.nativeOrder());
        vertexBuffer = bb.asFloatBuffer();
        vertexBuffer.put(squareCoords);
        vertexBuffer.position(0);

        // initialize byte buffer for the draw list
        ByteBuffer dlb = ByteBuffer.allocateDirect(drawOrder.length * 2);
        dlb.order(ByteOrder.nativeOrder());
        drawListBuffer = dlb.asShortBuffer();
        drawListBuffer.put(drawOrder);
        drawListBuffer.position(0);

        ByteBuffer bb2 = ByteBuffer.allocateDirect(textureVertices.length * 4);
        bb2.order(ByteOrder.nativeOrder());
        textureVerticesBuffer = bb2.asFloatBuffer();
        textureVerticesBuffer.put(textureVertices);
        textureVerticesBuffer.position(0);

        int vertexShader = loadShader(GLES20.GL_VERTEX_SHADER, vertexShaderCode);
        int fragmentShader = loadShader(GLES20.GL_FRAGMENT_SHADER, fragmentShaderCode);

        mProgram = GLES20.glCreateProgram(); // create empty OpenGL ES Program
        GLES20.glAttachShader(mProgram, vertexShader); // add the vertex shader to program
        GLES20.glAttachShader(mProgram, fragmentShader); // add the fragment shader to program
        GLES20.glLinkProgram(mProgram); // creates OpenGL ES program executables
    }

    public void draw(float[] mtx)
    {
        GLES20.glUseProgram(mProgram);

        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
        GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, texture);

        // get handle to vertex shader's vPosition member
        mPositionHandle = GLES20.glGetAttribLocation(mProgram, "vPosition");

        // Enable a handle to the triangle vertices
        GLES20.glEnableVertexAttribArray(mPositionHandle);

        // Prepare the <insert shape here> coordinate data
        GLES20.glVertexAttribPointer(mPositionHandle, COORDS_PER_VERTEX, GLES20.GL_FLOAT, false,
                vertexStride, vertexBuffer);

        mTextureCoordHandle = GLES20.glGetAttribLocation(mProgram, "inputTextureCoordinate");
        GLES20.glEnableVertexAttribArray(mTextureCoordHandle);

        GLES20.glVertexAttribPointer(mTextureCoordHandle, COORDS_PER_VERTEX, GLES20.GL_FLOAT,
                false, vertexStride, textureVerticesBuffer);

        GLES20.glDrawElements(GLES20.GL_TRIANGLES, drawOrder.length, GLES20.GL_UNSIGNED_SHORT,
                drawListBuffer);

        // Disable vertex array
        GLES20.glDisableVertexAttribArray(mPositionHandle);
        GLES20.glDisableVertexAttribArray(mTextureCoordHandle);
    }

    private int loadShader(int type, String shaderCode) {

        // create a vertex shader type (GLES20.GL_VERTEX_SHADER)
        // or a fragment shader type (GLES20.GL_FRAGMENT_SHADER)
        int shader = GLES20.glCreateShader(type);

        // add the source code to the shader and compile it
        GLES20.glShaderSource(shader, shaderCode);
        GLES20.glCompileShader(shader);

        return shader;
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:7146;}i:25;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:52:"
3.5&nbsp;&nbsp;实例化MediaRecorder编码器<BR>
";}i:2;i:11992;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:984:"
public void startMediaRecorder() {
    try {
        mMr = new MediaRecorder();
        mCamera.unlock();
        mMr.setCamera(mCamera);// 设置Camera进行绑定将摄像头数据进行编码，视频文件封装
        mMr.setVideoSource(MediaRecorder.VideoSource.CAMERA);// 视频来源
        mMr.setAudioSource(MediaRecorder.AudioSource.CAMCORDER);// 音频来源
        mMr.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);// 视频格式
        mMr.setAudioEncoder(MediaRecorder.AudioEncoder.AAC);// 音频编码
        mMr.setVideoEncoder(MediaRecorder.VideoEncoder.H264);// 视频硬编码
        mMr.setVideoSize(mVideoWidth, mVideoHeight);// 视频高宽
        mMr.setVideoFrameRate(RECODER_FRAMERATE);// 帧率
        mMr.setVideoEncodingBitRate(RECODER_BITRATE);// 比特率，码率
        mMr.setOutputFile(mVideoFilename);// 文件输出位置
        mMr.prepare();
        mMr.start();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:12057;}i:27;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:95:"
3.6&nbsp;&nbsp;Service来负责创建Camera、MediaRecorder，并且负责持久进程。<BR>
";}i:2;i:13061;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4712:"
public class CameraService extends Service {

    private static final String TAG = "SimCameraService";

    private int mTexureIdFront, mTexureIdBack;
    private SurfaceTexture mSurfaceTextureFront, mSurfaceTextureBack;
    private SegmentedUtil mSegmentedFront, mSegmentedBack;

    private OnFrameAvailableListener mViewListenerFront = null;
    private OnFrameAvailableListener mViewListenerBack = null;

    private CameraBinder mBinder = new CameraBinder();

    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        startForeground(-1982, new Notification());// 此处用意将Service暴露为可视化进程，提高优先级，防止被杀死

        // 启动前摄
        mTexureIdFront = CameraGLSurfaceView.createTextureID(SegmentedBase.CAMERA_ID_FRONT);
        mSurfaceTextureFront = new SurfaceTexture(mTexureIdFront);
        mSurfaceTextureFront.setOnFrameAvailableListener(mInternalListenerFront);
        mSegmentedFront = new SegmentedUtil(SegmentedBase.CAMERA_ID_FRONT,
                SegmentedBase.VIDEO_WIDTH_FRONT,
                SegmentedBase.VIDEO_HEIGHT_FRONT);
        mSegmentedFront.startCameraPreview(mSurfaceTextureFront);

        // 启动后摄
        mTexureIdBack = CameraGLSurfaceView.createTextureID(SegmentedBase.CAMERA_ID_BACK);
        mSurfaceTextureBack = new SurfaceTexture(mTexureIdBack);
        mSurfaceTextureBack.setOnFrameAvailableListener(mInternalListenerBack);
        mSegmentedBack = new SegmentedUtil(SegmentedBase.CAMERA_ID_BACK,
                SegmentedBase.VIDEO_WIDTH_BACK,
                SegmentedBase.VIDEO_HEIGHT_BACK);
        mSegmentedBack.startCameraPreview(mSurfaceTextureBack);

        // 通知MainActivity绑定服务
        sendStickyBroadcast(new Intent(CameraProxy.ACTION_SERVICE_CREATED));
    }

    /** MainActivity与CameraService通信Binder **/
    public class CameraBinder extends Binder implements CameraProxy {

        @Override
        public SurfaceTexture getSurfaceTexureFront() {
            return mSurfaceTextureFront;
        }

        @Override
        public int getTexureIdFront() {
            return mTexureIdFront;
        }

        @Override
        public void registerFrameAvailableListenerFront(OnFrameAvailableListener l) {
            mViewListenerFront = l;
        }

        @Override
        public SurfaceTexture getSurfaceTexureBack() {
            return mSurfaceTextureBack;
        }

        @Override
        public int getTexureIdBack() {
            return mTexureIdBack;
        }

        @Override
        public void registerFrameAvailableListenerBack(OnFrameAvailableListener l) {
            mViewListenerBack = l;
        }

        @Override
        public void startMediaRecorder() {
            startMedia();
        }

        @Override
        public void stopMediaRecorder() {
            stopMedia();
        }

    }

    /** 前摄画面绘制监听 **/
    private OnFrameAvailableListener mInternalListenerFront = new OnFrameAvailableListener() {

        @Override
        public void onFrameAvailable(SurfaceTexture surfaceTexture) {
            if (mViewListenerFront != null) {
                mViewListenerFront.onFrameAvailable(surfaceTexture);
            }
        }

    };

    /** 后摄画面绘制监听 **/
    private OnFrameAvailableListener mInternalListenerBack = new OnFrameAvailableListener() {

        @Override
        public void onFrameAvailable(SurfaceTexture surfaceTexture) {
            if (mViewListenerBack != null) {
                mViewListenerBack.onFrameAvailable(surfaceTexture);
            }
        }

    };

    /** 启动编码 **/
    public void startMedia() {
        if (null != mSegmentedFront && null != mSegmentedBack) {
            mSegmentedFront.startMediaRecorder();
            mSegmentedBack.startMediaRecorder();
        }
    }

    /** 停止编码 **/
    public void stopMedia() {
        if (null != mSegmentedFront && null != mSegmentedBack) {
            mSegmentedFront.releaseMediaRecorder();
            mSegmentedBack.releaseMediaRecorder();
        }
    }

    /** 销毁编码器与控件 **/
    private void releaseMediaCamera() {
        if (null != mSegmentedFront) {
            mSegmentedFront.releaseCameraPreview();
            mSegmentedFront.releaseMediaRecorder();
        }
        if (null != mSegmentedBack) {
            mSegmentedBack.releaseCameraPreview();
            mSegmentedBack.releaseMediaRecorder();
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        releaseMediaCamera();
        stopForeground(true);
    }

}
";i:1;s:4:"java";i:2;N;}i:2;i:13169;}i:29;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:120:"
3.7&nbsp;&nbsp;MainActivity.java主要关注：moveTaskToBack(true);将Activity推到栈后台，而不是finish()<BR>
";}i:2;i:17901;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5474:"
public class MainActivity extends Activity implements OnClickListener {

    private static final String TAG = "SimMainActivity";

    private static final int EVT_CANCEL_WELCOME_FRAGMENT = 0;

    private FragmentManager mFragmentManager;
    private CameraProxy mCameraProxy;
    private static DisplayMetrics mDisplayMetrics;

    Button bt_memory, bt_start, bt_setting;

    SurfaceHolder mSurHolderFront, mSurHolderBack;
    Timer mTimer;

    SegmentedUtil mSegmentedFront;
    SegmentedUtil mSegmentedBack;

    boolean startFlag = true;
    private static Context mContext = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // 屏幕长亮
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        setContentView(R.layout.activity_main);
        mContext = this;
        initLayout();
        // 获取手机屏幕尺寸
        mDisplayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(mDisplayMetrics);
        registerBroadcast();

        mFragmentManager = getFragmentManager();

        switchFragment(new WelcomeFragment(), new WelcomeFragment());

        startService(new Intent(this, CameraService.class));
        mInternalHandler.sendEmptyMessageDelayed(EVT_CANCEL_WELCOME_FRAGMENT, 0);
        // 检查储存空间
        MemoryUtil.updateMemory(MainActivity.this, bt_memory);
    }

    private void initLayout() {
        bt_memory = (Button) findViewById(R.id.bt_memory);
        bt_start = (Button) findViewById(R.id.bt_start);
        bt_setting = (Button) findViewById(R.id.bt_setting);

        bt_start.setOnClickListener(this);
        bt_setting.setOnClickListener(this);
    }

    public static Context getContext() {
        return mContext;
    }

    public static DisplayMetrics getDisplayMetrics() {
        return mDisplayMetrics;
    }

    public CameraProxy getCameraProxy() {
        return mCameraProxy;
    }

    private void switchFragment(Fragment... fragment) {
        FragmentTransaction ft = mFragmentManager.beginTransaction();
        ft.replace(R.id.container_front, fragment[0]);
        ft.replace(R.id.container_back, fragment[1]);
        ft.commit();
    }

    private Handler mInternalHandler = new Handler() {
        public void handleMessage(android.os.Message msg) {
            switch (msg.what) {
                case EVT_CANCEL_WELCOME_FRAGMENT:
                    if (mCameraProxy == null) {
                        sendEmptyMessageDelayed(EVT_CANCEL_WELCOME_FRAGMENT, 2000);
                    } else {
                        switchFragment(new CameraFragment(1), new CameraFragment(0));
                    }
                    break;
                default:
                    Toast.makeText(MainActivity.this, "Error", Toast.LENGTH_SHORT).show();
                    break;
            }
        };
    };

    /** 连接Service **/
    private ServiceConnection mConn = new ServiceConnection() {

        @Override
        public void onServiceDisconnected(ComponentName name) {
            mCameraProxy = null;
        }

        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            mCameraProxy = (CameraProxy) service;
        }

    };

    /** 绑定Service **/
    private void bindService() {
        mCameraProxy = null;
        bindService(new Intent(MainActivity.this, CameraService.class), mConn,
                Service.BIND_AUTO_CREATE);
    }

    /** 解除Service绑定 **/
    private void unbindService() {
        if (mCameraProxy != null) {
            mCameraProxy = null;
            unbindService(mConn);
        }
    }

    /** 服务启动后绑定服务 **/
    private BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals(CameraProxy.ACTION_SERVICE_CREATED)) {
                bindService();
            }
        }
    };

    /** 注册绑定服务广播 **/
    private void registerBroadcast() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(CameraProxy.ACTION_SERVICE_CREATED);
        registerReceiver(mReceiver, filter);
    }

    /** 销毁绑定服务广播 **/
    private void unreginsterReceiver() {
        unregisterReceiver(mReceiver);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.bt_start:
                if (startFlag) {
                    mCameraProxy.startMediaRecorder();
                    startFlag = false;
                    bt_start.setText(R.string.stop);
                } else {
                    mCameraProxy.stopMediaRecorder();
                    startFlag = true;
                    bt_start.setText(R.string.start);
                }
                break;
            case R.id.bt_setting:
                DialogView.showSettingDialog();
                break;
            default:
                Toast.makeText(MainActivity.this, "Click error", Toast.LENGTH_LONG).show();
                break;
        }
    }

    @Override
    public void onBackPressed() {
        moveTaskToBack(true);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unreginsterReceiver();
        unbindService();
        MemoryUtil.stopTimer();
    }

}
";i:1;s:4:"java";i:2;N;}i:2;i:18034;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23521;}i:32;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:23521;}}