a:49:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"安装gitolite";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"1. 创建专用账号";i:1;i:2;i:2;i:29;}i:2;i:29;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:29;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:172:"安装 Gitolite，首先要在服务器端创建专用帐号，所有用户都通过此帐号访问 Git 库。一般为方便易记，选择 git 作为专用帐号名称。";}i:2;i:62;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:240;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:55:"
$ sudo adduser --system --shell /bin/bash --group git
";i:1;N;i:2;N;}i:2;i:240;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:240;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:"创建用户 git，并设置用户的 shell 为可登录的 shell，如 /bin/bash，同时添加同名的用户组。";}i:2;i:304;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:421;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:421;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:173:"有的系统，只允许特定的用户组（如 ssh 用户组）的用户才可以通过 SSH 协议登录，这就需要将新建的 git 用户添加到 ssh 用户组中。";}i:2;i:423;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:602;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
$ sudo adduser git ssh
";i:1;N;i:2;N;}i:2;i:602;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:602;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"为 git 用户设置口令。当整个 git 服务配置完成，运行正常后，建议取消 git 的口令，只允许公钥认证。";}i:2;i:635;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:776;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:19:"
$ sudo passwd git
";i:1;N;i:2;N;}i:2;i:776;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:805;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:72:"2. 添加权限以便gitweb能够读取版本库的内容：（可选）";i:1;i:2;i:2;i:805;}i:2;i:805;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:805;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
$ sudo usermod -a -G git www-data
";i:1;N;i:2;N;}i:2;i:893;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:938;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"3. 将管理员公钥复制到服务器上";i:1;i:2;i:2;i:938;}i:2;i:938;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:938;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
$ scp ~/.ssh/id_rsa.pub server@ip:/tmp/admin.pub
";i:1;N;i:2;N;}i:2;i:996;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1056;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"4. 安装gitolite";i:1;i:2;i:2;i:1056;}i:2;i:1056;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1056;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:34:"
sudo apt-get -y install gitolite
";i:1;N;i:2;N;}i:2;i:1089;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1133;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"5. 执行gitolite安装";i:1;i:2;i:2;i:1133;}i:2;i:1133;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1133;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:25:"
gl-setup /tmp/admin.pub
";i:1;N;i:2;N;}i:2;i:1172;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1207;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:82:"6. 安装过程中会询问你是否修改配置文件（/home/git/.gitolite.rc）";i:1;i:2;i:2;i:1207;}i:2;i:1207;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1207;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1207;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"修改如下：";}i:2;i:1300;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1321;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:161:"
REPO_UMASK=0007;
版本库创建使用的掩码。即新建立的版本库的权限为'rwxrwx---'。
$GL_WILDREPOS=1；
默认支持通配符版本库授权。
";i:1;N;i:2;N;}i:2;i:1321;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1492;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"7. 退出git账户";i:1;i:2;i:2;i:1492;}i:2;i:1492;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1492;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1520;}i:48;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1520;}}