a:18:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:245:"有未接来电或短信时都会发送notification，以此来驱动LED的亮灭状态，最后都会调用到frameworks/base/services/core/java/com/android/server/notification/NotificationManagerService.java类中的updateLightsLocked方法：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:247;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:1385:" // lock on mNotificationList
  void updateLightsLocked()
  {
      // handle notification lights
      if (mLedNotification == null) {
          // get next notification, if any
          int n = mLights.size();
          if (n > 0) {
              mLedNotification = mNotificationsByKey.get(mLights.get(n-1));
          }
      }
      // Don't flash while we are in a call or screen is on
      if (mLedNotification == null || mInCall) {
          mNotificationLight.turnOff();
          mStatusBar.notificationLightOff();
      } else {
          final Notification ledno = mLedNotification.sbn.getNotification();
          int ledARGB = ledno.ledARGB;
          int ledOnMS = ledno.ledOnMS;
          int ledOffMS = ledno.ledOffMS;
          if ((ledno.defaults & Notification.DEFAULT_LIGHTS) != 0) {
              ledARGB = mDefaultNotificationColor;
              ledOnMS = mDefaultNotificationLedOn;
              ledOffMS = mDefaultNotificationLedOff;
          }
          if (mNotificationPulseEnabled) {
              // pulse repeatedly
              // 注意，此方法即是控制LED灯闪烁
              mNotificationLight.setFlashing(ledARGB, Light.LIGHT_FLASH_TIMED,
                      ledOnMS, ledOffMS);
          }
          // let SystemUI make an independent decision
          mStatusBar.notificationLightPulse(ledARGB, ledOnMS, ledOffMS);
      }
  }
  ";}i:2;i:247;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:247;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:124:"其中mNotificationLight是frameworks/base/services/core/java/com/android/server/lights/LightsService.java类的内部类。";}i:2;i:1706;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1831;}i:8;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:680:"      @Override
      public void setFlashing(int color, int mode, int onMS, int offMS) {
          synchronized (this) {
              if (mIsQ) {
                  color = Color.BLUE;
                  // 一个消失后取消LED闪烁
                  mH.removeMessages(1);
                  mH.sendMessageDelayed(Message.obtain(mH, 1, this), 60 * 60 * 1000);
                  // 保持CPU唤醒状态，防止CPU睡眠导致LED不再闪烁
                  mH.removeMessages(2);
                  mH.sendMessageDelayed(Message.obtain(mH, 2, this), 60);
              }
              setLightLocked(color, mode, onMS, offMS, BRIGHTNESS_MODE_USER);
          }
      }
      ";}i:2;i:1831;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1831;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:108:"调用/frameworks/base/services/core/jni/com_android_server_lights_LightsService.cpp的setLight_native方法";}i:2;i:2545;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2654;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:707:"  static void setLight_native(JNIEnv *env, jobject clazz, jlong ptr, jint light, jint colorARGB, jint flashMode, jint onMS, jint offMS, jint brightnessMode) {
      Devices* devices = (Devices*)ptr;
      light_state_t state;
      if (light < 0 || light >= LIGHT_COUNT || devices->lights[light] == NULL) {
          return ;
      }
      memset(&state, 0, sizeof(light_state_t));
      state.color = colorARGB;
      state.flashMode = flashMode;
      state.flashOnMS = onMS;
      state.flashOffMS = offMS;
      state.brightnessMode = brightnessMode; {
          ALOGD_IF_SLOW(50, "Excessive delay setting light");
          devices->lights[light]->set_light(devices->lights[light], &state);
      }
  }";}i:2;i:2654;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2654;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"再进入/hardware/qcom/display/liblight/lights.c";}i:2;i:3396;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3446;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:243:"  static void handle_speaker_battery_locked(struct light_device_t* dev) {
      if (is_lit(&g_battery)) {
          set_speaker_light_locked(dev, &g_battery);
      } else {
          set_speaker_light_locked(dev, &g_notification);
      }
  }";}i:2;i:3446;}i:17;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3446;}}