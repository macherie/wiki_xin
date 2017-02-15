a:142:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:147:"                                                扫描头尺寸转换的分析
                                                            --胡建";}i:2;i:0;}i:2;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:" 转换提示: 读下面的文字时，希望大家结合图片看，这样更易理解
 在YUV420中，一个像素点对应一个Y，一个";}i:2;i:155;}i:4;a:3:{i:0;s:14:"multiplyentity";i:1;a:2:{i:0;s:1:"2";i:1;s:1:"2";}i:2;i:296;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:512:"的小方块对应一个U和V。对于所有YUV420图像，它们的Y值排列是完全相同的，因为只有Y的图像就是灰度图像。
 YUV420sp与YUV420p的数据格式它们的UV排列在原理上是完全不同的。420p它是先把U存放完后，再存放V，也就是说UV它们是连续的。而420sp它是UV、UV这样交替存放的。(见下图)
 有了上面的理论，我就可以准确的计算出一个YUV420在内存中存放的大小。
width * hight =Y（总和）
U = Y / 4  
V = Y / 4";}i:2;i:299;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:811;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:811;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"所以YUV420 数据在内存中的长度是 width * hight * 3 / 2，";}i:2;i:814;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:882;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:882;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"假设一个分辨率为";}i:2;i:884;}i:12;a:3:{i:0;s:14:"multiplyentity";i:1;a:2:{i:0;s:1:"8";i:1;s:1:"4";}i:2;i:908;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"的YUV图像，它们的格式如下图：";}i:2;i:911;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:953;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:66:"   YUV420sp格式如下图            YUV420p数据格式如下图";}i:2;i:953;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:953;}i:17;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:35:":android:camera:1346422959_6364.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1023;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"   ";}i:2;i:1067;}i:19;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:35:":android:camera:1346422970_2927.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:1070;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1114;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1114;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:337:"我们在扫描头在解码的时候就遇到了一个类似的难题，在nodisplay_preview_stream_cb_routine函数处理过程中,含有meta数据的bufsize与解码需要的尺寸存在不匹配，导致解码会超时
后来通过算法解决了这个难题，这个算法就用到了上面的理论：
以下是算法具体内容：";}i:2;i:1153;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1491;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:613:"  camera_memory_t *data = NULL;
  size_t previewBufSize = 0;
  size_t previewBufSizeFromCallback = 0;
  cam_dimension_t preview_dim;
  cam_format_t previewFmt;
  int32_t rc = NO_ERROR;
  int32_t yStride = 0;
  int32_t yScanline = 0;
  int32_t uvStride = 0;
  int32_t uvScanline = 0;
  int32_t uStride = 0;
  int32_t uScanline = 0;
  int32_t vStride = 0;
  int32_t vScanline = 0;
  int32_t yStrideToApp = 0;
  int32_t uvStrideToApp = 0;
  int32_t yScanlineToApp = 0;
  int32_t uvScanlineToApp = 0;
  int32_t srcOffset = 0;
  int32_t dstOffset = 0;
  int32_t srcBaseOffset = 0;
  int32_t dstBaseOffset = 0;
  int i;";}i:2;i:1491;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1491;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"通过superframe 获取preview的memory";}i:2;i:2152;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2191;}i:28;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:453:"  QCameraGrallocMemory *memory = (QCameraGrallocMemory *)super_frame->bufs[0]->mem_info;
  uint32_t idx = frame->buf_idx;
  if ((NULL == stream) || (NULL == memory)) {
ALOGE("%s: Invalid preview callback input", __func__);
return ;
  }
  cam_stream_info_t *streamInfo =
          reinterpret_cast<cam_stream_info_t *>(stream->getStreamInfoBuf()->getPtr(0));
  if (NULL == streamInfo) {
      ALOGE("%s: Invalid streamInfo", __func__);
      return ;
  }";}i:2;i:2191;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2191;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"通过streaminfo获取y,uv分量的值和previewBufSize 和callback的值";}i:2;i:2668;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2741;}i:32;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:835:"  stream->getFrameDimension(preview_dim);
  stream->getFormat(previewFmt);
  yStride = streamInfo->buf_planes.plane_info.mp[0].stride;
  yScanline = streamInfo->buf_planes.plane_info.mp[0].scanline;
  uvStride = streamInfo->buf_planes.plane_info.mp[1].stride;
  uvScanline = streamInfo->buf_planes.plane_info.mp[1].scanline;
  yStrideToApp = preview_dim.width;
  yScanlineToApp = preview_dim.height;
  uvStrideToApp = yStrideToApp;
  uvScanlineToApp = yScanlineToApp / 2;
  previewBufSize = (size_t)
          ((yStrideToApp * yScanlineToApp) + (uvStrideToApp * uvScanlineToApp));
  previewBufSizeFromCallback = (size_t)
          ((yStride * yScanline) + (uvStride * uvScanline));
  data = memory->getMemory(idx, false);
  if (!preview_mem || !preview_mem->data) {
      ALOGE("%s: mGetMemory failed.\n", __func__);
      return ;
  }";}i:2;i:2741;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2741;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:"这个是核心算法，用来移除多余的height分量，此时转换的尺寸是768*480 ";}i:2;i:3616;}i:35;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:3708;}i:36;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:">>";}i:2;i:3710;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" 752*480";}i:2;i:3712;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3720;}i:39;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:653:"  for (i = 0; i < preview_dim.height; i++) {
      srcOffset = i * yStride;
      dstOffset = i * yStrideToApp;
      memcpy((unsigned char *) preview_mem->data + dstOffset,
              (unsigned char *) data->data + srcOffset, (size_t) yStrideToApp);
  }
  srcBaseOffset = yStride * yScanline;
  dstBaseOffset = yStrideToApp * yScanlineToApp;
  for (i = 0; i < preview_dim.height/2; i++) {
      srcOffset = i * uvStride + srcBaseOffset;
      dstOffset = i * uvStrideToApp + dstBaseOffset;
      memcpy((unsigned char *) preview_mem->data + dstOffset,
              (unsigned char *) data->data + srcOffset,
              (size_t) yStrideToApp);
  }";}i:2;i:3720;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3720;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"传给CBdata处理";}i:2;i:4406;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4424;}i:43;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:747:"      if (pme->needProcessPreviewFrame() &&
          pme->mDataCb != NULL &&
          pme->msgTypeEnabledWithLock(CAMERA_MSG_PREVIEW_FRAME) > 0 ) {
          qcamera_callback_argm_t cbArg;
          memset(&cbArg, 0, sizeof(qcamera_callback_argm_t));
          cbArg.cb_type = QCAMERA_DATA_CALLBACK;
          cbArg.msg_type = CAMERA_MSG_PREVIEW_FRAME;
          cbArg.data = preview_mem;
          cbArg.user_data = (void *) &frame->buf_idx;
          cbArg.cookie = stream;
          cbArg.release_cb = returnStreamBuffer;
          int32_t rc = pme->m_cbNotifier.notifyCallback(cbArg);
          if (rc != NO_ERROR) {
              ALOGE("%s: fail sending data notify", __func__);
              stream->bufDone(frame->buf_idx);
          }  }";}i:2;i:4424;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4424;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"RGB Bayer Color分析";}i:2;i:5206;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5227;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5227;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:198:"拜耳色彩滤波阵列（Bayer Color Filter Array，CFA）是非常有名的彩色图片的数字采集格式。色彩滤波器的模式如上图所示，由一半的G，1/4的R，1/4的B组成。";}i:2;i:5229;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5427;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5427;}i:51;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:aa.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:5429;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5460;}i:53;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5460;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:"拜耳色彩滤波器的模式、序列、滤波器有很多种，但最常见的模式是由Kodak提出的2*2模式。";}i:2;i:5463;}i:55;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5582;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5582;}i:57;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:bb.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:5585;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5616;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5616;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"当Image Sensor往外逐行输出数据时，像素的序列为GRGRGR";}i:2;i:5618;}i:61;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:5687;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"/BGBGBG";}i:2;i:5690;}i:63;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:5697;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:"（顺序RGB）。这样阵列的Sensor设计，使得RGB传感器减少到了全色传感器的1/3，如下所示。";}i:2;i:5700;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5817;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5817;}i:67;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:cc.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:5820;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5851;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5851;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:201:"图像传感器的结构如下所示，每一个感光像素之间都有金属隔离层，光纤通过显微镜头，在色彩滤波器过滤之后，投射到相应的漏洞式硅的感光元件上。";}i:2;i:5854;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6055;}i:72;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6055;}i:73;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:dd.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:6057;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6088;}i:75;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6088;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"白平衡调节（White Balance）";}i:2;i:6091;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6125;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6125;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:183:"色彩传感器并不能像人眼那样直接感应图像，因此为了保证最终图像的真实性，必须经过一些白平衡处理以及色彩校正等算法来修正图像。";}i:2;i:6127;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6310;}i:81;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6310;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:433:"原始像素的第一步处理操作就是白平衡调节。一个白色物体每通道的白平衡都应该是相同的，即R=G=B。通过白色物体的采集以及直方图分析，拥有最高级别白平衡的通道被作为目标通道，而其他两个通道通过增益达到匹配，如下：R'=aG'=bB'。同时，随着光源的不同，白平衡也应该相应的调节。
Bayer插值补偿算法（Bayer Interpolation）";}i:2;i:6312;}i:83;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6745;}i:84;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6745;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"1) 插值红蓝算法实现";}i:2;i:6747;}i:86;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6774;}i:87;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6774;}i:88;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:351:"每一个像素仅仅包括了光谱的一部分，必须通过插值来实现每个像素的RGB值。为了从Bayer格式得到每个像素的RGB格式，我们需要通过插值填补缺失的2个色彩。插值的方法有很多（包括领域、线性、3*3等），速度与质量权衡，最好的线性插值补偿算法。其中算法如下：";}i:2;i:6776;}i:89;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7127;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7127;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"R和B通过线性领域插值，但这有四种不同的分布，如下图所示：";}i:2;i:7129;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7212;}i:93;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7212;}i:94;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:ee.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:7214;}i:95;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7245;}i:96;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7245;}i:97;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"（a）                                （b）";}i:2;i:7259;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7305;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7305;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"在（a）与（b）中，R和B分别取领域的平均值。";}i:2;i:7308;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7369;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7369;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"2) 插值绿算法实现";}i:2;i:7371;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7395;}i:105;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7395;}i:106;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:ff.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:7397;}i:107;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7428;}i:108;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7428;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"（c）                                （d）";}i:2;i:7431;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7477;}i:111;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7477;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"在（c）与（d）中，取领域的4个B或R的均值作为中间像素的B值。";}i:2;i:7479;}i:113;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7563;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7563;}i:115;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:gg.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:7565;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7596;}i:117;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7596;}i:118;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:374:"由于人眼对绿光反应最敏感，对紫光和红光则反应较弱，因此为了达到更好的画质，需要对G特殊照顾。在上述（c）与（d）中，扩展开来就是上图的（e）与（f）中间像素G的取值，者也有一定的算法要求，不同的算法效果上会有差异。经过相关的研究，（e）中间像素G值的算法如下：";}i:2;i:7598;}i:119;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7972;}i:120;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7972;}i:121;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:hh.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:7975;}i:122;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8006;}i:123;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8006;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" （e）             ";}i:2;i:8009;}i:125;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8030;}i:126;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8030;}i:127;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"（f）中间像素G值的算法如下：
 （f）";}i:2;i:8034;}i:128;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8084;}i:129;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8084;}i:130;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:jj.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:8086;}i:131;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8117;}i:132;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8117;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:543:"CMOS摄像头这部分转换是在内部用ADC或者ISP完成的，生产商为了降低成本必然会使得图像失真。当然用外部处理器来实现转换，如果处理器的速度足够NB，能够胜任像素的操作，用上面的算法来进行转换，皆大欢喜。不过上述算法将直接成倍提高了算法的复杂度，速度上将会有所限制。因此为了速度的提成，可以直接通过来4领域G取均值来中间像素的G值，将会降低一倍的速率，而在性能上差之甚微，算法如下：";}i:2;i:8120;}i:134;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8663;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8663;}i:136;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:22:":android:camera:kk.png";i:1;s:0:"";i:2;N;i:3;s:3:"200";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:8665;}i:137;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8696;}i:138;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8696;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:"如果能够通过损失图像的额质量，来达到更快的速度，还可以取G1、G2的均值来实现，但是这样的做法会导致边沿以及跳变部分的失真。";}i:2;i:8699;}i:140;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8699;}i:141;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8699;}}