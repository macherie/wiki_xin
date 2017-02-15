a:27:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"代码实例";i:1;i:3;i:2;i:4;}i:2;i:4;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4;}i:3;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:26;}i:4;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:26;}i:5;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:26;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:" 一、解除MTK对MediaRecorder双摄像头编码限制";}i:2;i:30;}i:7;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:86;}i:8;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:86;}i:9;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:86;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:86;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:"    修改路径: vendor/mediatek/proprietary/platform/mt6735/hardware/mtkcam/D1/hwutils/CamManager.cpp";}i:2;i:87;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:196;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:339:"
getPermission() const
{
    Mutex::Autolock _l(mLockMtx);
    MY_LOGD("mDeviceCnt(%d), mbRecord(%d), mbAvailable(%d), mbStereo(%d), 0:fps(%d); 1:fps(%d)",
            mDeviceCnt, mbRecord, mbAvailable, mbStereo, getFrameRate(0), getFrameRate(1));
    //return !mbRecord && mbAvailable && !mbStereo;
    return mbAvailable && !mbStereo;
}
";i:1;s:1:"c";i:2;N;}i:2;i:196;}i:14;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:545;}i:15;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:545;}i:16;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:545;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:" 二、封装编码器、Camera图像预览工具类";}i:2;i:549;}i:18;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:601;}i:19;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:601;}i:20;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:601;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:601;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"    2.1 创建工具类父类";}i:2;i:602;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:637;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2995:"
public abstract class SegmentedBase {

    private static final String TAG = "SimSegmentedBase";

    protected SurfaceHolder mSurfaceHolder;

    /** 录制文件路径 **/
    public static final String FILE_PATH = "/sdcard/SegmentVideo/";
    public static final String FILE_BACK_PATH = "Back/";
    public static final String FILE_FRONT_PATH = "Front/";

    /** 编码器参数 **/
    public static final int RECODER_FRAMERATE = 30;// 帧率
    public static final int RECODER_BITRATE = 30 * 1024 * 1024;// 比特率

    /** 前摄 **/
    public static final int CAMERA_ID_FRONT = 1;
    public static final int VIDEO_WIDTH_FRONT = 640;
    public static final int VIDEO_HEIGHT_FRONT = 480;

    /** 后摄 **/
    public static final int CAMERA_ID_BACK = 0;
    public static final int VIDEO_WIDTH_BACK = 1920;
    public static final int VIDEO_HEIGHT_BACK= 1080;

    public SegmentedBase() {
        createFileDir();
    }

    public void setSurfaceHolder(SurfaceHolder surfaceHolder) {
        this.mSurfaceHolder = surfaceHolder;
    }

    public abstract void startCameraPreview(SurfaceTexture st);
    public abstract void releaseCameraPreview();

    public abstract void startMediaRecorder();
    public abstract void releaseMediaRecorder();

    /** 创建文件夹 **/
    private static void createFileDir() {
        File path = new File(FILE_PATH);
        File back = new File(FILE_PATH + FILE_BACK_PATH);
        File front = new File(FILE_PATH + FILE_FRONT_PATH);
        if (!path.exists()) {
            path.mkdir();
        }
        if (!back.exists()) {
            back.mkdir();
        }
        if (!front.exists()) {
            front.mkdir();
        }
    }

    /** 根据ID区分存储路线 **/
    public static File getNewRecordFile(int cameraId) {
        createFileDir();
        File file = null;
        try {
            Date d = new Date(System.currentTimeMillis());
            // 以“年-月-日-时-分-秒-毫秒”为分段视频文件命名：如 2016-05-10-13-53-22-131.mp4
            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS");
            String filePath = "";

            if (cameraId == CAMERA_ID_BACK) {
                filePath = FILE_PATH + FILE_BACK_PATH;
            } else if (cameraId == CAMERA_ID_FRONT){
                filePath = FILE_PATH + FILE_FRONT_PATH;
            } else {
                filePath = FILE_PATH;
            }

            if (!"".equals(filePath) && null != filePath) {
                file = new File(filePath + sd.format(d) + ".mp4");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }

    /** 默认SegmentVideo根目录存储 **/
    public static File getNewRecordFile() {
        Date d = new Date(System.currentTimeMillis());
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS");
        File f = new File(FILE_PATH + sd.format(d) + ".mp4");
        return f;
    }

}

";i:1;s:4:"java";i:2;N;}i:2;i:637;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3646;}i:26;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3646;}}