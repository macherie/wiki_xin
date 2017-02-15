a:66:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Utuntu安装Bugzilla";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"1. 安装Apache";i:1;i:2;i:2;i:35;}i:2;i:35;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:35;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:62;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"2. 安装MySQL";i:1;i:2;i:2;i:62;}i:2;i:62;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:62;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:62;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"新建数据库：";}i:2;i:88;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:112;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:214:"
create database bugs;
use bugs;
GRANT SELECT, INSERT, UPDATE, DELETE, INDEX, ALTER, CREATE, LOCK TABLES,CREATE TEMPORARY TABLES, DROP, REFERENCES ON bugs.* TO bugs@localhost IDENTIFIED BY "123";
FLUSH PRIVILEGES;
";i:1;N;i:2;N;}i:2;i:112;}i:13;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:336;}i:14;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"3. 安装Bugzilla";i:1;i:2;i:2;i:336;}i:2;i:336;}i:15;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:336;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:336;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"解压bugzilla-4.4.2.tar.gz到/var/www，重命名为bugzilla";}i:2;i:365;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:426;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:428;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"4. 安装perl模块";i:1;i:2;i:2;i:428;}i:2;i:428;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:428;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:428;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"配置CPAN";}i:2;i:459;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:469;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:469;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"运行perl -MCPAN -e shell";}i:2;i:471;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:503;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:392:"
Would you like to configure as much as possible automatically? [yes]

What approach do you want?  (Choose 'local::lib', 'sudo' or 'manual')

 [local::lib] 

Would you like me to automatically choose some CPAN mirror

sites for you? (This means connecting to the Internet) [yes]no

Would you like to pick from the CPAN mirror list? [yes]no

Please enter your CPAN site: []http://www.cpan.org
";i:1;N;i:2;N;}i:2;i:503;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:503;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"如果下载不了，可以设置cpan代理：";}i:2;i:905;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:957;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:89:"
cpan> o conf http_proxy http://172.21.2.33:808

cpan> o conf commit

cpan> reload index
";i:1;N;i:2;N;}i:2;i:957;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:957;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"在bugzilla文件夹里";}i:2;i:1056;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1085;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
./checksetup.pl

/usr/bin/perl install-module.pl –all
";i:1;N;i:2;N;}i:2;i:1085;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1085;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"如需安装apxs，用命令sudo apt-get install apache2-threaded-dev";}i:2;i:1152;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1221;}i:40;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1223;}i:41;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"5. 配置Bugzilla";i:1;i:2;i:2;i:1223;}i:2;i:1223;}i:42;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1223;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1223;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"修改localconfig：";}i:2;i:1252;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1278;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
$index_html = 1;
$db_pass = '123';
$webservergroup = 'www-data';
";i:1;N;i:2;N;}i:2;i:1278;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1354;}i:48;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"6. 修改Apache配置";i:1;i:2;i:2;i:1354;}i:2;i:1354;}i:49;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1354;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1354;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"sudo vim /etc/apache2/sites-available/default";}i:2;i:1386;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1431;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:240:"
<Directory "/var/www/bugzilla/">
        AddHandler cgi-script .cgi
        Options +Indexes +ExecCGI +FollowSymLinks
        DirectoryIndex index.cgi
        AllowOverride None
        Order allow,deny
        Allow from all
</Directory>
";i:1;N;i:2;N;}i:2;i:1438;}i:54;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1688;}i:55;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"7. 重启Apache和MySQL";i:1;i:2;i:2;i:1688;}i:2;i:1688;}i:56;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1688;}i:57;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/mysql restart
";i:1;N;i:2;N;}i:2;i:1727;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1802;}i:59;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"8. 汉化";i:1;i:2;i:2;i:1802;}i:2;i:1802;}i:60;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1802;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1802;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"解压bugzilla-cn-4.4.zip到bugzilla目录下的template";}i:2;i:1823;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1879;}i:64;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1879;}i:65;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1879;}}