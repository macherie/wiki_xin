a:11:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"win7 64位 usb下载地址：";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:36;}i:4;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:64:"
//192.167.100.225/share/Tool/Qualcomm_Driver_8936_20150105.rar
";i:1;N;i:2;N;}i:2;i:36;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:36;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"win7系统需要强制关闭数字签名，进入系统后，使用管理员权限登陆";}i:2;i:109;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:203;}i:8;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:320:"
开启Administrator账户的方法:

Windows 7系统中，administrator账户并不是默认开启的，那么就需要我们手动开启，
这也不是很难的啦！对计算机图标，击右键，选择管理。
打开界面后，选择本地用户和组，单击用户，选择administrator账户,设置密码。
";i:1;N;i:2;N;}i:2;i:203;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:397:"
以管理员权限登陆后，打开cmd后，
cd Windows/System32目录
bcdedit -set loadoptions DDISABLE_INTEGRITY_CHECKS
之后再输入
bcdedit -set TESTSIGNING ON
重启
到这里就一直生效了（验证OK），如果出现个别win7系统还不行，再试试下面的步骤(未验证)

bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS
之后再输入
bcdedit -set TESTSIGNING OFF
重启
";i:1;N;i:2;N;}i:2;i:538;}i:10;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:538;}}