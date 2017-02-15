a:55:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"概述";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:753:"录音模块主要包含三个类，Recorder.java，SoundRecorder.java，VUMeter.java。Recorder类负责SoundRecorder的全部功能方面的实现，它包含一个MediaRecorder成员和一个MediaPlayer成员，并封装了这两个成员的相关操作。该类向SoundRecorder类提供一系列的接口来控制录音和播放录音的过程。SoundRecorder类本身是一个Activity。该类负责实现一切向用户显示的部分：包括界面，对各种操作的响应。录音、保存录音、播放录音等功能通过调用Recorder类中的方法实现。在SoundRecorder中包含一个Recorder类的对象mRecorder。VUMeter类继承自View类，是一个自定义组件，在界面中用于向用户显示录音时音量的大小。";}i:2;i:20;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:773;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:775;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Recorder.java";i:1;i:1;i:2;i:775;}i:2;i:775;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:775;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:775;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"Recorder类有两个重要的成员变量：录音器和播放器";}i:2;i:801;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:872;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
    MediaRecorder mRecorder = null;
    MediaPlayer mPlayer = null;
";i:1;s:4:"java";i:2;N;}i:2;i:872;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:872;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:"分别在startRecording方法和startPlayback方法中得到初始化，其中startRecording方法是启动录音功能";}i:2;i:955;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1080;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3713:"
    public void startRecording(int outputfileformat, String extension, Context context, int audiosourcetype, int codectype) {
        stop();
        
        mSampleFile = null;
        if (mSampleFile == null) {
            //File sampleDir = Environment.getExternalStorageDirectory();
            File sampleDir = new File(Environment.getExternalStorageDirectory().getPath() + "/RECORDER");
            if(!sampleDir.exists()) {
                sampleDir.mkdirs() ;
            }
            if (!sampleDir.canWrite()) // Workaround for broken sdcard support on the device.
                sampleDir = Environment.getExternalStorageDirectory();

            StringBuffer lFileName = new StringBuffer("Recorder-") ;
            Time time = new Time();
            time.setToNow();
            String day = time.format2445();
            if(day.contains("T")) {
                day = day.replace("T", "_");
            }
            lFileName.append(day);
            lFileName.append(extension) ;

            try {
                //mSampleFile = File.createTempFile(SAMPLE_PREFIX, extension, sampleDir);
                mSampleFile = new File(sampleDir, lFileName.toString()) ;
            } catch (Exception e) {
                setError(SDCARD_ACCESS_ERROR);
                return;
            }
        }
        mRecorder = new MediaRecorder();
        mRecorder.setAudioSource(audiosourcetype);
        //set channel for surround sound recording.
        if (mChannels > 0) {
            mRecorder.setAudioChannels(mChannels);
        }
        if (mSamplingRate > 0) {
            mRecorder.setAudioSamplingRate(mSamplingRate);
        }

        mRecorder.setOutputFormat(outputfileformat);

        try {
            mRecorder.setAudioEncoder(codectype);
        } catch(RuntimeException exception) {
            setError(UNSUPPORTED_FORMAT);
            mRecorder.reset();
            mRecorder.release();
            if (mSampleFile != null)
               mSampleFile.delete();
            mSampleFile = null;
            mSampleLength = 0;
            mRecorder = null;
            return;
        }

        mRecorder.setOutputFile(mSampleFile.getAbsolutePath());

        // Handle IOException
        try {
            mRecorder.prepare();
        } catch(IOException exception) {
            setError(RECORDING);
            mRecorder.reset();
            mRecorder.release();
            if (mSampleFile != null)
               mSampleFile.delete();
            mSampleFile = null;
            mSampleLength = 0;
            mRecorder = null;
            return;
        }
        // Handle RuntimeException if the recording couldn't start
        Log.e(TAG,"audiosourcetype " +audiosourcetype);
        try {
            mRecorder.start();
        } catch (RuntimeException exception) {
            AudioManager audioMngr = (AudioManager)context.getSystemService(Context.AUDIO_SERVICE);
            boolean isInCall = ((audioMngr.getMode() == AudioManager.MODE_IN_CALL) ||
                    (audioMngr.getMode() == AudioManager.MODE_IN_COMMUNICATION));
            if (isInCall) {
                if (isVTCall()) {
                    setError(IN_VIDEO_CALL_ERROR);
                } else {
                    setError(IN_CALL_RECORD_ERROR);
                }
            } else {
                setError(RECORDING);
            }
            mRecorder.reset();
            mRecorder.release();
            if (mSampleFile != null)
                mSampleFile.delete();
            mSampleFile = null;
            mSampleLength = 0;
            mRecorder = null;
            return;
        }
        mSampleStart = System.currentTimeMillis();
        setState(RECORDING_STATE);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:1080;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1080;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"而startPlayback方法的功能是开始播放持有的录音文件";}i:2;i:4807;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4880;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:701:"
    public void startPlayback() {
        stop();
        
        mPlayer = new MediaPlayer();
        try {
            mPlayer.setDataSource(mSampleFile.getAbsolutePath());
            mPlayer.setOnCompletionListener(this);
            mPlayer.setOnErrorListener(this);
            mPlayer.prepare();
            mPlayer.start();
        } catch (IllegalArgumentException e) {
            setError(INTERNAL_ERROR);
            mPlayer = null;
            return;
        } catch (IOException e) {
            setError(SDCARD_ACCESS_ERROR);
            mPlayer = null;
            return;
        }
        
        mSampleStart = System.currentTimeMillis();
        setState(PLAYING_STATE);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:4880;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4880;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"与启动录音相对应的是关闭录音功能";}i:2;i:5595;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5649;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:315:"
    public void stopRecording() {
        if (mRecorder == null)
            return;

        mRecorder.stop();
        mRecorder.reset();
        mRecorder.release();
        mRecorder = null;

        mSampleLength = (int)( (System.currentTimeMillis() - mSampleStart)/1000 );
        setState(IDLE_STATE);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:5649;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5649;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:94:"startPlayback方法是开始播放持有的录音文件，相应的就会有停止播放功能";}i:2;i:5978;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6078;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:222:"
    public void stopPlayback() {
        if (mPlayer == null) // we were not in playback
            return;

        mPlayer.stop();
        mPlayer.release();
        mPlayer = null;
        setState(IDLE_STATE);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:6078;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6078;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"暂停播放";}i:2;i:6314;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6332;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:203:"
    public void pausePlayback(){
        if (mPlayer != null){
            if(mPlayer.isPlaying()){
                mPlaybackPause = true;
                mPlayer.pause();
            }
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:6332;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6332;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"继续播放";}i:2;i:6549;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6567;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:200:"
    public void resumePlayback(){
        if (mPlayer != null){
            if(mPlaybackPause){
                mPlaybackPause = false;
                mPlayer.start();
            }
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:6567;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6781;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"SoundRecorder.java";i:1;i:1;i:2;i:6781;}i:2;i:6781;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:6781;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6781;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:276:"SoundRecorder类中有个内部类RemainingTimeCalculator。它负责计算存储介质剩余空间能够存放多长的录音文件。其中的timeRemaining()函数负责计算剩余时间，取文件大小限制和空间大小限制的较小的一个来计算剩余时间。";}i:2;i:6812;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7094;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2016:"
    public long timeRemaining() {
        // Calculate how long we can record based on free disk space
        
        StatFs fs = new StatFs(mSDCardDirectory.getAbsolutePath());
        //long blocks = fs.getAvailableBlocks();
        long blocks = 0;
        if(fs.getAvailableBlocks() - SDCRAD_LAST_SPACE >1){
            blocks = fs.getAvailableBlocks() - SDCRAD_LAST_SPACE;
        }
        long blockSize = fs.getBlockSize();
        long now = System.currentTimeMillis();
        
        if (mBlocksChangedTime == -1 || blocks != mLastBlocks) {
            mBlocksChangedTime = now;
            mLastBlocks = blocks;
        }

        /* The calculation below always leaves one free block, since free space
           in the block we're currently writing to is not added. This
           last block might get nibbled when we close and flush the file, but 
           we won't run out of disk. */
        
        // at mBlocksChangedTime we had this much time
        long result = mLastBlocks*blockSize/mBytesPerSecond;
        // so now we have this much time
        result -= (now - mBlocksChangedTime)/1000;
        
        if (mRecordingFile == null) {
            mCurrentLowerLimit = DISK_SPACE_LIMIT;
            return result;
        }
        
        // If we have a recording file set, we calculate a second estimate
        // based on how long it will take us to reach mMaxBytes.
        
        mRecordingFile = new File(mRecordingFile.getAbsolutePath());
        long fileSize = mRecordingFile.length();
        if (mFileSizeChangedTime == -1 || fileSize != mLastFileSize) {
            mFileSizeChangedTime = now;
            mLastFileSize = fileSize;
        }

        long result2 = (mMaxBytes - fileSize)/mBytesPerSecond;
        result2 -= (now - mFileSizeChangedTime)/1000;
        result2 -= 1; // just for safety
        
        mCurrentLowerLimit = result < result2
            ? DISK_SPACE_LIMIT : FILE_SIZE_LIMIT;
        
        return Math.min(result, result2);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:7094;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7094;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:155:"在onCreate方法里初始化界面组件与成员变量，其中初始化了mRecorder变量，之后的录音与播放功能都是用该变量实现的。";}i:2;i:9124;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9285;}i:47;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3344:"
    public void onCreate(Bundle icycle) {
        super.onCreate(icycle);

        Intent intent = getIntent();
        if (intent != null) {
            String s = intent.getType();
            if (AUDIO_AMR.equals(s) || AUDIO_3GPP.equals(s) || AUDIO_ANY.equals(s)
                    || ANY_ANY.equals(s)) {
                mRequestedType = s;
            } else if (s != null) {
                // we only support amr and 3gpp formats right now 
                setResult(RESULT_CANCELED);
                finish();
                return;
            }
            
            final String EXTRA_MAX_BYTES
                = android.provider.MediaStore.Audio.Media.EXTRA_MAX_BYTES;
            mMaxFileSize = intent.getLongExtra(EXTRA_MAX_BYTES, -1);
        }
        
        if (AUDIO_ANY.equals(mRequestedType) || ANY_ANY.equals(mRequestedType)) {
            mRequestedType = AUDIO_3GPP;
        }
        
        mRequestedType = AUDIO_AMR; // Default type

        setContentView(R.layout.main);

        mRecorder = new Recorder();
        mRecorder.setOnStateChangedListener(this);
        mRemainingTimeCalculator = new RemainingTimeCalculator();

        PowerManager pm 
            = (PowerManager) getSystemService(Context.POWER_SERVICE);
        mWakeLock = pm.newWakeLock(PowerManager.SCREEN_DIM_WAKE_LOCK, 
                                    "SoundRecorder");

        initResourceRefs();
        
        setResult(RESULT_CANCELED);
        registerExternalStorageListener();
        registerPowerOffListener();
        if (icycle != null) {
            Bundle recorderState = icycle.getBundle(RECORDER_STATE_KEY);
            if (recorderState != null) {
                mRecorder.restoreState(recorderState);
                mSampleInterrupted = recorderState.getBoolean(SAMPLE_INTERRUPTED_KEY, false);
                mMaxFileSize = recorderState.getLong(MAX_FILE_SIZE_KEY, -1);

                int showAndExit = recorderState.getInt(DIALOG_STATE_KEY);
                mLastFileName = recorderState.getString(LAST_FILE_NAME_KEY);
                if (showAndExit != -1) showDialogAndExit(showAndExit == 1);
            }
        }
        mTelephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        mPhoneStateListener = getPhoneStateListener();

        AudioManager audioManager = (AudioManager)getSystemService(Context.AUDIO_SERVICE);
        String ssrRet = audioManager.getParameters("ssr");
        if (ssrRet.contains("=true")) {
            Log.d(TAG,"Surround sound recording is supported");
            bSSRSupported = true;
        } else {
            Log.d(TAG,"Surround sound recording is not supported");
            bSSRSupported = false;
        }
        bHandleKeyEvt = SystemProperties.getBoolean("debug.soundrecorder.encoding", false);

        updateUi();
        //{[SIMT-lizhonggui-2013-08-28] the bug 8763
        final IntentFilter recorderStateFilter = new IntentFilter();
        recorderStateFilter.addAction(ACTION_CAMERA_CAPTURE);
        recorderStateFilter.addAction(ACTION_THEME_CHANGE);
        recorderStateFilter.addAction(Intent.ACTION_LOCALE_CHANGED);

        mRecorderStateReceiver = new RecorderStateReceiver();
        registerReceiver(mRecorderStateReceiver, recorderStateFilter);
        //[SIMT-lizhonggui-2013-08-28] the bug 8763}
    }
";i:1;s:4:"java";i:2;N;}i:2;i:9285;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9285;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:96:"对录音和播放的各个功能比如开始，暂停等功能的实现主要是如下方法：";}i:2;i:12643;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12745;}i:51;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6341:"
    public void onClick(View button) {
        if (!button.isEnabled())
            return;

        switch (button.getId()) {
            case R.id.recordButton:
                mRemainingTimeCalculator.reset();
                if (!Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
                    mSampleInterrupted = true;
                    // When turn on usb storage, sd card is unavailable.
                    mErrorUiMessage = getResources().getString(R.string.sd_card_unavailable);
                    updateUi();
                } else if (!mRemainingTimeCalculator.diskSpaceAvailable()) {
                    mSampleInterrupted = true;
                    mErrorUiMessage = getResources().getString(R.string.storage_is_full);
                    updateUi();
                } else {
                    stopAudioPlayback();
                    AudioManager audioManager = (AudioManager)getSystemService(Context.AUDIO_SERVICE);
                    //because of send broadcast to OFF FM is an asynchronous Process
                    //so sometimes it need little time,Otherwise startRecordin will be error
                    if (audioManager.isFMActive()) {
                        SystemClock.sleep(100);
                    }

                    mRecorder.removeObsoletedFile();
                    if (AUDIO_AMR.equals(mRequestedType)) {
                        mRemainingTimeCalculator.setBitRate(BITRATE_AMR);
                        mRecorder.startRecording(MediaRecorder.OutputFormat.RAW_AMR, ".amr", this, mAudioSourceType, MediaRecorder.AudioEncoder.AMR_NB);
                    } else if (AUDIO_EVRC.equals(mRequestedType)) {
                        mRemainingTimeCalculator.setBitRate(BITRATE_AMR);
                        mRecorder.startRecording(MediaRecorder.OutputFormat.QCP, ".qcp", this, mAudioSourceType, MediaRecorder.AudioEncoder.EVRC);
                    } else if (AUDIO_QCELP.equals(mRequestedType)) {
                        mRemainingTimeCalculator.setBitRate(BITRATE_AMR);
                        mRecorder.startRecording(MediaRecorder.OutputFormat.QCP, ".qcp", this, mAudioSourceType, MediaRecorder.AudioEncoder.QCELP);
                    } else if (AUDIO_3GPP.equals(mRequestedType)) {
                        mRemainingTimeCalculator.setBitRate(BITRATE_3GPP);
                        mRecorder.startRecording(MediaRecorder.OutputFormat.THREE_GPP, ".3gpp", this, mAudioSourceType, MediaRecorder.AudioEncoder.AMR_NB);
                    } else if (AUDIO_AAC_MP4.equals(mRequestedType)) {
                        mRemainingTimeCalculator.setBitRate(BITRATE_3GPP);
                        mRecorder.startRecording(MediaRecorder.OutputFormat.THREE_GPP, ".3gpp", this, mAudioSourceType, MediaRecorder.AudioEncoder.AAC);
                    } else if (AUDIO_AAC_5POINT1_CHANNEL.equals(mRequestedType)) {//AAC  6-channel recording
                        if (true == bSSRSupported) {
                          mRemainingTimeCalculator.setBitRate(BITRATE_3GPP);
                          mRecorder.setChannels(6);
                          mRecorder.setSamplingRate(SAMPLERATE_MULTI_CH);
                          mAudioSourceType = MediaRecorder.AudioSource.MIC;
                          mRecorder.startRecording(MediaRecorder.OutputFormat.THREE_GPP, ".3gpp", this, mAudioSourceType, MediaRecorder.AudioEncoder.AAC);
                        } else {
                          throw new IllegalArgumentException("Invalid output file type requested");
                        }
                    } else if (AUDIO_WAVE_6CH_LPCM.equals(mRequestedType)) {//WAVE LPCM  6-channel recording
                        if (true == bSSRSupported) {
                          mRemainingTimeCalculator.setBitRate(BITRATE_3GPP);
                          mRecorder.setChannels(6);
                          mRecorder.setSamplingRate(SAMPLERATE_MULTI_CH);
                          mAudioSourceType = MediaRecorder.AudioSource.MIC;
                          mRecorder.startRecording(MediaRecorder.OutputFormat.WAVE, ".wav", this, mAudioSourceType, MediaRecorder.AudioEncoder.LPCM);
                        } else {
                          throw new IllegalArgumentException("Invalid output file type requested");
                        }
                    } else {
                        throw new IllegalArgumentException("Invalid output file type requested");
                    }
                    
                    if (mMaxFileSize != -1) {
                        mRemainingTimeCalculator.setFileSizeLimit(
                                mRecorder.sampleFile(), mMaxFileSize);
                    }
                }
                break;
            case R.id.playButton:
                stopAudioPlayback();
                mRecorder.startPlayback();
                break;
            case R.id.stopButton:
                mRecorder.stop();
                // Display the tips of stop record
                mTitle.setVisibility(View.VISIBLE);
                mTitle.setText(getResources().getString(R.string.recording_stopped));
                mStateLED.setVisibility(View.VISIBLE);
                break;
            case R.id.acceptButton:
                mRecorder.stop();
                saveSampleAndExit(true);
                mRecorder.reset() ;
                break;
            case R.id.discardButton:
                mRecorder.delete();
                //prompt before exit
                //[SIMT-kun.mao-20130705] fix bug 8472 {
                /*new AlertDialog.Builder(this)
                    .setTitle(R.string.app_name)
                    .setMessage(R.string.file_discard)
                    .setPositiveButton(R.string.button_ok,
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                                finish();
                            }
                        }
                    )
                    .setCancelable(false)
                    .show(); */
                updateMessage();
                Toast.makeText(this,R.string.file_discard,Toast.LENGTH_SHORT).show();
                //[SIMT-kun.mao-20130705] fix bug 8472 }
                break;
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:12745;}i:52;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6:"
    
";i:1;s:4:"java";i:2;N;}i:2;i:19106;}i:53;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19125;}i:54;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:19125;}}