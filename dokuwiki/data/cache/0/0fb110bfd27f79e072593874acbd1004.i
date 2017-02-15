a:41:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:301:"If you have been using Theme.NoDisplay in one or more activities in your app, and you have not tested them on Android 6.0 yet, I recommend that you do so soon. An undocumented regression in Android 6.0 will cause some of those activities to crash upon launch, if your targetSdkVersion is 23 or higher.";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:302;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:302;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:"If the activity does all of its work in onCreate() (e.g., starts up a service), then calls finish(), you seem to be OK.";}i:2;i:304;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:423;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:423;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:402:"But sometimes the work that needs to be done is a bit more involved than that. In particular, calling startActivityForResult(), with an eye towards calling finish() in onActivityResult(), will cause your app to crash with an IllegalStateException saying that your activity “did not call finish() prior to onResume() completing”. This, apparently, is a new requirement of Theme.NoDisplay activities.";}i:2;i:425;}i:9;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:827;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:827;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:634:"You might wonder why you need a Theme.NoDisplay activity to be calling startActivityForResult() in the first place. The scenario I encountered was trying to use the media projection APIs, specifically to set up recording a screencast. To use the media projection APIs, you need to call startActivityForResult() on a system-supplied Intent, then use the result data to set up a MediaProjection. In the case of this sample app, the user interface was primarily going to be a foreground Notification of a service (plus some command-line scripts), so I had no need for an activity, except as a means of enabling the media projection APIs.";}i:2;i:829;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1463;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1463;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"So, I have something like this:";}i:2;i:1465;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1502;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1049:"
package com.commonsware.android.andcorder;

import android.app.Activity;
import android.content.Intent;
import android.media.projection.MediaProjectionManager;
import android.os.Bundle;

public class MainActivity extends Activity {
  private static final int REQUEST_SCREENSHOT=59706;
  private MediaProjectionManager mgr;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    mgr=(MediaProjectionManager)getSystemService(MEDIA_PROJECTION_SERVICE);

    startActivityForResult(mgr.createScreenCaptureIntent(),
      REQUEST_SCREENSHOT);
  }

  @Override
  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    if (requestCode==REQUEST_SCREENSHOT) {
      if (resultCode==RESULT_OK) {
        Intent i=
            new Intent(this, RecorderService.class)
                .putExtra(RecorderService.EXTRA_RESULT_CODE, resultCode)
                .putExtra(RecorderService.EXTRA_RESULT_INTENT, data);

        startService(i);
      }
    }

    finish();
  }
}

";i:1;s:4:"java";i:2;N;}i:2;i:1502;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1502;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:225:"This works just fine with Theme.NoDisplay on Android 5.1, passing control to my RecorderService to actually manage starting and stopping the screen recording. On Android 6.0, the app crashes with the aforementioned exception.";}i:2;i:2566;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2791;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2791;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:553:"Another scenario is using requestPermissions() from the Android 6.0 runtime permission system. Under the covers, requestPermissions() uses startActivityForResult(). If you have an app where the UI is mostly not an activity (e.g., app widget, Notification, wear app), but you need runtime permissions, you might try creating a Theme.NoDisplay activity just to call requestPermissions() and handle onRequestPermissionsResult(). I would expect this to generate the same exception on Android 6.0, though I have not tried this scenario to confirm the theory.";}i:2;i:2793;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3346;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3346;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"The issue that was filed on the M Developer Preview about this ran into the problem when trying to show a Dialog from onCreate(). The issue went nowhere.";}i:2;i:3348;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3501;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3501;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:176:"One fix described in that issue — calling setVisible(true) in onStart() — works, but you wind up with a visible activity UI (black background and old-timey gray title bar).";}i:2;i:3503;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3679;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3679;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:313:"What worked better for me was to use Theme.Translucent.NoTitleBar as the theme on Android 6.0+. If you want to stick with Theme.NoDisplay on older devices, create a custom theme that inherits from Theme.NoDisplay in res/values/ but from Theme.Translucent.NoTitleBar in res/values-v23/, then use your custom theme.";}i:2;i:3681;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3994;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3994;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"Or, go with targetSdkVersion 22 temporarily. Eventually, something will drive you to using targetSdkVersion of 23 or higher, though.";}i:2;i:3996;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4128;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4128;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:293:"UPDATE: 2015-11-08 Dianne Hackborn responded to this post, explaining that Theme.NoDisplay is somewhat documented to require a finish() before onResume() and outlines a bit of the rationale for the change to detect this case and fail fast. She and I disagree on what constitutes a regression (";}i:2;i:4130;}i:37;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"IMHO";}i:2;i:4423;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:193:", a substantial change in behavior is a regression, even if documentation hints at the validity of the change), but it is great that we have a more-or-less official source for what is going on.";}i:2;i:4427;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4427;}i:40;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4427;}}