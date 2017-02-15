a:170:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"该流程基于S100D 源码分析，以程序启动和常用操作为主要引导线。水平有限，如有错误，请及时更正。";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:137;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"存储联系人";i:1;i:1;i:2;i:137;}i:2;i:137;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:137;}i:6;a:3:{i:0;s:10:"listo_open";i:1;a:0:{}i:2;i:164;}i:7;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:164;}i:8;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:164;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:94:" 储存联系人，若选择保存在本地，则存入数据库，理论上没有数量上限";}i:2;i:168;}i:10;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:262;}i:11;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:262;}i:12;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:262;}i:13;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:262;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:" 储存联系人，若选择保存在Sim卡，则根据sim卡的存储大小不同";}i:2;i:266;}i:15;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:348;}i:16;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:348;}i:17;a:3:{i:0;s:11:"listo_close";i:1;a:0:{}i:2;i:348;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:350;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"程序启动";i:1;i:1;i:2;i:350;}i:2;i:350;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:350;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:350;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"通讯录模块中有两个入口：PeopleActivity.java和DialtactsActivity.java。";}i:2;i:375;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:458;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:458;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:130:"PeopleActivity是联系人入口类，DialtactsActivity是拨号入口类，分别对应桌面的联系人和拨号两个图标。";}i:2;i:460;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:590;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:592;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"联系人模块";i:1;i:1;i:2;i:592;}i:2;i:592;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:592;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:592;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:341:"程序启动先做一些准备工作，如：检测联系人数据是否可用、创建电话帐号（一般直接使用系统默认本地帐号）、通讯录过滤控制器的初始化等。然后执行该模块的三个主要子模块的初始化：分组、通讯列表、收藏（分别对应三个fragment）和actionBar的初始化。";}i:2;i:620;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:967;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1040:"
// Create the fragments and add as children of the view pager.
// The pager adapter will only change the visibility; it'll never create/destroy
// fragments.
// However, if it's after screen rotation, the fragments have been re-created by
// the fragment manager, so first see if there're already the target fragments
// existing.
mFavoritesFragment = (ContactTileListFragment)
        fragmentManager.findFragmentByTag(FAVORITE_TAG);
mAllFragment = (DefaultContactBrowseListFragment)
        fragmentManager.findFragmentByTag(ALL_TAG);
mGroupsFragment = (GroupBrowseListFragment)
        fragmentManager.findFragmentByTag(GROUPS_TAG);

if (mFavoritesFragment == null) {
    mFavoritesFragment = new ContactTileListFragment();
    mAllFragment = new DefaultContactBrowseListFragment();
    mGroupsFragment = new GroupBrowseListFragment();

    transaction.add(R.id.tab_pager, mFavoritesFragment, FAVORITE_TAG);
    transaction.add(R.id.tab_pager, mAllFragment, ALL_TAG);
    transaction.add(R.id.tab_pager, mGroupsFragment, GROUPS_TAG);
}
";i:1;s:4:"java";i:2;N;}i:2;i:967;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:967;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"actionBar的初始化主要是设置了searchView和tabs";}i:2;i:2021;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2083;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"mActionBar.setCustomView(customSearchView, layoutParams);";i:1;s:4:"java";i:2;N;}i:2;i:2083;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:283:"
private void setupTabs() {
    addTab(TabState.GROUPS, R.drawable.ic_tab_groups, R.string.contactsGroupsLabel);
    addTab(TabState.ALL, R.drawable.ic_tab_all, R.string.contactsAllLabel);
    addTab(TabState.FAVORITES, R.drawable.ic_tab_starred, R.string.contactsFavoritesLabel);
}
";i:1;s:4:"java";i:2;N;}i:2;i:2159;}i:39;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:474:"
private void addTab(int expectedTabIndex, int icon, int description){
    final Tab tab = mActionBar.newTab();
    tab.setTabListener(mTabListener);
    if (mShowTabsAsText) {
        tab.setText(description);
    } else {
        tab.setIcon(icon);
        tab.setContentDescription(description);
    }
    mActionBar.addTab(tab);
    if (expectedTabIndex != tab.getPosition()) {
        throw new IllegalStateException("Tabs must be created in the right order");
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:2461;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2461;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:166:"在onstart中有调用fragment的配置方法configureFragments(boolean fromRequest) ;再该方法中首先处理事件的请求，然后简单配置一下fragment。";}i:2;i:2949;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3121;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:736:"
switch (actionCode) {
    case ContactsRequest.ACTION_ALL_CONTACTS:
        filter = ContactListFilter.createFilterWithType(
                ContactListFilter.FILTER_TYPE_ALL_ACCOUNTS);
        tabToOpen = TabState.ALL;
        break;
    ...
    case ContactsRequest.ACTION_GROUP:
        tabToOpen = TabState.GROUPS;
        break;
    default:
        tabToOpen = -1;
        break;
}
if (tabToOpen != -1) {
    mActionBarAdapter.setCurrentTab(tabToOpen);
}

if (filter != null) {
    mContactListFilterController.setContactListFilter(filter, false);
    searchMode = false;
}

if (mRequest.getContactUri() != null) {
    searchMode = false;
}

mActionBarAdapter.setSearchMode(searchMode);
configureContactListFragmentForRequest();
";i:1;s:4:"java";i:2;N;}i:2;i:3121;}i:44;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:63:"
configureContactListFragment();
configureGroupListFragment();
";i:1;s:4:"java";i:2;N;}i:2;i:3876;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3876;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"该文件还设置整个页面下三个tab中需要的menu和对应的事件处理";}i:2;i:3953;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4041;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:337:"
public boolean onCreateOptionsMenu(Menu menu) {
    if (!areContactsAvailable()) {
        // If contacts aren't available, hide all menu items.
        return false;
    }
    super.onCreateOptionsMenu(menu);

    MenuInflater inflater = getMenuInflater();
    inflater.inflate(R.menu.people_options, menu);
    ...
    return true;
}
";i:1;s:4:"java";i:2;N;}i:2;i:4041;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:691:"
public boolean onOptionsItemSelected(MenuItem item) {
if (FeatureQuery.FEATURE_BAIDU_XCLOUD){
    if(XCloudManager.getInstance().handleXCouldRelatedMenuItem(item, this))
        return true;
}
switch (item.getItemId()) {
    case android.R.id.home: {
        // The home icon on the action bar is pressed
        if (mActionBarAdapter.isUpShowing()) {
            // "UP" icon press -- should be treated as "back".
            onBackPressed();
        }
        return true;
    }
    ...
    case R.id.menu_switch_group: {
        isLocalGroupsShown = !isLocalGroupsShown;
        updateGroupsMenu();
        mGroupsFragment.updateGroupData();
        return true;
    }
}
return false;
}
";i:1;s:4:"java";i:2;N;}i:2;i:4397;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4397;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"此外从该文件的类定义处可以看出，该类继承的一些接口，并作为回调提供了相应的实现。";}i:2;i:5103;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5229;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:269:"
public class PeopleActivity extends ContactsActivity
        implements View.OnCreateContextMenuListener, ActionBarAdapter.Listener,
        DialogManager.DialogShowingViewActivity,
        ContactListFilterController.ContactListFilterListener, ProviderStatusListener
";i:1;s:4:"java";i:2;N;}i:2;i:5229;}i:54;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5512;}i:55;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"联系人分组";i:1;i:2;i:2;i:5512;}i:2;i:5512;}i:56;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5512;}i:57;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5512;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:450:"主要的类为：GroupBrowseListFragment、GroupBrowseListAdapter、LocalGroupListAdapter。
GroupBrowseListFragment里的内容相对较少，一是因为界面中下面menu部分的处理都集中在Peoplectivity中，另一个是集中在他的适配器中。它提供updateGroupData()给外部调用刷新数据。并且再内部提供mGroupLoaderListener和mLocalGroupLoaderListener实现LoaderCallbacks<Cursor>作为加载完数据的回调。";}i:2;i:5538;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5994;}i:60;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:323:"
public void updateGroupData() {
    if (this.getActivity() == null) {
        return;
    }
    if (!isLocalShown()) {
        getLoaderManager().restartLoader(LOADER_GROUPS, null, mGroupLoaderListener);
    } else {
        getLoaderManager().restartLoader(LOADER_LOCAL_GROUPS, null, mLocalGroupLoaderListener);
    }
}	
";i:1;s:4:"java";i:2;N;}i:2;i:5994;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5994;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:124:"GroupBrowseListAdapter、LocalGroupListAdapter分别为登录后网络的分组适配器和本地数据的分组适配器。";}i:2;i:6331;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6456;}i:64;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6456;}i:65;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"联系人列表";i:1;i:2;i:2;i:6456;}i:2;i:6456;}i:66;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6456;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6456;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"联系人模块涉及的类相对较多，他的fragment类和适配器都多层继承，其继承关系如图：
";}i:2;i:6482;}i:69;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:44:":android:contacts:qq截图20140402150004.png";i:1;s:0:"";i:2;s:6:"center";i:3;s:3:"300";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:6596;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:"
fragment中的逻辑集中体现在ContactEntryListFragment，实现的接口如下：";}i:2;i:6651;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6744;}i:72;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:247:"
public abstract class ContactEntryListFragment<T extends ContactEntryListAdapter>
        extends Fragment
        implements OnItemClickListener, OnScrollListener, OnFocusChangeListener, OnTouchListener,
                LoaderCallbacks<Cursor> 
";i:1;s:4:"java";i:2;N;}i:2;i:6744;}i:73;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6744;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"再onAttach中绑定数据源";}i:2;i:7005;}i:75;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7040;}i:76;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"setLoaderManager(super.getLoaderManager());";i:1;N;i:2;N;}i:2;i:7040;}i:77;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7040;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"在该类的onCreateView()中初始化试图、绑定适配器、绑定图片管理器";}i:2;i:7092;}i:79;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7184;}i:80;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:400:"
mListView = (ListView)mView.findViewById(android.R.id.list);
...
mListView.setOnItemClickListener(this);
mListView.setOnFocusChangeListener(this);
mListView.setOnTouchListener(this);
mListView.setFastScrollEnabled(!isSearchMode());
...
mAdapter.setSearchMode(searchMode);
mAdapter.configureDefaultPartition(false, searchMode);
mAdapter.setPhotoLoader(mPhotoManager);
mListView.setAdapter(mAdapter);
";i:1;s:4:"java";i:2;N;}i:2;i:7184;}i:81;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7184;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"在onStart()中开始获取数据";}i:2;i:7598;}i:83;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7637;}i:84;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15:"startLoading();";i:1;s:4:"java";i:2;N;}i:2;i:7637;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7637;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:296:"ContactListAdapter是与listview对应的自定义适配器，最终继承于CompositeCursorAdapter，而CompositeCursorAdapter实际上继承于BaseAdapter，系统采用了CompositeCursorAdapter方法的好处在于它已经实现了getView方法，并且采用了缓存技术，代码如下：";}i:2;i:7666;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7968;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1164:"
public View getView(int position, View convertView, ViewGroup parent) {
    ensureCacheValid();
    int start = 0;
    for (int i = 0; i < mSize; i++) {
        int end = start + mPartitions[i].count;
        if (position >= start && position < end) {
            int offset = position - start;
            if (mPartitions[i].hasHeader) {
                offset--;
            }
            View view;
            if (offset == -1) {
                view = getHeaderView(i, mPartitions[i].cursor, convertView, parent);
            } else {
                if (!mPartitions[i].cursor.moveToPosition(offset)) {
                    throw new IllegalStateException("Couldn't move cursor to position "
                            + offset);
                }
                view = getView(i, mPartitions[i].cursor, offset, convertView, parent);
            }
            if (view == null) {
                throw new NullPointerException("View should not be null, partition: " + i
                        + " position: " + offset);
            }
            return view;
        }
        start = end;
    }

    throw new ArrayIndexOutOfBoundsException(position);
}
";i:1;s:4:"java";i:2;N;}i:2;i:7968;}i:89;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:432:"
 /**
 * Returns an item view for the specified partition, creating one if needed.
 */
protected View getView(int partition, Cursor cursor, int position, View convertView,
        ViewGroup parent) {
    View view;
    if (convertView != null) {
        view = convertView;
    } else {
        view = newView(mContext, partition, cursor, position, parent);
    }
    bindView(view, partition, cursor, position);
    return view;
}
";i:1;s:4:"java";i:2;N;}i:2;i:9151;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9151;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:138:"适配器中newView是用来创建每个Item的布局，那么bindView是用来创建布局上每个子视图。bindVIew的代码如下：";}i:2;i:9597;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9741;}i:93;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:958:"
 @Override
protected void bindView(View itemView, int partition, Cursor cursor, int position) {
    final ContactListItemView view = (ContactListItemView)itemView;

    view.setHighlightedPrefix(isSearchMode() ? getUpperCaseQueryString() : null);

    if (isSelectionVisible()) {
        view.setActivated(isSelectedContact(partition, cursor));
    }

    bindSectionHeaderAndDivider(view, position, cursor);

    if (isQuickContactEnabled()) {
        bindQuickContact(view, partition, cursor, ContactQuery.CONTACT_PHOTO_ID,
                ContactQuery.CONTACT_PHOTO_URI, ContactQuery.CONTACT_ID,
                ContactQuery.CONTACT_LOOKUP_KEY);
    } else {
        if (getDisplayPhotos()) {
            bindPhoto(view, partition, cursor);
        }
    }

    bindName(view, cursor);
    bindPresenceAndStatusMessage(view, cursor);

    if (isSearchMode()) {
        bindSearchSnippet(view, cursor);
    } else {
        view.setSnippet(null);
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:9741;}i:94;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:377:"
@Override
protected View newView(Context context, int partition, Cursor cursor, int position,
        ViewGroup parent) {
    ContactListItemView view = new ContactListItemView(context, null);
    view.setUnknownNameText(mUnknownNameText);
    view.setQuickContactEnabled(isQuickContactEnabled());
    view.setActivatedStateSupported(isSelectionVisible());
    return view;
}
";i:1;s:4:"java";i:2;N;}i:2;i:10718;}i:95;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10718;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"此外还有";}i:2;i:11109;}i:97;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11127;}i:98;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:762:"
protected void bindPhoto(final ContactListItemView view, int partitionIndex, Cursor cursor) {
    if (!isPhotoSupported(partitionIndex)) {
        view.removePhotoView();
        return;
    }

    // Set the photo, if available
    long photoId = 0;
    if (!cursor.isNull(ContactQuery.CONTACT_PHOTO_ID)) {
        photoId = cursor.getLong(ContactQuery.CONTACT_PHOTO_ID);
    }

    if (photoId != 0) {
        getPhotoLoader().loadThumbnail(view.getPhotoView(), photoId, false);
    } else {
        final String photoUriString = cursor.getString(ContactQuery.CONTACT_PHOTO_URI);
        final Uri photoUri = photoUriString == null ? null : Uri.parse(photoUriString);
        getPhotoLoader().loadDirectoryPhoto(view.getPhotoView(), photoUri, false);
    }
}
";i:1;s:4:"java";i:2;N;}i:2;i:11127;}i:99;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11904;}i:100;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"收藏";i:1;i:2;i:2;i:11904;}i:2;i:11904;}i:101;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:11904;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11904;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:218:"主要涉及的类有：ContactTileListFragment、ContactTileAdapter。
ContactTileListFragment中同分组差不多，东西很少，主要是初始化适配器及并绑定到试图，提供加载数据的回调类。";}i:2;i:11921;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12145;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:372:"
/*onAttach*/

mAdapter = new ContactTileAdapter(activity, mAdapterListener,
                columnCount, mDisplayType);
mAdapter.setPhotoLoader(ContactPhotoManager.getInstance(activity));


/*onCreateView调用inflateAndSetupView*/

mListView = (ListView) listLayout.findViewById(R.id.contact_tile_list);
mListView.setItemsCanFocus(true);
mListView.setAdapter(mAdapter);
";i:1;s:4:"java";i:2;N;}i:2;i:12145;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12145;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:96:"ContactTileAdapter中getview中通过getItemViewType返回不同的item视图（收藏/最近）";}i:2;i:12531;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12633;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:705:"
public View getView(int position, View convertView, ViewGroup parent) {
    int itemViewType = getItemViewType(position);

    if (itemViewType == ViewTypes.DIVIDER) {
        // Checking For Divider First so not to cast convertView
        return convertView == null ? getDivider() : convertView;
    }

    ContactTileRow contactTileRowView = (ContactTileRow) convertView;
    ArrayList<ContactEntry> contactList = getItem(position);

    if (contactTileRowView == null) {
        // Creating new row if needed
        contactTileRowView = new ContactTileRow(mContext, itemViewType);
    }

    contactTileRowView.configureRow(contactList, position == getCount() - 1);
    return contactTileRowView;
}
";i:1;s:4:"java";i:2;N;}i:2;i:12633;}i:110;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13352;}i:111;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"联系人详细页面";i:1;i:2;i:2;i:13352;}i:2;i:13352;}i:112;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:13352;}i:113;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13352;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:"涉及的类有：ContactDetailActivity、ContactLoaderFragment、ContactDetailLayoutController、ContactDetailFragment";}i:2;i:13384;}i:115;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13503;}i:116;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:13503;}i:117;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13503;}i:118;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13503;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:" ContactDetailActivity主要处理基本试图的初始化及其事件的处理。";}i:2;i:13507;}i:120;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13589;}i:121;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13589;}i:122;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13589;}i:123;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13589;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:104:" ContactLoaderFragment主要负责数据加载的启动及处理，添加menu并处理相应的事件。";}i:2;i:13593;}i:125;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13697;}i:126;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13697;}i:127;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13697;}i:128;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13697;}i:129;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:" ContactDetailLayoutController作为控制器处理的主要处理ContactDetailFragment实例的创建添加，并且执行数据的显示到视图。";}i:2;i:13701;}i:130;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13851;}i:131;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13851;}i:132;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13851;}i:133;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13851;}i:134;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:268:" ContactDetailFragment是详细信息的主要部分，显示试图为mListview，里面包含一个子类的适配器及事件的处理。但是该页面除了menu以外的点击事件分三个部分：header部分、detailEntryView的item部分和其他item部分。";}i:2;i:13855;}i:135;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14123;}i:136;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14123;}i:137;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:14123;}i:138;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14123;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:144:"下面的代码描述了在创建detailEntryView时绑定了三个事件，这个决定了它将不调用常规的listview的item点击事件。";}i:2;i:14125;}i:140;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14275;}i:141;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:769:"
private View getDetailEntryView(int position, View convertView, ViewGroup parent) {
    final DetailViewEntry entry = (DetailViewEntry) getItem(position);
    final View v;
    final DetailViewCache viewCache;

    // Check to see if we can reuse convertView
    if (convertView != null) {
        v = convertView;
        viewCache = (DetailViewCache) v.getTag();
    } else {
        // Create a new view if needed
        v = mInflater.inflate(R.layout.contact_detail_list_item, parent, false);

        // Cache the children
        viewCache = new DetailViewCache(v,
                mPrimaryActionClickListener, mSecondaryActionClickListener, mThirdActionClickListener);
        v.setTag(viewCache);
    }

    bindDetailView(position, v, entry);
    return v;
}
";i:1;s:4:"java";i:2;N;}i:2;i:14275;}i:142;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:620:"
 /**
 * Default (fallback) list item click listener.  Note the click event for DetailViewEntry is
 * caught by individual views in the list item view to distinguish the primary action and the
 * secondary action, so this method won't be invoked for that.  (The listener is set in the
 * bindview in the adapter)
 * This listener is used for other kind of entries.
 */
@Override
public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    if (mListener == null) return;
    final ViewEntry entry = mAdapter.getItem(position);
    if (entry == null) return;
    entry.click(view, mListener);
}
";i:1;s:4:"java";i:2;N;}i:2;i:15063;}i:143;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15697;}i:144;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"联系人编辑页面";i:1;i:2;i:2;i:15697;}i:2;i:15697;}i:145;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:15697;}i:146;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15697;}i:147;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:214:"主要涉及的类是：ContactEditorActivity、ContactEditorFragment，此外还涉及几个试图类RawContactEditorView、PhotoEditorView、StructuredNameEditorView、PhoneticNameEditorView、GroupMembershipView";}i:2;i:15729;}i:148;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15943;}i:149;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:15943;}i:150;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15943;}i:151;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15943;}i:152;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:" ContactEditorActivity基本只负责ContactEditorFragment的实例化，并提供一个mFragmentListener实现ContactEditorFragment.Listener";}i:2;i:15947;}i:153;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16088;}i:154;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16088;}i:155;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:16088;}i:156;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:16088;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:240:" ContactEditorFragment中有一个重要的方法bindEditors(),该方法根据获到的数据迭代显示编辑框。在整个运行过程中，只要数据有改动都有调用到这个方法。其中有绑定有绑定监听到编辑框。";}i:2;i:16092;}i:158;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:16332;}i:159;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:16332;}i:160;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:16332;}i:161;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5256:"
public void bindEditors() {
    // This may happen when this Fragment is recreated by the system during users
    // confirming the split action (and thus this method is called just before onCreate()),
    // for example.Check this to prevent the occurrence of NullException when sort mState.
    if (mState == null) {
        return;
    }
    // Sort the editors
    Collections.sort(mState, mComparator);

    // Remove any existing editors and rebuild any visible
    mContent.removeAllViews();

    // If photoActionPopup shown, the popup will leak when contact editor
    // fragment bind editors. The popup need dismiss with content view
    // remove all views.
    if (mBindPhotoHandler != null) {
        mBindPhotoHandler.destroy();
        mBindPhotoHandler = null;
    }

    final LayoutInflater inflater = (LayoutInflater) mContext.getSystemService(
            Context.LAYOUT_INFLATER_SERVICE);
    final AccountTypeManager accountTypes = AccountTypeManager.getInstance(mContext);
    int numRawContacts = mState.size();
    currentAccountTpye = mState.get(0).getValues().getAsString(RawContacts.ACCOUNT_TYPE);
    for (int i = 0; i < numRawContacts; i++) {
        // TODO ensure proper ordering of entities in the list
        final EntityDelta entity = mState.get(i);
        final ValuesDelta values = entity.getValues();
        if (!values.isVisible()) continue;

        final String accountType = values.getAsString(RawContacts.ACCOUNT_TYPE);
        final String dataSet = values.getAsString(RawContacts.DATA_SET);
        final AccountType type = accountTypes.getAccountType(accountType, dataSet);
        final long rawContactId = values.getAsLong(RawContacts._ID);

        if (!type.areContactsWritable()) {
            editor = (BaseRawContactEditorView) inflater.inflate(
                    R.layout.raw_contact_readonly_editor_view, mContent, false);
            ((RawContactReadOnlyEditorView) editor).setListener(this);
        } else {
            editor = (RawContactEditorView) inflater.inflate(R.layout.raw_contact_editor_view,
                    mContent, false);
        }
        if (Intent.ACTION_INSERT.equals(mAction) && numRawContacts == 1) {
            final List<AccountWithDataSet> accounts =
                    AccountTypeManager.getInstance(mContext).getAccounts(true);
            if (accounts.size() > 1 && !mNewLocalProfile) {
                addAccountSwitcher(mState.get(0), editor);
            } else {
                disableAccountSwitcher(editor);
            }
        } else {
            disableAccountSwitcher(editor);
        }

        editor.setEnabled(mEnabled);

        mContent.addView(editor);

        editor.setState(entity, type, mViewIdGenerator, isEditingUserProfile());

        // Set up the photo handler.
        bindPhotoHandler(editor, type, mState);

        // If a new photo was chosen but not yet saved, we need to
        // update the thumbnail to reflect this.
        Bitmap bitmap = updatedBitmapForRawContact(rawContactId);

        if (bitmap != null) {
            editor.setPhotoBitmap(bitmap);
        }
        mUpdatedPhotos.putBoolean("has_remove",false);
        if (editor instanceof RawContactEditorView) {
            final Activity activity = getActivity();
            final RawContactEditorView rawContactEditor = (RawContactEditorView) editor;
            EditorListener listener = new EditorListener() {

                @Override
                public void onRequest(int request) {
                    if (activity.isFinishing()) { // Make sure activity is still running.
                        return;
                    }
                    if (request == EditorListener.FIELD_CHANGED && !isEditingUserProfile()) {
                        acquireAggregationSuggestions(activity, rawContactEditor);
                    }
                }

                @Override
                public void onDismissPopup() {
                    // Nothing to do.
                }

                @Override
                public void onDeleteRequested(Editor removedEditor) {
                }
            };

            final TextFieldsEditorView nameEditor = rawContactEditor.getNameEditor();
            if (mRequestFocus) {
                nameEditor.requestFocus();
                mRequestFocus = false;
            }
            nameEditor.setEditorListener(listener);

            final TextFieldsEditorView phoneticNameEditor =
                    rawContactEditor.getPhoneticNameEditor();
            phoneticNameEditor.setEditorListener(listener);
            rawContactEditor.setAutoAddToDefaultGroup(mAutoAddToDefaultGroup);

            if (rawContactId == mAggregationSuggestionsRawContactId || mAggregationSuggestionsRawContactId < 0) {
                acquireAggregationSuggestions(activity, rawContactEditor);
            }
        }
    }

    mRequestFocus = false;

    bindGroupMetaData();

    // Show editor now that we've loaded state
    mContent.setVisibility(View.VISIBLE);

    // Refresh Action Bar as the visibility of the join command
    // Activity can be null if we have been detached from the Activity
    final Activity activity = getActivity();
    if (activity != null) activity.invalidateOptionsMenu();
}
";i:1;s:4:"java";i:2;N;}i:2;i:16338;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16338;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"完成事件的处理再menu的item点击事件中处理。";}i:2;i:21608;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21668;}i:165;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21668;}i:166;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"拨号模块";i:1;i:1;i:2;i:21668;}i:2;i:21668;}i:167;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:21668;}i:168;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21692;}i:169;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:21692;}}