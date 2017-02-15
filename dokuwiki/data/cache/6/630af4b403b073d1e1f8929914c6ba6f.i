a:27:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"分段录像方案中间层实现";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"研发平台：MT6735";}i:2;i:49;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:71;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:71;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"一、方案概述";i:1;i:3;i:2;i:71;}i:2;i:71;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:71;}i:9;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:160:"
1.1&nbsp;&nbsp;为上层提供分段录像的API，通过层层调用最终在MPEG4Writer.cpp中具体实现不漏秒，不漏帧的分段录像方案<BR><BR>
";}i:2;i:106;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:275;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"二、MPEG4Writer.cpp介绍";i:1;i:3;i:2;i:275;}i:2;i:275;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:275;}i:13;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:1132:"
2.1&nbsp;&nbsp;三个主要线程：<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;video轨迹线程：接收视频源得到的视频帧数据，维护视频轨迹的索引信息，当收到的帧数据达到一定数量后，将数据链表中的视频帧打包成chunk<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;audio轨迹线程：接收音频源得到的音频帧数据，维护音频轨迹的索引信息，当收到的帧数据达到一定数量后，将数据链表中的音频帧打包成chunk<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;写线程：将轨迹线程打包好的chunk数据写入文件<BR><BR>
2.2&nbsp;&nbsp;录像实现流程：<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.录像开始：开启视频、音频两个轨迹线程，开启写线程，将头部信息写入文件。轨迹线程将收到的帧数据打包，通知写线程将chunk数据写入文件。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.录像结束：将轨迹线程中数据链表中的数据打包成chunk，通知写线程将所有未写入文件的chunk写入文件，停止轨迹线程，将轨迹线程的索引信息写入文件尾部，视频文件封装完成。<BR><BR>
";}i:2;i:318;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1459;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"三、分段方案详述";i:1;i:3;i:2;i:1459;}i:2;i:1459;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1459;}i:17;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:1443:"
&nbsp;&nbsp;基于MPEG4Writer原有逻辑，改造轨迹线程和写线程实现分段方案<BR>
3.1&nbsp;&nbsp;轨迹线程改造<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.视频轨迹收到分段信号，判断当前帧是否关键帧，不是则继续等待，是则通知音频轨迹分段。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.将数据链表中的数据打包成chunk，记录当前时间戳为分段时间戳。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.将当前轨迹线程的索引信息，Durationtime等关键信息传递给对应的分段索引，分段Durationtime<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.将当前轨迹线程的一些变量恢复到初始状态，以保证当前帧作为第一帧被处理<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.记录当前轨迹线程分段处理完成<BR><BR>
3.1&nbsp;&nbsp;写线程改造<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.收到分段信号，判断当前chunk的时间戳，小于分段时间戳：将当前chunk写入文件，等于分段时间戳:将当前chunk写入文件并记录视（音）频最后chunk写入完成，大于分段时间戳:不处理。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.视频和音频轨迹的最后chunk都已经写入文件,将轨迹线程保存的分段索引信息写入文件尾部。<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.关闭当前文件，打开下一分段视频文件，将写线程的关键变量重置，写入视频文件头部信息，关闭分段状态。<BR>
";}i:2;i:1500;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2952;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"四、关键代码";i:1;i:3;i:2;i:2952;}i:2;i:2952;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2952;}i:21;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:39:"
3.1&nbsp;&nbsp;轨迹线程改造<BR>
";}i:2;i:2987;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:7516:"
 //start  seperate
        if(mOwner->getflagRestart()){
            bool flag=false;
            if(!mIsAudio){
                if(mOwner->getflagTrackRestart()){
                    if(isSync!=0){
                        flag=true;
                        mOwner->setflagAudioTrackRestart(true);
                        }
                    }
                }else{
                if(mOwner->getflagAudioTrackRestart()){
                    flag=true;
                    }
                }
                if(flag){
                    ALOGD("Restart :%s ", trackName);
                    ALOGD("Restart :mChunkSamples%d", mChunkSamples.size());

                    //record enveriment
                      mStartTimestampUs_Restart=mStartTimestampUs;
                      mMinCttsOffsetTimeUs_restart=mMinCttsOffsetTimeUs;
                      mMaxCttsOffsetTimeUs__restart=mMaxCttsOffsetTimeUs;
                      mStszTableEntries_resart=mStszTableEntries;
                      mStcoTableEntries_restart= mStcoTableEntries;
                      mStscTableEntries_restart= mStscTableEntries;
                      mStssTableEntries_restart= mStssTableEntries;
                      mSttsTableEntries_restart=mSttsTableEntries;
                      mCttsTableEntries_restart=mCttsTableEntries;
                      mCo64TableEntries_restart=mCo64TableEntries;
                      mTrackDurationUs_restart=mTrackDurationUs;

                      if(!mIsAudio){
                        mOwner->setStartTimestampUsRestart(mOwner->getStartTimestampUs());
                        mOwner->ResetStartTimestampUs(0ll);
                        }
                        mTrackRestartDone=true;
                        //bufferchunk
                    if(!mChunkSamples.empty()){
                        int tmptimeStampUs=lastTimestampUs;
                        addOneStscTableEntry(++nChunks, mChunkSamples.size());
                        bufferChunk(tmptimeStampUs);
                        /////////////////////
                        /////////////////////
                        mRestartbufferchunkStampUs=tmptimeStampUs;
                        }
                    else{
                        mRestartbufferchunkStampUs=chunkTimestampUs;
                        if(mWritenFileTimestamp==mRestartbufferchunkStampUs){
                            if(isAudio()){
                                ALOGI("Audio chunk already writen");
                                mOwner->setflagAudioDone(true);
                            }else{
                                ALOGI("Vedio chunk already writen");
                                mOwner->setflagVedioDone(true);
                            }
                        }
                      }
                      // We don't really know how long the last frame lasts, since
                      // there is no frame time after it, just repeat the previous
                      // frame's duration.
                     if (mStszTableEntries->count() == 1) {
#ifdef MTK_AOSP_ENHANCEMENT //Do not set duration to 0 even if there is only one frame in this track
		        ALOGW("Only one frame in %s track, Set scaled duration to 1", mIsAudio? "audio": "video");
		        if (mTimeScale >= 1000000LL) {
			    lastDurationUs = 1;
		        } else {
			    lastDurationUs = (1000000LL + (mTimeScale >> 1)) / mTimeScale;
		        }
		        lastDurationTicks = (lastDurationUs * mTimeScale + 5E5) / 1E6;
#else
                        lastDurationUs = 0;  // A single sample's duration
                        lastDurationTicks = 0;
#endif
                        } else {
                            ++sampleCount;  // Count for the last sample
                        }
                        if (mStszTableEntries->count() <= 2) {
                            addOneSttsTableEntry(1, lastDurationTicks);
                            if (sampleCount - 1 > 0) {
                                addOneSttsTableEntry(sampleCount - 1, lastDurationTicks);
                             }
                         } else {
                             addOneSttsTableEntry(sampleCount, lastDurationTicks);
                         }

                         // The last ctts box may not have been written yet, and this
                         // is to make sure that we write out the last ctts box.
                         if (currCttsOffsetTimeTicks == lastCttsOffsetTimeTicks) {
                            if (cttsSampleCount > 0) {
                                addOneCttsTableEntry(cttsSampleCount, lastCttsOffsetTimeTicks);
                                }
                            }

                         mTrackDurationUs_restart+= lastDurationUs;
                         mReachedEOS = true;
                         sendTrackSummary(hasMultipleTracks);
                         ALOGI("Received total/0-length (%d/%d) buffers and encoded %d frames. - %s",
                            count, nZeroLengthFrames, mStszTableEntries->count(), trackName);
                         ALOGI("counttest:%d - %s",counttst, trackName);
                         ALOGI("mchunsamplerecieve:%d - %s",mchunsamplerecieve, trackName);
                         if (mIsAudio) {
                            ALOGI("Audio track drift time: %" PRId64 " us", mOwner->getDriftTimeUs());
                         }

                      //reset varible
                      mStszTableEntries=new ListTableEntries<uint32_t>(1000, 1);
                      mStcoTableEntries=new ListTableEntries<uint32_t>(1000, 1);
                      mCo64TableEntries=new ListTableEntries<off64_t>(1000, 1);
                      mStscTableEntries=new ListTableEntries<uint32_t>(1000, 3);
                      mStssTableEntries=new ListTableEntries<uint32_t>(1000, 1);
                      mSttsTableEntries=new ListTableEntries<uint32_t>(1000, 2);
                      mCttsTableEntries=new ListTableEntries<uint32_t>(1000, 2);
                      mStartTimestampUs=-1;
                      mTrackDurationUs=0;
                      //reset local var
                      count = 1;
                      chunkTimestampUs = 0;
                      nChunks = 0;
                      nZeroLengthFrames = 0;
                      lastTimestampUs = 0;      // Previous sample time stamp
                      lastDurationUs = 0;       // Between the previous two samples
                      currDurationTicks = 0;    // Timescale based ticks
                      lastDurationTicks = 0;    // Timescale based ticks
                      sampleCount = 1;          // Sample count in the current stts table entry
                      previousSampleSize = 0;  // Size of the previous sample
                      previousPausedDurationUs = lastSouceTimestampUs;
                      cttsOffsetTimeUs = 0;
                      currCttsOffsetTimeTicks = 0;   // Timescale based ticks
                      lastCttsOffsetTimeTicks = -1;  // Timescale based ticks
                      cttsSampleCount = 0;           // Sample count in the current ctts table entry
                      lastSamplesPerChunk = 0;
                      mMdatSizeBytes=sampleSize;

                      if(!mIsAudio){
                        mOwner->setflagTrackRestart(false);
                        }else{
                        mOwner->setflagAudioTrackRestart(false);
                        }
                        flag=false;

                        }
                }
";i:1;s:1:"c";i:2;N;}i:2;i:3039;}i:23;a:3:{i:0;s:9:"htmlblock";i:1;a:1:{i:0;s:36:"
3.2&nbsp;&nbsp;写线程改造<BR>
";}i:2;i:10572;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5586:"
void MPEG4SegWriter::threadFunc() {
    ALOGV("threadFunc");

    prctl(PR_SET_NAME, (unsigned long)"MPEG4SegWriter", 0, 0, 0);

#ifdef MTK_AOSP_ENHANCEMENT
    androidSetThreadPriority(0, ANDROID_PRIORITY_DISPLAY); // -4, to have favorable IO priority
#endif
    Mutex::Autolock autoLock(mLock);
    while (!mDone) {
        Chunk chunk;
        bool chunkFound = false;

        while (!mDone && !(chunkFound = findChunkToWrite(&chunk))) {
            mChunkReadyCondition.wait(mLock);
        }

        // In real time recording mode, write without holding the lock in order
        // to reduce the blocking time for media track threads.
        // Otherwise, hold the lock until the existing chunks get written to the
        // file.
        if (chunkFound) {
            if (mIsRealTimeRecording) {
                mLock.unlock();
            }
            ALOGD("chunk.mTimeStampUs %"PRId64"",chunk.mTimeStampUs);
            ALOGD("bufferchunkStampUs %"PRId64"",chunk.mTrack->getRestartBufferChunkStampUs());
            if (mRestart&&chunk.mTrack->getRestartBufferChunkStampUs() > 0) {
                if (chunk.mTimeStampUs<=chunk.mTrack->getRestartBufferChunkStampUs()) {
                    if (chunk.mTrack->getRestartBufferChunkStampUs()-chunk.mTimeStampUs<2000000LL) {
                        writeChunkToFile(&chunk);
                    }
                }
            } else {
                 writeChunkToFile(&chunk);
            }

            if (mIsRealTimeRecording) {
                mLock.lock();
            }

            ///////////////////////////////////////////////
            //qidongran add
            if (mRestart) {
                 ALOGD("threadFunc");
                if (mAudioDone && mVedioDone) {
                    ALOGD("all Done");
                    //write moov box
                    writeMoovBoxforRestart();
                    //close file
                     close(mFd);
                     mFd = -1;
                     ALOGD("close mfd %d",mFd);
                     notify(MEDIA_RECORDER_EVENT_INFO, 999, 0);
                    //write header
                    ALOGD("write header begin");
                    mOffset = 0;
                    mMdatOffset = 0;
                    mWriteMoovBoxToMemory = false;
                    mMoovBoxBuffer = NULL;
                    mMoovBoxBufferOffset = 0;
                    mFd = mswitchFd;
                    #ifdef USE_FILE_CACHE
	                mWriterCacheSize = DEFAULT_FILE_CACHE_SIZE;
	                char param1[PROPERTY_VALUE_MAX];
	                int32_t value1;
	                property_get("vr.writer.cache.size", param1, "-1");
	                value1 = atoi(param1);
	                ALOGD("value1=%d", value1);
	                if((value1 > 0) && (value1 < LOW_MEM_PROTECT_THRESHOLD))
	                {
		            mWriterCacheSize = value1;
	                }
	                ALOGD("@@[RECORD_PROPERTY]writer.cache.size = %d", mWriterCacheSize);
	                mCacheWriter = new MPEG4SegFileCacheWriter(mFd, mWriterCacheSize);
	                CHECK(mCacheWriter != NULL);
	                mCacheWriter->setOwner(this);
                    #endif
                    writeFtypBox(mRestartParam);
                    mFreeBoxOffset = mOffset;

                    if (mEstimatedMoovBoxSize == 0) {
                        int32_t bitRate = -1;
                        if (mRestartParam) {
                            mRestartParam->findInt32(kKeyBitRate, &bitRate);
                        }
                        mEstimatedMoovBoxSize = estimateMoovBoxSize(bitRate);
                    }

                    CHECK_GE(mEstimatedMoovBoxSize, 8);

                    if (mStreamableFile) {
                    // Reserve a 'free' box only for streamable file
#if defined(MTK_AOSP_ENHANCEMENT) && defined(USE_FILE_CACHE)
		mCacheWriter->seek(mFreeBoxOffset, SEEK_SET);
#else
        lseek64(mFd, mFreeBoxOffset, SEEK_SET);
#endif
                    writeInt32(mEstimatedMoovBoxSize);
                     write("free", 4);
                    mMdatOffset = mFreeBoxOffset + mEstimatedMoovBoxSize;
                     } else {
                        mMdatOffset = mOffset;
                    }
                    ALOGD("mMdatOffset=%d, mOffset=%d", (int32_t)mMdatOffset, (int32_t)mOffset);
                    mOffset = mMdatOffset;
#if defined(MTK_AOSP_ENHANCEMENT) && defined(USE_FILE_CACHE)
	mCacheWriter->seek(mMdatOffset, SEEK_SET);
#else
    lseek64(mFd, mMdatOffset, SEEK_SET);
#endif
                     if (mUse32BitOffset) {
                        write("????mdat", 8);
                       } else {
                            write("\x00\x00\x00\x01mdat????????", 16);
                       }
                       ALOGD("mMdatOffset=%d, mOffset=%d", (int32_t)mMdatOffset, (int32_t)mOffset);
                    //reset status
                    mRestart = false;
                    mtrackRestart = false;
                    mVedioDone = false;
                    mAudioDone = false;
                    for (List<Track *>::iterator it = mTracks.begin();
                            it != mTracks.end(); ++it) {
                        (*it)->setDurationUsRestart(0);
                        (*it)->setRestartBufferChunkStampUs(-1);
                        (*it)->setTrackRestartDone(false);
                    }
                }
            }
        }
    }

    writeAllChunks();
#ifdef MTK_AOSP_ENHANCEMENT
	mWriterThreadExit = true;
	mWriterThreadExitCondition.signal();
	ALOGD("writer thread exit");
#endif
}
";i:1;s:1:"c";i:2;N;}i:2;i:10621;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16217;}i:26;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:16217;}}