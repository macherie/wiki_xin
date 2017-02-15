a:74:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"程序启动";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:114:"程序的入口：ConversationList.java，对应主页中短信的快捷方式。由此进入短信列表模块。";}i:2;i:26;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:140;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:142;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"短信列表模块";i:1;i:1;i:2;i:142;}i:2;i:142;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:142;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:142;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:222:"该模块的展示是由ConversationList.java类实现的，该类继承自ListActivity，以列表的形式展示所有短信记录。模块启动的onCreate()方法中初始化listview的数据源mListAdapter与actionbar";}i:2;i:173;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:401;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:278:"
    private void initListAdapter() {
        mListAdapter = new ConversationListAdapter(this, null);
        mListAdapter.setOnContentChangedListener(mContentChangedListener);
        setListAdapter(mListAdapter);
        getListView().setRecyclerListener(mListAdapter);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:401;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:651:"
    private void setupActionBar() {
        ActionBar actionBar = getActionBar();

        ViewGroup v = (ViewGroup)LayoutInflater.from(this)
            .inflate(R.layout.conversation_list_actionbar, null);
        actionBar.setDisplayOptions(ActionBar.DISPLAY_SHOW_CUSTOM,
                ActionBar.DISPLAY_SHOW_CUSTOM);
        actionBar.setCustomView(v,
                new ActionBar.LayoutParams(ActionBar.LayoutParams.WRAP_CONTENT,
                        ActionBar.LayoutParams.WRAP_CONTENT,
                        Gravity.CENTER_VERTICAL | Gravity.RIGHT));

        mUnreadConvCount = (TextView)v.findViewById(R.id.unread_conv_count);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:699;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:699;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"在ConversationList.java类的onStart()方法中调用startAsyncQuery();实现异步查询短信数据";}i:2;i:1364;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1472;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:444:"
    private void startAsyncQuery() {
        try {
            ((TextView)(getListView().getEmptyView())).setText(R.string.loading_conversations);

            Conversation.startQueryForAll(mQueryHandler, THREAD_LIST_QUERY_TOKEN);
            Conversation.startQuery(mQueryHandler, UNREAD_THREADS_QUERY_TOKEN, Threads.READ + "=0");
        } catch (SQLiteException e) {
            SqliteWrapper.checkSQLiteException(this, e);
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:1472;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1472;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:513:"异步查询数据的功能主要是由ThreadListQueryHandler.java类来实现，该类继承自ConversationQueryHandler.java，而ConversationQueryHandler.java类又继承自AsyncQueryHandler.java类。ThreadListQueryHandler.java类调用父类AsyncQueryHandler.java的startQuery（）方法开始异步查询。同时ThreadListQueryHandler.java类重写了父类的onQueryComplete（）方法，来实现将查询出来的数据更新listview绑定的mListAdapter对象，实现异步刷新并展现的功能。";}i:2;i:1930;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2449;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1734:"
    @Override
    protected void onQueryComplete(int token, Object cookie, Cursor cursor) {
        switch (token) {
        case THREAD_LIST_QUERY_TOKEN:
            mListAdapter.changeCursor(cursor);
            if (mListAdapter.getCount() == 0) {
                ((TextView)(getListView().getEmptyView())).setText(R.string.no_conversations);
            }
            if (mNeedToMarkAsSeen) {
                mNeedToMarkAsSeen = false;
                Conversation.markAllConversationsAsSeen(getApplicationContext());
                mHandler.postDelayed(mDeleteObsoleteThreadsRunnable,DELETE_OBSOLETE_THREAD_DELAY);
            }
            // some menu items depend on the adapter's count
            if (mDeleteAllItem != null)
                    mDeleteAllItem.setVisible(mListAdapter.getCount() > 0);
            break;
       case UNREAD_THREADS_QUERY_TOKEN:
            int count = 0;
            if (cursor != null) {
                count = cursor.getCount();
                cursor.close();
            }
            mUnreadConvCount.setText(count > 0 ? Integer.toString(count) : null);
            break;
         case HAVE_LOCKED_MESSAGES_TOKEN:
            @SuppressWarnings("unchecked")
            Collection<Long> threadIds = (Collection<Long>)cookie;
            confirmDeleteThreadDialog(new DeleteThreadListener(threadIds, mQueryHandler,
                    ConversationList.this), threadIds,
                    cursor != null && cursor.getCount() > 0,
                    ConversationList.this);
            if (cursor != null) {
                cursor.close();
            }
            break;
         default:
            Log.e(TAG, "onQueryComplete called with unknown token " + token);
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:2449;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2449;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:243:"listview中的每个item点击后会进入到短信发送模块，由此方式进入到短信发送模块会传递一个联系人参数，在短信发送模块中会显示与该联系人的相关短信记录，并可向该联系人发送短信";}i:2;i:4197;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4446;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1023:"
    @Override
    protected void onListItemClick(ListView l, View v, int position, long id) {
        // Note: don't read the thread id data from the ConversationListItem view passed in.
        // It's unreliable to read the cached data stored in the view because the ListItem
        // can be recycled, and the same view could be assigned to a different position
        // if you click the list item fast enough. Instead, get the cursor at the position
        // clicked and load the data from the cursor.
        // (ConversationListAdapter extends CursorAdapter, so getItemAtPosition() should
        // return the cursor object, which is moved to the position passed in)
        Cursor cursor  = (Cursor) getListView().getItemAtPosition(position);
        Conversation conv = Conversation.from(this, cursor);
        long tid = conv.getThreadId();

        if (LogTag.VERBOSE) {
            Log.d(TAG, "onListItemClick: pos=" + position + ", view=" + v + ", tid=" + tid);
        }

        openThread(tid);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:4446;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:128:"
    private void openThread(long threadId) {
        startActivity(ComposeMessageActivity.createIntent(this, threadId));
    }
";i:1;s:4:"java";i:2;N;}i:2;i:5488;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5488;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:278:"在菜单栏中也可以进入短信发送模块，该MenuItem在XML中定义如下。由此方式进入到短信发送模块不会传递具体的联系人参数，此时在短信发送模块中可以选择需要发送短信的联系人，也可是实现短信群发的功能。";}i:2;i:5630;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5914;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:205:"
    <item android:id="@+id/action_compose_new"
        android:title="@string/new_message"
        android:icon="@drawable/ic_menu_msg_compose_holo_dark"
        android:showAsAction="always|withText" />
";i:1;s:4:"java";i:2;N;}i:2;i:5914;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:952:"
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch(item.getItemId()) {
            case R.id.action_compose_new:
                createNewMessage();
                break;
            case R.id.action_delete_all:
                // The invalid threadId of -1 means all threads here.
                confirmDeleteThread(-1L, mQueryHandler);
                // hide the item: "Delete all threads"
                if (mDeleteAllItem != null)
                    mDeleteAllItem.setVisible(false);
                break;
            case R.id.action_settings:
                Intent intent = new Intent(this, MessagingPreferenceActivity.class);
                startActivityIfNeeded(intent, -1);
                break;
            case R.id.action_debug_dump:
                LogTag.dumpInternalTables(this);
                break;
            default:
                return true;
        }
        return false;
    }
";i:1;s:4:"java";i:2;N;}i:2;i:6138;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:114:"
    private void createNewMessage() {
        startActivity(ComposeMessageActivity.createIntent(this, 0));
    }
";i:1;s:4:"java";i:2;N;}i:2;i:7109;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7238;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"短信发送模块";i:1;i:1;i:2;i:7238;}i:2;i:7238;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:7238;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7238;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:227:"短信发送模块的页面展示是ComposeMessageActivity.java来实现的。在该模块中有个较为复杂的自定义组件RecipientsEditor。在onCreate（）方法中用initRecipientsEditor（）方法初始化该组件";}i:2;i:7269;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7502;}i:39;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2359:"
    private void initRecipientsEditor() {
        if (isRecipientsEditorVisible()) {
            return;
        }
        ContactList recipients = getRecipients();
        ViewStub stub = (ViewStub)findViewById(R.id.recipients_editor_stub);
        if (stub != null) {
            View stubView = stub.inflate();
            mRecipientsEditor = (RecipientsEditor) stubView.findViewById(R.id.recipients_editor);
            mRecipientsPicker = (ImageButton) stubView.findViewById(R.id.recipients_picker);
        } else {
            mRecipientsEditor = (RecipientsEditor)findViewById(R.id.recipients_editor);
            mRecipientsEditor.setVisibility(View.VISIBLE);
            mRecipientsPicker = (ImageButton)findViewById(R.id.recipients_picker);
            mRecipientsPicker.setVisibility(View.VISIBLE);
        }
        mRecipientsPicker.setOnClickListener(this);
        mRecipientsEditor.setAdapter(new ChipsRecipientAdapter(this));
        mRecipientsEditor.populate(recipients);
        mRecipientsEditor.setOnCreateContextMenuListener(mRecipientsMenuCreateListener);
        mRecipientsEditor.addTextChangedListener(mRecipientsWatcher);
        mRecipientsEditor.setOnSelectChipRunnable(new Runnable() {
            @Override
            public void run() {
                if (mRecipientsEditor.getRecipientCount() == 1) {
                    // if we're in extract mode then don't request focus
                    final InputMethodManager inputManager = (InputMethodManager)
                        getSystemService(Context.INPUT_METHOD_SERVICE);
                    if (inputManager == null || !inputManager.isFullscreenMode()) {
                        mTextEditor.requestFocus();
                    }
                }
            }
        });
        mRecipientsEditor.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {
                    RecipientsEditor editor = (RecipientsEditor) v;
                    ContactList contacts = editor.constructContactsFromInput(false);
                    updateTitle(contacts);
                }
            }
        });
        PhoneNumberFormatter.setPhoneNumberFormattingTextWatcher(this, mRecipientsEditor);

        mTopPanel.setVisibility(View.VISIBLE);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:7502;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7502;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:225:"点击该组件中的imagebutton即mRecipientsPicker可以进入联系人选择页面，选择需要发送短信的联系人，可以多选。进入到联系人选择页面是采用startActivityForResult(）的方式进入的";}i:2;i:9875;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10106;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:672:"
    private void launchMultiplePhonePicker() {
        Intent intent = new Intent("com.android.contacts.action.MULTI_PICK",Contacts.CONTENT_URI);
        String exsitNumbers = mRecipientsEditor.getExsitNumbers();
        if (!TextUtils.isEmpty(exsitNumbers)) {
            intent.putExtra(Intents.EXTRA_PHONE_URIS, exsitNumbers);
        }
        // We have to wait for the constructing complete.
        try {
            mIsPickingContact = true;
            startActivityForResult(intent, REQUEST_CODE_PICK);
        } catch (ActivityNotFoundException ex) {
            Toast.makeText(this, R.string.contact_app_not_found, Toast.LENGTH_SHORT).show();
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:10106;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10106;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:250:"通过startActivityForResult（）进入到选择联系人界面，在ComposeMessageActivity.java类中自然会有onActivityResult（）来从返回结果中获取联系人信息，这个返回的数据是联系人在sqlite数据库中对应的id。";}i:2;i:10792;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11048;}i:47;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:742:"
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        ...
        if (requestCode == REQUEST_CODE_PICK) {
            mWorkingMessage.asyncDeleteDraftSmsMessage(mConversation);

            // if the sms draft be deleted, flag mIsSmsDraftAlreadyDeleted is true.
            mIsSmsDraftAlreadyDeleted = true;
        }

        ...
        switch (requestCode) {
           ...
            case REQUEST_CODE_PICK:
                if (data != null) {
                    processPickResult(data);
                }
                break;

            ...
            default:
                if (LogTag.VERBOSE) log("bail due to unknown requestCode=" + requestCode);
                break;
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:11048;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11048;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:134:"processPickResult方法主要是用来判断要发送短信的联系人数量是否超出了100个，默认是不允许超过100个。";}i:2;i:11804;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11944;}i:51;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1849:"
    private void processPickResult(final Intent data) {
        // The EXTRA_PHONE_URIS stores the phone's urls that were selected by user in the
        // multiple phone picker.
        Bundle bundle = data.getExtras().getBundle("result");
        final Set<String> keySet = bundle.keySet();
        final int recipientCount = (keySet != null) ? keySet.size() : 0;

        // if total recipients count > recipientLimit,
        // then forbid add reipients to RecipientsEditor
        final int recipientLimit = MmsConfig.getRecipientLimit();
        int totalRecipientsCount = mExistsRecipientsCount + recipientCount;
        if (recipientLimit != Integer.MAX_VALUE && totalRecipientsCount > recipientLimit) {
            new AlertDialog.Builder(this)
                    .setMessage(getString(R.string.too_many_recipients, totalRecipientsCount, recipientLimit))
                    .setPositiveButton(android.R.string.ok, new OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            // if already exists some recipients,
                            // then new pick recipients with exists recipients count
                            // can't more than recipient limit count.
                            int newPickRecipientsCount = recipientLimit - mExistsRecipientsCount;
                            if (newPickRecipientsCount <= 0) {
                                return;
                            }
                            processAddRecipients(keySet, newPickRecipientsCount);
                        }
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .create().show();
            return;
        }

        processAddRecipients(keySet, recipientCount);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:11944;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11944;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:486:"processAddRecipients方法中开启了三条条线程，第一条线程是判断对从联系人选择界面返回的数据的格式化处理是否超过1秒，是则显示一个progressDialog，否则不显示。第二条是获取从联系人选择界面返回的数据并格式化这些数据，然后与之前已经存在的需要发送的联系人集合合并，去除重复的联系人信息。第三条则是将联系人信息按照一定的方式填充到RecipientsEditor组件中";}i:2;i:13807;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14299;}i:55;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3519:"
    private void processAddRecipients(final Set<String> keySet, final int newPickRecipientsCount) {
        // if process pick result that is pick recipients from Contacts
        mIsProcessPickedRecipients = true;
        final Handler handler = new Handler();
        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setTitle(getText(R.string.pick_too_many_recipients));
        progressDialog.setMessage(getText(R.string.adding_recipients));
        progressDialog.setIndeterminate(true);
        progressDialog.setCancelable(false);

        final Runnable showProgress = new Runnable() {
            @Override
            public void run() {
                progressDialog.show();
            }
        };
        // Only show the progress dialog if we can not finish off parsing the return data in 1s,
        // otherwise the dialog could flicker.
        handler.postDelayed(showProgress, 1000);

        new Thread(new Runnable() {
            @Override
            public void run() {
                Uri[] newuris = new Uri[newPickRecipientsCount];
                final ContactList list;
                 try {
                    Iterator<String> it = keySet.iterator();
                    int i = 0;
                    while (it.hasNext()) {
                        String id = it.next();
                        newuris[i++] = ContentUris.withAppendedId(Phone.CONTENT_URI, Integer.parseInt(id));
                        if (i == newPickRecipientsCount) {
                            break;
                        }
                    }
                    list = ContactList.blockingGetByUris(newuris);
                } finally {
                    handler.removeCallbacks(showProgress);
                }
                if (mRecipientsEditor != null) {
                    ContactList exsitList = mRecipientsEditor.constructContactsFromInput(true);
                    // Remove the repeat recipients.
                  if(exsitList.equals(list)){
                    exsitList.clear();
                    list.addAll(0, exsitList);
                  }else{
                    list.removeAll(exsitList);
                    list.addAll(0, exsitList);
                     }
                }

                // TODO: there is already code to update the contact header widget and recipients
                // editor if the contacts change. we can re-use that code.
                final Runnable populateWorker = new Runnable() {
                    @Override
                    public void run() {
                        // We must remove this listener before dealing with the contact list.
                        // Because the listener will take a lot of time, this will cause an ANR.
                        mRecipientsEditor.removeTextChangedListener(mRecipientsWatcher);
                        mRecipientsEditor.populate(list);
                        // Set value for mRecipientsPickList and
                        // mRecipientsWatcher will update the UI.
                        mRecipientsPickList = list;
                        updateTitle(list);
 
                        mRecipientsEditor.addTextChangedListener(mRecipientsWatcher);

                        // if process finished, then dismiss the progress dialog
                        progressDialog.dismiss();
                    }
                };
                handler.post(populateWorker);
            }
        }, "ComoseMessageActivity.processPickResult").start();
    }
";i:1;s:4:"java";i:2;N;}i:2;i:14299;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14299;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:228:"RecipientsEditor组件的主要功能是承担短信发送的联系人的容器,RecipientsEditor.java类继承自RecipientEditTextView.java类。其populate方法通过调用父类append方法来实现填充联系人的功能。";}i:2;i:17832;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18066;}i:59;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:475:"
    public void populate(ContactList list) {
        if (list.size() == 0) {
            setText(null);
        } else {
            // Clear the recipient when add contact again
            setText("");
            for (Contact c : list) {
                CharSequence charSequence = contactToToken(c);
                if (charSequence != null && charSequence.length() > 0) {
                    append( charSequence+ ", ");
                }
            }
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:18066;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18066;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:95:"RecipientEditTextView.java类中的append方法具体实现了填充联系人信息的功能。";}i:2;i:18555;}i:62;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18656;}i:63;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1395:"
    @Override
    public void append(CharSequence text, int start, int end) {
        // We need care about watching text changes while appending ',' or ';'.
        if (!TextUtils.isEmpty(text)) {
            String textString = text.toString().trim();
            if (textString.equals(String.valueOf(COMMIT_CHAR_COMMA))
                    || textString.equals(String.valueOf(COMMIT_CHAR_SEMICOLON))) {
                super.append(text, start, end);
                return;
            }
        }
        // We don't care about watching text changes while appending.
        if (mTextWatcher != null) {
            removeTextChangedListener(mTextWatcher);
        }
        super.append(text, start, end);
        if (!TextUtils.isEmpty(text) && TextUtils.getTrimmedLength(text) > 0) {
            final String displayString = text.toString();
            int seperatorPos = displayString.indexOf(COMMIT_CHAR_COMMA);
            if (seperatorPos != 0 && !TextUtils.isEmpty(displayString)
                    && TextUtils.getTrimmedLength(displayString) > 0) {
                mPendingChipsCount++;
                mPendingChips.add(text.toString());
            }
        }
        // Put a message on the queue to make sure we ALWAYS handle pending chips.
        if (mPendingChipsCount > 0) {
            postHandlePendingChips();
        }
        mHandler.post(mAddTextWatcher);
    }
";i:1;s:4:"java";i:2;N;}i:2;i:18656;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18656;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"在append方法中调动postHandlePendingChips();方法，对联系人信息数据进行异步处理，具体方法是handlePendingChips（）";}i:2;i:20065;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20213;}i:67;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2657:"
    /*package*/ void handlePendingChips() {
        if (getViewWidth() <= 0) {
            // The widget has not been sized yet.
            // This will be called as a result of onSizeChanged
            // at a later point.
            return;
        }
        if (mPendingChipsCount <= 0) {
            return;
        }

        synchronized (mPendingChips) {
            Editable editable = getText();
            // Tokenize!
            if (mPendingChipsCount <= MAX_CHIPS_PARSED) {
                for (int i = 0; i < mPendingChips.size(); i++) {
                    String current = mPendingChips.get(i);
                    int tokenStart = editable.toString().indexOf(current);
                    int tokenEnd = tokenStart + current.length();
                    if (tokenStart >= 0) {
                        // When we have a valid token, include it with the token
                        // to the left.
                        if (tokenEnd < editable.length() - 2
                                && editable.charAt(tokenEnd) == COMMIT_CHAR_COMMA) {
                            tokenEnd++;
                        }
                        createReplacementChip(tokenStart, tokenEnd, editable);
                    }
                    mPendingChipsCount--;
                }
                sanitizeEnd();
            } else {
                mNoChips = true;
            }

            if (mTemporaryRecipients != null && mTemporaryRecipients.size() > 0
                    && mTemporaryRecipients.size() <= RecipientAlternatesAdapter.MAX_LOOKUPS) {
                if (hasFocus() || mTemporaryRecipients.size() <= CHIP_LIMIT) {
                    new RecipientReplacementTask().execute();
                    mTemporaryRecipients = null;
                } else {
                    // Create the "more" chip
                    mIndividualReplacements = new IndividualReplacementTask();
                    mIndividualReplacements.execute(new ArrayList<RecipientChip>(
                            mTemporaryRecipients.subList(0, CHIP_LIMIT)));

                    // Remove the exists more chip before create, or it may
                    // create repeat more chip.
                    removeMoreChip();
                    createMoreChip();
                }
            } else {
                // There are too many recipients to look up, so just fall back
                // to showing addresses for all of them.
                mTemporaryRecipients = null;
                removeMoreChip();
                createMoreChip();
            }
            mPendingChipsCount = 0;
            mPendingChips.clear();
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:20213;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20213;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:428:"在handlePendingChips（）方法中调用createReplacementChip（）方法，完成对联系人信息的处理。RecipientsEditor组件中显示的其实是RecipientEntry.java类，createReplacementChip（）方法完成将特定格式的联系人信息转换成RecipientEntry对象，在RecipientsEditor组件中显示具体的联系人姓名，但在实际的短信发送过程中，是根据联系人的号码来发送的。";}i:2;i:22884;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23318;}i:71;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1827:"
    private void createReplacementChip(int tokenStart, int tokenEnd, Editable editable) {
        if (alreadyHasChip(tokenStart, tokenEnd)) {
            // There is already a chip present at this location.
            // Don't recreate it.
            return;
        }
        String token = editable.toString().substring(tokenStart, tokenEnd);
        int commitCharIndex = token.trim().lastIndexOf(COMMIT_CHAR_COMMA);
        if (commitCharIndex == token.length() - 1) {
            token = token.substring(0, token.length() - 1);
        }
        RecipientEntry entry = createTokenizedEntry(token);
        if (entry != null) {
            String destText = createAddressText(entry);
            // Always leave a blank space at the end of a chip.
            int textLength = destText.length() - 1;
            SpannableString chipText = new SpannableString(destText);
            int end = getSelectionEnd();
            int start = mTokenizer != null ? mTokenizer.findTokenStart(getText(), end) : 0;
            RecipientChip chip = null;
            try {
                if (!mNoChips) {
                    chip = constructChipSpan(entry, start, false);
                    chipText.setSpan(chip, 0, textLength, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            } catch (NullPointerException e) {
                Log.e(TAG, e.getMessage(), e);
            }
            editable.replace(tokenStart, tokenEnd, chipText);
            // Add this chip to the list of entries "to replace"
            if (chip != null) {
                if (mTemporaryRecipients == null) {
                    mTemporaryRecipients = new ArrayList<RecipientChip>();
                }
                chip.setOriginalText(chipText.toString());
                mTemporaryRecipients.add(chip);
            }
        }
    }
";i:1;s:4:"java";i:2;N;}i:2;i:23318;}i:72;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:25158;}i:73;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:25158;}}