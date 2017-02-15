a:79:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"Android App 不漏秒分段录像方案";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:55;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:57;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:58;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:58;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"录像方案";i:1;i:2;i:2;i:58;}i:2;i:58;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:58;}i:10;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:1195:"
1. 使用 MediaRecord 周期创建停止来实现分段录像的， 由于创建 MediaRecord 需要时间，所以每一次分段都会有1秒多的画面丢失<BR>
<BR>
2. 将 MediaRecord 的数据输出到流，根据设置的分段时间，从流中取数据存储到本地。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;但是，MediaRecord 输出的流不是封装好的 MP4 码流，需要转码。这种方式，如果处理好转码，可以做到完全不漏秒<BR>
<BR>
3. 原理、流程：<BR>
&nbsp;&nbsp;&nbsp;&nbsp;1) 采集 Camera preview 数据输送到编码器 Mediacodec<BR>
&nbsp;&nbsp;&nbsp;&nbsp;2) 编码器将数据编码到 H264 码流<BR>
&nbsp;&nbsp;&nbsp;&nbsp;3) 将 H264 码流输送到 MediaMuxer<BR>
&nbsp;&nbsp;&nbsp;&nbsp;4) MediaMuxer 将 H264 封装为 MP4 格式文件<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;通过周期性销毁、创建 MediaCodec和MediaMuxer来达到分段目的，由于数据都存放在队列中。所以这种方式也不会漏秒。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;这个方案需要对MediaCodec的参数调优(比特率、帧速率、分辨率等)，参数会影响编码效率、视频文件质量以及最终分段的视频文件是否有效等。<BR>
";}i:2;i:89;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:89;}i:12;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1292;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1294;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1295;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1295;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"示例代码";i:1;i:2;i:2;i:1295;}i:2;i:1295;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1295;}i:18;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:131:"
工厂模式 + 策略模式
Activity通过工厂方法获取对应的录像策略，进而控制录像的开始、停止、分段
";}i:2;i:1326;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1326;}i:20;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1465;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1467;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1468;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1468;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"请求权限";i:1;i:3;i:2;i:1468;}i:2;i:1468;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1468;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:368:"
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.MOUNT_UNMOUNT_FILESYSTEMS" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.INTERNET"/>
";i:1;s:3:"xml";i:2;N;}i:2;i:1496;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1496;}i:28;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1877;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1879;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1880;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1880;}i:32;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"录像策略抽象类";i:1;i:3;i:2;i:1880;}i:2;i:1880;}i:33;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1880;}i:34;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1538:"
package com.sim.segvideo;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import android.annotation.SuppressLint;
import android.util.Log;
import android.view.SurfaceHolder;

public abstract class VideoRecordBase {
    protected static final String TAG = "SEG_VIDEO";
    
    public abstract void initRecord();
    public abstract void startRecord();
    public abstract void stopRecord();
    
    protected SurfaceHolder mSurfaceHolder;
    protected int mVideoWidth, mVideoHeight;
    
    private static final String FILE_PATH = "/sdcard/SegmentVideo/";
    
    public VideoRecordBase() {
        createDirIfneed();
    }
    
    public void setSurfaceHolder(SurfaceHolder holder) {
        mSurfaceHolder = holder;
    }
    
    public void setVideoSize(int width, int height) {
        mVideoWidth = width;
        mVideoHeight = height;
    }

    private void createDirIfneed() {
        File f = new File(FILE_PATH);

        if(!f.exists()) {
            f.mkdir();
        }
    }

    @SuppressLint("SimpleDateFormat")
    protected File getNewRecordFile() {
        Date d = new Date(System.currentTimeMillis());
        // 以“年-月-日-时-分-秒-毫秒”为分段视频文件命名：如 2016-05-10-13-53-22-131.mp4
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-SSS");
        
        File f = new File(FILE_PATH + sd.format(d) + ".mp4");
        Log.d(TAG, "[VideoRecord]getNewRecordFile New File:" + f.getAbsolutePath());

        return f;
    }
}
";i:1;s:4:"java";i:2;s:20:"VideoRecordBase.java";}i:2;i:1915;}i:35;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3489;}i:36;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"分段录像方案三实现类";i:1;i:3;i:2;i:3489;}i:2;i:3489;}i:37;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3489;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3489;}i:39;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:3530;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:146:"该实现未采集音频，如果需要音频，需要再添加音频采集和编码，再将编码的音频添加到MediaMuxer的音频轨道。
";}i:2;i:3533;}i:41;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:3679;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:198:"该实现，由于分段策略统计的是视频采集的时间，经过转码、压制后得到的视频文件播放时间会小于设定的分段时间，重新设计分段策略可解决该问题";}i:2;i:3682;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3886;}i:44;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:18152:"
package com.sim.segvideo;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ArrayBlockingQueue;

import android.graphics.ImageFormat;
import android.hardware.Camera;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.PreviewCallback;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.os.Build;
import android.os.Handler;
import android.util.Log;

/**
 * 原理、流程：
 * 1. 采集 Camera preview 数据输送到编码器 Mediacodec 
 * 2. 编码器将数据编码到 H264 码流 
 * 3. 将 H264 码流输送到 MediaMuxer 
 * 4. MediaMuxer 将 H264 封装为 MP4 格式文件 
 * 
 * 线程： 
 * 1) 线程1： 编码线程。循环取 YUV 队列数据输送到编码器，再从编码器取出数据，添加到 MUXER 队列 
 * 2) 线程2： 封装线程。循环从 MUXER 队列取数据输送到 MediaMuxer 封装 MP4 文件 
 * 
 * 视频分段： 
 * 1) 定时器定时发送消息
 * 2) 收到消息后，停止线程，释放 MediaEncoder 和 MediaMuxer，再重新创建
 */

public class VideoRecordImpl_v3 extends VideoRecordBase implements PreviewCallback {

    /* 编码器参数 */
    private static final String MIME_TYPE = "video/avc";
    private static final int BIT_RATE = 300 * 1000;
    private static final int FRAMES_PER_SECOND = 30;
    private static final int IFRAME_INTERVAL = 5;
    private static final int TIMEOUT_USEC = 0;

    private BaseThread mEncoderThread, mMuxerThread;
    private MediaCodec.BufferInfo mBufferInfo;
    private MediaCodec mEncoder;
    private MediaMuxer mMuxer;
    private int mTrackIndex;
    private boolean mMuxerStarted;
    private long mFakePts;

    private Camera mCamera = null;

    private static final int YUV_QUEUE_SIZE = 30;
    private static final int MUXER_QUEUE_SIZE = 20;
    /** Camera preview数据队列。等待输送到编码器 */
    private ArrayBlockingQueue<byte[]> mYUVQueue = new ArrayBlockingQueue<byte[]>(YUV_QUEUE_SIZE);
    /** 编码后的数据队列。等待输送到混合器 MediaMuxer */
    private ArrayBlockingQueue<MuxerData> mMuxerQueue = new ArrayBlockingQueue<MuxerData>(
            MUXER_QUEUE_SIZE);

    private class MuxerData {
        public int trackIndex;
        public byte[] data;
        public BufferInfo bufferInfo;
        
        public MuxerData(int index, byte[] d, BufferInfo info) {
            this.trackIndex = index;
            this.data = d;
            this.bufferInfo = info;
        }
    }

    /** 获取设备支持的编码器类型 */
    public boolean getSupportedAvcCodec() {
        if (Build.VERSION.SDK_INT >= 18) {
            for (int j = MediaCodecList.getCodecCount() - 1; j >= 0; j--) {
                MediaCodecInfo codecInfo = MediaCodecList.getCodecInfoAt(j);

                String[] types = codecInfo.getSupportedTypes();
                for (int i = 0; i < types.length; i++) {
                    Log.d(TAG, "codec type: " + types[i]);
                }
            }
        }
        return false;
    }

    @Override
    public void initRecord() {
        startcamera();
        prepareEncoder();
    }

    @Override
    public void startRecord() {
        mEncoderThread = new EncoderThread();
        mMuxerThread = new MuxerThread();

        mEncoderThread.start();
        mMuxerThread.start();

        startTimer();
    }

    @Override
    public void stopRecord() {
        mEncoderEOSFlag = true;
        stopTimer();

        if (mEncoderThread != null) {
            mEncoderThread.cancel();
            mEncoderThread = null;
        }
        if (mMuxerThread != null) {
            mMuxerThread.cancel();
            mMuxerThread = null;
        }

        releaseEncoder();

        if (mCamera != null) {
            mCamera.setPreviewCallback(null);
            mCamera.stopPreview();
            mCamera.release();
            mCamera = null;
        }
    }

    @Override
    public void onPreviewFrame(byte[] data, Camera camera) {
        if (mYUVQueue.size() >= YUV_QUEUE_SIZE) {
            mYUVQueue.poll();
            Log.d(TAG, "YUV queue discard frame");
        }
        mYUVQueue.add(data);
    }
    
    /** 配置、启动 camera */
    private void startcamera() {
        Parameters parameters = null;
        mCamera = Camera.open(0);// Get backcamera
        if (mCamera != null) {
            try {
                mCamera.setPreviewCallback(this);
                mCamera.setDisplayOrientation(90);
                if (parameters == null) {
                    parameters = mCamera.getParameters();
                }
                parameters = mCamera.getParameters();

                // 获取设备支持的画面尺寸
                // List<Size> picSize = parameters.getSupportedPictureSizes();
                // List<Size> preSize = parameters.getSupportedPreviewSizes();
                // for(int i = 0; i < picSize.size(); i++) {
                // Log.d(TAG, "pic size: " + picSize.get(i).width + "  " +
                // picSize.get(i).height);
                // }
                // for(int i = 0; i < preSize.size(); i++) {
                // Log.d(TAG, "pre size: " + preSize.get(i).width + "  " +
                // preSize.get(i).height);
                // }

                parameters.setPreviewFormat(ImageFormat.NV21);
                parameters.setPictureSize(mVideoWidth, mVideoHeight);
                parameters.setPreviewSize(mVideoWidth, mVideoHeight);
                List<String> focusModes = parameters.getSupportedFocusModes();
                if (focusModes.contains(Camera.Parameters.FOCUS_MODE_CONTINUOUS_VIDEO)) {
                    parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_CONTINUOUS_VIDEO);
                }
                if (focusModes.contains(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE)) {
                    parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE);
                }
                mCamera.setParameters(parameters);

                mCamera.autoFocus(null);

                mCamera.setPreviewDisplay(mSurfaceHolder);
                mCamera.startPreview();

            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            Log.d(TAG, "Create camera fail");
        }
    }// startcamera()

    /** 配置编码器 */
    private void prepareEncoder() {
        try {
            mBufferInfo = new MediaCodec.BufferInfo();

            MediaFormat format = MediaFormat
                    .createVideoFormat(MIME_TYPE, mVideoWidth, mVideoHeight);

            format.setInteger(MediaFormat.KEY_COLOR_FORMAT,
                    MediaCodecInfo.CodecCapabilities.COLOR_FormatYUV420SemiPlanar);
            format.setInteger(MediaFormat.KEY_BIT_RATE, BIT_RATE);
            format.setInteger(MediaFormat.KEY_FRAME_RATE, FRAMES_PER_SECOND);
            format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, IFRAME_INTERVAL);

            mEncoder = MediaCodec.createEncoderByType(MIME_TYPE);
            mEncoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
            mEncoder.start();

            /* 创建混合器，用于将编码后的数据封装为 MP4 */
            mMuxer = new MediaMuxer(getNewRecordFile().getAbsolutePath(),
                    MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);

            mTrackIndex = -1;
            mMuxerStarted = false;
        } catch (IOException e) {
            Log.d(TAG, "[VideoRecordImpl_v3]prepareEncoder ERROR: " + e.getMessage());
        }
    }

    private void releaseEncoder() {
        Log.d(TAG, "releasing encoder objects");
        if (mEncoder != null) {
            mEncoder.stop();
            mEncoder.release();
            mEncoder = null;
        }
        if (mMuxer != null) {
            mMuxer.stop();
            mMuxer.release();
            mMuxer = null;
        }
    }

    private boolean mEncoderEOSFlag = false;
    /** 从编码器取出数据 */
    private void drainEncoder() {
        if (mEncoderEOSFlag) {
            try {
                Log.d(TAG, "sending EOS to encoder");
                mEncoder.signalEndOfInputStream();
            } catch (Exception e) {
                Log.d(TAG, "[VideoRecordImpl_v3]drainEncoder signalEndOfInputStream ERROR: "
                        + e.getMessage());
            }
        }

        ByteBuffer[] encoderOutputBuffers = mEncoder.getOutputBuffers();
        while (true) {
            try {
                int encoderStatus = mEncoder.dequeueOutputBuffer(mBufferInfo, TIMEOUT_USEC);
                if (encoderStatus == MediaCodec.INFO_TRY_AGAIN_LATER) {
                    // no output available yet
                    if (!mEncoderEOSFlag) {
                        Log.d(TAG,
                                "[VideoRecordImpl_v3]INFO_TRY_AGAIN_LATER no EOS flag, break while.");
                        break; // out of while
                    } else {
                        Log.d(TAG,
                                "[VideoRecordImpl_v3]INFO_TRY_AGAIN_LATER no output available, spinning to await EOS");
                    }
                } else if (encoderStatus == MediaCodec.INFO_OUTPUT_BUFFERS_CHANGED) {
                    Log.d(TAG, "[VideoRecordImpl_v3]INFO_OUTPUT_BUFFERS_CHANGED");
                    // not expected for an encoder
                    encoderOutputBuffers = mEncoder.getOutputBuffers();
                } else if (encoderStatus == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    // should happen before receiving buffers, and should only
                    // happen once
                    if (mMuxerStarted) {
                        throw new RuntimeException("format changed twice");
                    }
                    MediaFormat newFormat = mEncoder.getOutputFormat();
                    Log.d(TAG, "[VideoRecordImpl_v3]INFO_OUTPUT_FORMAT_CHANGED newFormat: "
                            + newFormat);

                    // now that we have the Magic Goodies, start the muxer
                    mTrackIndex = mMuxer.addTrack(newFormat);
                    mMuxer.start();
                    mMuxerStarted = true;
                } else if (encoderStatus < 0) {
                    Log.w(TAG,
                            "[VideoRecordImpl_v3]unexpected result from encoder.dequeueOutputBuffer: "
                                    +
                                    encoderStatus);
                    // let's ignore it
                } else {
                    ByteBuffer encodedData = encoderOutputBuffers[encoderStatus];
                    if (encodedData == null) {
                        throw new RuntimeException("encoderOutputBuffer " + encoderStatus +
                                " was null");
                    }

                    if ((mBufferInfo.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) != 0) {
                        // The codec config data was pulled out and fed to the
                        // muxer
                        // when we got
                        // the INFO_OUTPUT_FORMAT_CHANGED status. Ignore it.
                        Log.d(TAG, "[VideoRecordImpl_v3]ignoring BUFFER_FLAG_CODEC_CONFIG");
                        mBufferInfo.size = 0;
                    }

                    if (mBufferInfo.size != 0) {
                        if (!mMuxerStarted) {
                            throw new RuntimeException("muxer hasn't started");
                        }

                        // adjust the ByteBuffer values to match BufferInfo
                        encodedData.position(mBufferInfo.offset);
                        encodedData.limit(mBufferInfo.offset + mBufferInfo.size);
                        mBufferInfo.presentationTimeUs = mFakePts;
                        mFakePts += 1000000L / FRAMES_PER_SECOND;

                        /* 将编码后的数据添加到混合器队列 */
                        byte[] temp = new byte[mBufferInfo.size];
                        encodedData.get(temp);
                        MuxerData md = new MuxerData(mTrackIndex, temp, mBufferInfo);
                        if (mMuxerQueue.size() >= MUXER_QUEUE_SIZE) {
                            mMuxerQueue.poll();
                            Log.d(TAG, "[VideoRecordImpl_v3]drainEncoder discard muxer data");
                        }
                        mMuxerQueue.add(md);
                        Log.d(TAG, "[VideoRecordImpl_v3]sent " + mBufferInfo.size
                                + " bytes to muxer");
                    }

                    mEncoder.releaseOutputBuffer(encoderStatus, false);

                    if ((mBufferInfo.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                        if (!mEncoderEOSFlag) {
                            Log.w(TAG, "[VideoRecordImpl_v3]reached end of stream unexpectedly");
                        } else {
                            Log.d(TAG, "[VideoRecordImpl_v3]end of stream reached");
                        }
                        break; // out of while
                    }
                }
            } catch (Exception e) {
                Log.d(TAG, "[VideoRecordImpl_v3]drainEncoder ERROR: " + e.getMessage());
                continue;
            }
        }// while true
    }// drainEncoder

    /** 编码线程 */
    private class EncoderThread extends BaseThread {

        public void run() {
            mmIsRunning = true;
            long pts = 0;
            long generateIndex = 0;
            byte[] input = null;

            while (mmIsRunning) {
                if (mEncoder == null || mMuxer == null)
                    continue;

                if (mYUVQueue.size() > 0) {
                    input = mYUVQueue.poll();
                } else {
                    continue;
                }

                if (input == null)
                    continue;

                try {
                    /* 把从队列中去除的数据输送给编码器 */
                    ByteBuffer[] inputBuffers = mEncoder.getInputBuffers();
                    int inputBufferIndex = mEncoder.dequeueInputBuffer(-1);// 设置-1，等到有一个可用的buffer才返回。
                    if (inputBufferIndex >= 0) {
                        pts = computePresentationTime(generateIndex);
                        ByteBuffer inputBuffer = inputBuffers[inputBufferIndex];
                        inputBuffer.clear();
                        inputBuffer.put(input);
                        mEncoder.queueInputBuffer(inputBufferIndex, 0, input.length, pts, 0);
                        generateIndex += 1;
                    }
                } catch (Exception e) {
                    Log.d(TAG, "[VideoRecordImpl_v3]EncoderThread ERROR: " + e.getMessage());
                }

                /* 从编码器取出数据 */
                drainEncoder();
            }// while
        }

        private long computePresentationTime(long frameIndex) {
            return 132 + frameIndex * 1000000 / FRAMES_PER_SECOND;
        }
    };

    /** 封装线程 */
    private class MuxerThread extends BaseThread {

        public void run() {
            mmIsRunning = true;
            MuxerData data;
            while (mmIsRunning) {
                if (mEncoder == null || mMuxer == null)
                    continue;

                if (mMuxerQueue.size() > 0) {
                    data = mMuxerQueue.poll();
                } else {
                    continue;
                }
                if (data == null)
                    continue;

                try {
                    /* 把从队列取出的数据输送给混合器, 封装 MP4 文件 */
                    mMuxer.writeSampleData(data.trackIndex, ByteBuffer.wrap(data.data),
                            data.bufferInfo);
                    Log.d(TAG, "[VideoRecordImpl_v3]mMuxerThread write MP4 data");
                } catch (Exception e) {
                    Log.d(TAG, "[VideoRecordImpl_v3]mMuxerThread ERROR: " + e.getMessage());
                }
            }// while
        };
    };

    private abstract class BaseThread extends Thread {
        protected boolean mmIsRunning = false;

        public void cancel() {
            mmIsRunning = false;
        };
    }

    /**
     *  视频分段策略。
     *  由于统计的是视频采集的时间，经过转码、压制后得到的视频文件播放时间会小于设定的分段时间 
     */
    private Timer mTimer = null;
    private long mSegTime = 0;
    private void startTimer() {
        stopTimer();

        mSegTime = Utils.getSegmentTime(MainActivity.getContext()) * 60 * 1000;

        mTimer = new Timer();
        mTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                Log.d(TAG, "Restart encoder and muxer");
                mHandler.sendEmptyMessage(0);
            }
        }, mSegTime, mSegTime);
    }

    private void stopTimer() {
        if (mTimer != null) {
            mTimer.cancel();
            mTimer = null;
        }
    }

    public void restart() {
        mEncoderEOSFlag = true;

        mEncoderThread.cancel();
        mEncoderThread = null;

        mMuxerThread.cancel();
        mMuxerThread = null;

        releaseEncoder();
        prepareEncoder();

        mEncoderThread = new EncoderThread();
        mMuxerThread = new MuxerThread();
        mEncoderEOSFlag = false;
        mEncoderThread.start();
        mMuxerThread.start();
    }

    private Handler mHandler = new Handler() {
        public void handleMessage(android.os.Message msg) {
            restart();
            
            //如果更新了分段时间，需要重新设置Timer
            if(mSegTime != Utils.getSegmentTime(MainActivity.getContext()) * 60 * 1000) {
                startTimer();
            }
        };
    };
}
";i:1;s:4:"java";i:2;s:23:"VideoRecordImpl_v3.java";}i:2;i:3886;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3886;}i:46;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:22077;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:22079;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22080;}i:49;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22080;}i:50;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"分段录像方案二。未完全实现";i:1;i:3;i:2;i:22080;}i:2;i:22080;}i:51;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:22080;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22080;}i:53;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:22130;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:147:"录像数据以流的方式输出，其码流不是封装好的MP4码流，在分段存储时需要对数据做MP4格式封装。MP4封装未实现";}i:2;i:22133;}i:55;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22286;}i:56;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:5555:"
package com.sim.segvideo;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Timer;
import java.util.TimerTask;

import android.media.MediaRecorder;
import android.os.ParcelFileDescriptor;
import android.util.Log;

/**
 * 1. 开始录像
 * 2. 视频数据输入到本地流
 * 3. 线程中读本地流，写入文件
 * 4. 到指定时间，更换写入的文件
 * 5. 停止录像 
 * 
 * 未实现。录像数据以流的方式输出，其码流不是封装好的MP4码流，在分段存储时需要对数据做MP4格式封装。
 */
public class VideoRecordImpl_v2 extends VideoRecordBase {

    private MediaRecorder mMediaRecord;
    private ReceiverThread mReceiverThread;
    
    public VideoRecordImpl_v2() {
        super();
    }
    
    ParcelFileDescriptor readSide, writeSide;
    @Override
    public void initRecord() {
        try {
//            RandomAccessFile raf = new RandomAccessFile("/sdcard/SegSock.mp4", "rws");
//            mFd = raf.getFD();
            
            Log.d(TAG, "[VideoRecordImpl_v2]initRecord. Init local socket");
            
            ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createPipe();
            readSide = pipe[0];
            writeSide = pipe[1];
            
        } catch (IOException e) { 
            Log.d(TAG, "[VideoRecordImpl_v2]initRecord. ERROR: " + e.getMessage());
        }
        
        configMediaRecord();
    }

    @Override
    public void startRecord() {
        try {
            mMediaRecord.prepare();
            mMediaRecord.start();
        } catch (IllegalStateException e) {
            Log.d(TAG, "[VideoRecordImpl_v2]startRecord. ERROR: " + e.getMessage());
        } catch (IOException e) {
            Log.d(TAG, "[VideoRecordImpl_v2]startRecord. ERROR: " + e.getMessage());
        }
        
        if(mReceiverThread != null) {
            mReceiverThread.cancel();
            mReceiverThread = null;
        }
        mReceiverThread = new ReceiverThread();
        mReceiverThread.start();
        startTimer();
    }

    @Override
    public void stopRecord() {
        stopTimer();
        if (mMediaRecord != null) {
            mMediaRecord.stop();
            mMediaRecord.release();
            mMediaRecord = null;
        }

        if(mReceiverThread != null) {
            mReceiverThread.cancel();
            mReceiverThread = null;
        }
        
        try {
            readSide.close();
            writeSide.close();
        } catch (IOException e) { }
    }

    private void configMediaRecord() {
        //configCamera();

        mMediaRecord = new MediaRecorder();
        //mMediaRecord.setCamera(mCamera);
        // 设置从摄像头采集图像
        mMediaRecord.setVideoSource(MediaRecorder.VideoSource.CAMERA);

        // 设置视频的输出格式
        mMediaRecord.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
        mMediaRecord.setVideoEncoder(MediaRecorder.VideoEncoder.H264);
        mMediaRecord.setVideoSize(mVideoWidth, mVideoHeight);
        mMediaRecord.setVideoFrameRate(20);
        // 指定SurfaceView来预览视频
        if (mSurfaceHolder != null) {
            mMediaRecord.setPreviewDisplay(mSurfaceHolder.getSurface());
        }
        
        //将录像数据输出到 管道流
        mMediaRecord.setOutputFile(writeSide.getFileDescriptor());
        Log.d(TAG, "[VideoRecordImpl_v2]configMediaRecord");
    }
    
    private boolean mReplaceFileFlag = false;
    private synchronized void setReplaceFileFlag(boolean flag) {
        mReplaceFileFlag = flag;
    }

    private class ReceiverThread extends Thread {
        private boolean mmRunning = false;
        private InputStream mmIns = null;
        private OutputStream mmOus = null;

        @Override
        public void run() {
            try {
                //mmIns = mReceiver.getInputStream();
                mmIns = new ParcelFileDescriptor.AutoCloseInputStream(readSide);
                Log.d(TAG, "[VideoRecordImpl_v2]ReceiverThread. create mmIns");
                mmOus = new FileOutputStream(getNewRecordFile());
                byte[] buffer = new byte[1024 * 1024];
                int ret = 0;
                
                mmRunning = true;
                while(mmRunning) {
                    if(mReplaceFileFlag) {
                        setReplaceFileFlag(false);
                        mmOus.close();
                        mmOus = new FileOutputStream(getNewRecordFile());
                    }

                    ret = mmIns.read(buffer);
                    if(ret > 0) {
                        mmOus.write(buffer, 0, ret);
                    }
                }
            } catch (IOException e) { }
        }
        
        public void cancel() {
            mmRunning = false;
            try {
                mmIns.close();
                mmOus.close();
            } catch (IOException e) { }
        }
    }// end ReceiverThread
    
    private Timer mTimer = null;
    private void startTimer() {
        stopTimer();

        int segTime = Utils.getSegmentTime(MainActivity.getContext()) * 60 * 1000;

        mTimer = new Timer();
        mTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                setReplaceFileFlag(true);
            }
        }, segTime, segTime);
    }

    private void stopTimer() {
        if (mTimer != null) {
            mTimer.cancel();
            mTimer = null;
        }
    }
}
";i:1;s:4:"java";i:2;s:23:"VideoRecordImpl_v2.java";}i:2;i:22286;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22286;}i:58;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:27880;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:27882;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:27883;}i:61;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:27883;}i:62;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Activity 类";i:1;i:3;i:2;i:27883;}i:2;i:27883;}i:63;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:27883;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:27883;}i:65;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:27906;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"调用工厂方法创建录像策略、显示预览界面";}i:2;i:27909;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:27972;}i:68;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:3623:"
package com.sim.segvideo;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.EditText;

import com.sim.segvideo.VideoRecordFactory.RecordStrategy;

public class MainActivity extends Activity implements SurfaceHolder.Callback{
    
    private static final String TAG = "SEG_VIDEO";
    
    private static final int VIDEO_WIDTH = 640;
    private static final int VIDEO_HEIGHT = 480;
    
    private SurfaceHolder mSurfaceHolder;
    private VideoRecordBase mVideoRecord;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mContext = this;
        
        mVideoRecord = VideoRecordFactory.createVideoRecord(RecordStrategy.Strategy_V3);
        
        SurfaceView surfaceView = (SurfaceView)findViewById(R.id.surfaceView);
        mSurfaceHolder = surfaceView.getHolder();
        mSurfaceHolder.addCallback(this);
    }
    
    private static Context mContext = null;
    public static Context getContext() {
        return mContext;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_setting_time) {
            /* 在 ActionBar 显示菜单，创建Dialog用于设置分段时间 */
            LayoutInflater factory = LayoutInflater.from(MainActivity.this);
            final View view = factory.inflate(R.layout.edittext_dialog, null);
            final EditText edit = (EditText) view.findViewById(R.id.edit_seg_time);
            final String t = "" + Utils.getSegmentTime(MainActivity.this);
            edit.setText(t);

            new AlertDialog.Builder(MainActivity.this)
                    .setTitle(R.string.dia_title_set_seg_time)
                    .setView(view)
                    .setPositiveButton(android.R.string.ok,
                            new android.content.DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {
                                    String ret = edit.getText().toString();
                                    if(!ret.equals(t)) {
                                        Utils.setSegmentTime(MainActivity.this, Integer.parseInt(ret));
                                    }
                                }
                            })
                    .setNegativeButton(android.R.string.cancel, null)
                    .create()
                    .show();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
    
    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        /* Do Nothing */
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        mVideoRecord.setSurfaceHolder(mSurfaceHolder);
        mVideoRecord.setVideoSize(VIDEO_WIDTH, VIDEO_HEIGHT);
        mVideoRecord.initRecord();
        mVideoRecord.startRecord();
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        mVideoRecord.stopRecord();
    }
}
";i:1;s:4:"java";i:2;s:17:"MainActivity.java";}i:2;i:27972;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:27972;}i:70;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:31627;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:31629;}i:72;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:31630;}i:73;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31630;}i:74;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"工厂类";i:1;i:3;i:2;i:31630;}i:2;i:31630;}i:75;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:31630;}i:76;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:648:"
package com.sim.segvideo;

public final class VideoRecordFactory {

    public enum RecordStrategy {
        Strategy_V1, Strategy_V1_1, Strategy_V2, Strategy_V3
    }
    
    public static VideoRecordBase createVideoRecord(RecordStrategy strategy) {
        switch(strategy) {
            case Strategy_V1:
                return new VideoRecordImpl_v1();
            case Strategy_V1_1:
                return new VideoRecordImpl_v1_1();
            case Strategy_V2:
                return new VideoRecordImpl_v2();
            case Strategy_V3:
                return new VideoRecordImpl_v3();
        }
        
        return null;
    }
}
";i:1;s:4:"java";i:2;s:23:"VideoRecordFactory.java";}i:2;i:31655;}i:77;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32341;}i:78;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:32341;}}