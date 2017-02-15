a:59:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"录像一段时间后会自动停止问题";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:58;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:101:"用UCAM录像一段时间后会自动停止，查一下看是UCAM的问题还是我们系统问题。";}i:2;i:60;}i:6;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:161;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:163;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:163;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:131:"测试发现用UCAM每次录像到27.04min录像自动停掉，用我们自己的Camera发现每次录到38.24min会自动停掉，";}i:2;i:165;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:296;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:296;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:"仔细看录像的详细信息发现两个的resolution不一样，但是大小均是3.8G，这样问题就定位到录像最大文件大小限制了。";}i:2;i:298;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:450;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:452;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:45:"libmediaplayerservice/StagefrightRecorder.cpp";i:1;i:2;i:2;i:452;}i:2;i:452;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:452;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:452;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"void StagefrightRecorder::setupMPEG4MetaData";}i:2;i:512;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:556;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:556;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"(int64_t startTimeUs, int32_t totalBitRate,sp<MetaData> *meta){";}i:2;i:558;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:621;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:525:"  (*meta)->setInt64(kKeyTime, startTimeUs);
  (*meta)->setInt32(kKeyFileType, mOutputFormat);
  (*meta)->setInt32(kKeyBitRate, totalBitRate);
  (*meta)->setInt32(kKey64BitFileOffset, mUse64BitFileOffset);//use 64bit file offset
  if (mMovieTimeScale > 0) {
      (*meta)->setInt32(kKeyTimeScale, mMovieTimeScale);
  }
  if (mTrackEveryTimeDurationUs > 0) {
      (*meta)->setInt64(kKeyTrackTimeStatus, mTrackEveryTimeDurationUs);
  }
  if (mRotationDegrees != 0) {
      (*meta)->setInt32(kKeyRotation, mRotationDegrees);
  }";}i:2;i:621;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:621;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:1174;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1175;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1178;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:50:"frameworks/av/media/libstagefright/MPEG4Writer.cpp";i:1;i:2;i:2;i:1178;}i:2;i:1178;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1178;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1178;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"static const int64_t kMax64BitFileSize = 0x00ffffffffLL; \/\/fat32 max size limited to 4GB";}i:2;i:1243;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1333;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1333;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"status_t MPEG4Writer::start(MetaData *param) {";}i:2;i:1335;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1382;}i:36;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:55:"if (mInitCheck != OK) {
      return UNKNOWN_ERROR;
  }";}i:2;i:1382;}i:37;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:299:"  /*
   * Check mMaxFileSizeLimitBytes at the beginning
   * since mMaxFileSizeLimitBytes may be implicitly
   * changed later for 32-bit file offset even if
   * user does not ask to set it explicitly.
   */
  if (mMaxFileSizeLimitBytes != 0) {
      mIsFileSizeLimitExplicitlyRequested = true;
  }";}i:2;i:1445;}i:38;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:324:"  int32_t use64BitOffset = 0;
  if (param &&
      param->findInt32(kKey64BitFileOffset, &use64BitOffset) &&
      use64BitOffset) {
      mUse32BitOffset = false;
      if (mMaxFileSizeLimitBytes == 0) {
          mMaxFileSizeLimitBytes = kMax64BitFileSize;//max file limit bytes use 64bit file offset
      }
 ............";}i:2;i:1764;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1764;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:2109;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2110;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2110;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"bool MPEG4Writer::exceedsFileSizeLimit() {";}i:2;i:2113;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2155;}i:45;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:74:"  // No limit
  if (mMaxFileSizeLimitBytes == 0) {
      return false;
  }";}i:2;i:2155;}i:46;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:235:"  int64_t nTotalBytesEstimate = static_cast<int64_t>(mEstimatedMoovBoxSize);
  for (List<Track *>::iterator it = mTracks.begin();
       it != mTracks.end(); ++it) {
      nTotalBytesEstimate += (*it)->getEstimatedTrackSizeBytes();
  }";}i:2;i:2239;}i:47;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:364:"  if (!mStreamableFile) {
      // Add 1024 bytes as error tolerance
      return nTotalBytesEstimate + 1024 >= mMaxFileSizeLimitBytes;
  }
  // Be conservative in the estimate: do not exceed 95% of
  // the target file limit. For small target file size limit, though,
  // this will not help.
  return (nTotalBytesEstimate >= (95 * mMaxFileSizeLimitBytes) / 100);";}i:2;i:2486;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2486;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:2868;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2869;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2869;}i:52;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2871;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:118:"通过以上代码可发现，录像理论的最大大小是4G，系统取4G*95%=3.8G作为实际最大大小限制。";}i:2;i:2873;}i:54;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2991;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"
把95改为10后，进行录像到0.4G时停掉，即验证猜想。";}i:2;i:2993;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3062;}i:57;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3063;}i:58;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3063;}}