a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:170:"熟悉时钟使用模块：
该程序入口类（DeskClock）使用了singleTask启动模式，继承Activity类，实现了{ LabelDialogFragment.TimerLabelDialogHandler,";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:171;}i:4;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:73:"          LabelDialogFragment.AlarmLabelDialogHandler }这几个接口。";}i:2;i:171;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:171;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:378:"然后分别重写了{ onNewIntent/onCreate/onResume/onPause/onSaveInstanceState/onCreateOptionsMenu/onPrepareOptionsMenu/onOptionsItemSelected这些函数。
另外声明了内部类TabsAdapter继承了FragmentPagerAdapter实现了ActionBar.TabListener, ViewPager.OnPageChangeListener接口.
再声明了一个静态抽象类OnTapListener实现了OnTouchListener接口}等等..";}i:2;i:248;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:626;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:626;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"程序主要入口界面：";}i:2;i:628;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:655;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:655;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"@Override";}i:2;i:657;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:666;}i:14;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:72:"  protected void onCreate(Bundle icicle) {
      super.onCreate(icicle);";}i:2;i:666;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:148:"      mSelectedTab = CLOCK_TAB_INDEX;
      if (icicle != null) {
          mSelectedTab = icicle.getInt(KEY_SELECTED_TAB, CLOCK_TAB_INDEX);
      }";}i:2;i:744;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:328:"      // Timer receiver may ask the app to go to the timer fragment if a timer expired
      Intent i = getIntent();
      if (i != null) {
          int tab = i.getIntExtra(SELECT_TAB_INTENT_EXTRA, -1);
          if (tab != -1) {
              mSelectedTab = tab;
          }
      }
      initViews();
      setHomeTimeZone();";}i:2;i:902;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:765:"      // We need to update the system next alarm time on app startup because the
      // user might have clear our data.
      AlarmStateManager.updateNextAlarm(this);
  }
  **初始化页面加载**
  private void initViews() {
      if (mTabsAdapter == null) {
          mViewPager = new ViewPager(this);
          mViewPager.setId(R.id.desk_clock_pager);
          // Keep all four tabs to minimize jank.
          mViewPager.setOffscreenPageLimit(3);
          mTabsAdapter = new TabsAdapter(this, mViewPager);
          createTabs(mSelectedTab);
      }
      setContentView(mViewPager);
      mActionBar.setSelectedNavigationItem(mSelectedTab);
  }
  **添加页面选项卡**
  private void createTabs(int selectedIndex) {
      mActionBar = getActionBar();";}i:2;i:1252;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:146:"      if (mActionBar != null) {
          mActionBar.setDisplayOptions(0);
          mActionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);";}i:2;i:2059;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:242:"          mAlarmTab = mActionBar.newTab();
          mAlarmTab.setIcon(R.drawable.alarm_tab);
          mAlarmTab.setContentDescription(R.string.menu_alarm);
          mTabsAdapter.addTab(mAlarmTab, AlarmClockFragment.class, ALARM_TAB_INDEX);";}i:2;i:2213;}i:20;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:237:"          mClockTab = mActionBar.newTab();
          mClockTab.setIcon(R.drawable.clock_tab);
          mClockTab.setContentDescription(R.string.menu_clock);
          mTabsAdapter.addTab(mClockTab, ClockFragment.class, CLOCK_TAB_INDEX);";}i:2;i:2465;}i:21;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:237:"          mTimerTab = mActionBar.newTab();
          mTimerTab.setIcon(R.drawable.timer_tab);
          mTimerTab.setContentDescription(R.string.menu_timer);
          mTabsAdapter.addTab(mTimerTab, TimerFragment.class, TIMER_TAB_INDEX);";}i:2;i:2712;}i:22;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:268:"          mStopwatchTab = mActionBar.newTab();
          mStopwatchTab.setIcon(R.drawable.stopwatch_tab);
          mStopwatchTab.setContentDescription(R.string.menu_stopwatch);
          mTabsAdapter.addTab(mStopwatchTab, StopwatchFragment.class,STOPWATCH_TAB_INDEX);";}i:2;i:2959;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:687:"          mActionBar.setSelectedNavigationItem(selectedIndex);
          mTabsAdapter.notifySelectedPage(selectedIndex);
      }
  }
  
  **设置本地时区**
private void setHomeTimeZone() {
      SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
      String homeTimeZone = prefs.getString(SettingsActivity.KEY_HOME_TZ, "");
      if (!homeTimeZone.isEmpty()) {
          return;
      }
      homeTimeZone = TimeZone.getDefault().getID();
      SharedPreferences.Editor editor = prefs.edit();
      editor.putString(SettingsActivity.KEY_HOME_TZ, homeTimeZone);
      editor.apply();
      Log.v(LOG_TAG, "Setting home time zone to " + homeTimeZone);
  }";}i:2;i:3237;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3237;}}