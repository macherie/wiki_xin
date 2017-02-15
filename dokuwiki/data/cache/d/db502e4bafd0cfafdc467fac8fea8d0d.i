a:51:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"安装gerrit";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:27;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"1. 安装mysql";i:1;i:4;i:2;i:27;}i:2;i:27;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:27;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
sudo apt-get install mysql-server
";i:1;N;i:2;N;}i:2;i:53;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:97;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:66:"2. 需要创建一个专用账户用来管理gerrit相关的信息";i:1;i:4;i:2;i:97;}i:2;i:97;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:97;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:97;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"创建用户gerrit2：";}i:2;i:171;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:199;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:25:"
sudo useradd -m gerrit2
";i:1;N;i:2;N;}i:2;i:199;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:199;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"为gerrit2设置密码：";}i:2;i:234;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:265;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
sudo passwd gerrit2
";i:1;N;i:2;N;}i:2;i:265;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:265;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"把gerrit2账户添加到git组里以便gerrit能够读取版本库内容。";}i:2;i:295;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:377;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:26:"
sudo adduser gerrit2 git
";i:1;N;i:2;N;}i:2;i:377;}i:22;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:413;}i:23;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:167:"3. 换到gerrit2用户下：su gerrit2，然后使用命令cp –a /tmp/gerrit-2.2.1.war gerrit.war将之前下载的gerrit-2.2.1.war拷贝到/home/gerrit2目录下。";i:1;i:4;i:2;i:413;}i:2;i:413;}i:24;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:413;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:588;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:365:"4. 创建mysql用户：先使用命令进入mysql的控制台：mysql -u root -p，并输入root用户的密码（root的密码在安装mysql时设置的），进入mysql控制台。执行以下命令创建一个与数据库关联的web应用的用户，并给这个用户设置密码，创建一个数据库，并使新建的用户对数据库具有最高权限。";i:1;i:4;i:2;i:588;}i:2;i:588;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:588;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:244:"
CREATE USER 'gerrit2'@'localhost' IDENTIFIED BY '123';
CREATE DATABASE reviewdb;
ALTER DATABASE reviewdb charset=utf8;
GRANT ALL ON reviewdb.* TO 'gerrit2'@'localhost';
FLUSH PRIVILEGES;                               ----------刷新数据库
";i:1;N;i:2;N;}i:2;i:965;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1219;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:333:"5. 安装gerrit：新建了mysql的用户后，退出mysql控制台（exit命令即可）。然后执行命令java -jar gerrit.war init -d review_site安装和配置gerrit。之后会问一些配置，还要求输入数据库的密码。在实际操作中，有如下几条需要特别说明，其他默认即可（直接回车）：";i:1;i:4;i:2;i:1219;}i:2;i:1219;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1219;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2366:"
Create '/home/gerrit2/review_site' [Y/n]? y       ---------------创建review_site文件夹
Location of Git repositories   [git]: 
Database server type           [H2/?]: mysql  ---------------数据库的类型选择mysql
Gerrit Code Review is not shipped with MySQL Connector/J 5.1.10
**  This library is required for your configuration. **
Download and install it now [Y/n]? y           ---------下载并安装与mysql相关的lib库
Use mysql-connector-java-5.1.10.jar anyway [y/n]? y
Server hostname                [localhost]: 
Server port                    [(MYSQL default)]:
Database name                  [reviewdb]:  ----数据库的名字为reviewdb，直接回车
Database username              [gerrit2]:     ----数据库的用户为gerrit2，直接回车
gerrit2's password             :              -----输入gerrit2的密码。此处gerrit2的密码要与ubuntu系统的密码区分开，此处输入的密码应该是在数据库中gerrit2用户的密码(123)
Authentication method          [OPENID/?]: ldap -----------选择用户认证方式
LDAP server                    [ldap://localhost]: ldap://simcom-sh.com
LDAP username                  : gitserver
gitserver's password           : sim123_2015
              confirm password : sim123_2015
Account BaseDN                 [DC=com]: ou=gerrit server,DC=simcom-sh,DC=com
Group BaseDN                   [ou=gerrit server,DC=simcom-sh,DC=com]: CN=gerrit,ou=gerrit server,DC=simcom-sh,DC=com
SMTP server hostname           [localhost]: mail.sim.com
SMTP server port               [(default)]: 
SMTP encryption                [NONE/?]: 
SMTP username                  [gerrit2]: gitserver
gitserver's password           : sim123_2015
              confirm password : sim123_2015
Run as                         [gerrit2]: 
Java runtime                   [/usr/lib/jvm/jdk1.6.0_34/jre]: 
Copy gerrit.war to /home/gerrit2/review_site/bin/gerrit.war [Y/n]? y  -----拷贝
Gerrit Code Review is not shipped with Bouncy Castle Crypto v144
  If available, Gerrit can take advantage of features
  in the library, but will also function without it.
Download and install it now [Y/n]? y          ------------下载和安装与gerrit相关的lib库
Behind reverse proxy           [y/N]? 
Use SSL (https://)             [y/N]? 
Listen on address              [*]: 
Listen on port                 [8080]:
";i:1;N;i:2;N;}i:2;i:1564;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3940;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"6. 修改配置文件";i:1;i:4;i:2;i:3940;}i:2;i:3940;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:3940;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
vim review_site/etc/gerrit.config
";i:1;N;i:2;N;}i:2;i:3973;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3973;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"在最后加入如下几行：";}i:2;i:4018;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4054;}i:40;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:95:"
[repo]
        showDownloadCommand = true
[gitweb]
        cgi = /usr/share/gitweb/gitweb.cgi
";i:1;N;i:2;N;}i:2;i:4054;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4159;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"7. 设置开机自动启动";i:1;i:4;i:2;i:4159;}i:2;i:4159;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:4159;}i:44;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:188:"
sudo ln -snf /home/gerrit2/review_site/bin/gerrit.sh /etc/init.d/gerrit.sh
sudo ln -snf /etc/init.d/gerrit.sh /etc/rc2.d/S90gerrit
sudo ln -snf /etc/init.d/gerrit.sh /etc/rc3.d/S90gerrit
";i:1;N;i:2;N;}i:2;i:4198;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4198;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:155:"服务自动启动脚本/etc/init.d/gerrit.sh需要通过/etc/default/gerritcodereview提供一些默认的配置。以下面的内容来创建该文件。";}i:2;i:4396;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4557;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
GERRIT_SITE=/home/gerrit2/review_site
NO_START=0
";i:1;N;i:2;N;}i:2;i:4557;}i:49;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4615;}i:50;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4615;}}