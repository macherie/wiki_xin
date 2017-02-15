a:28:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"安装x11vnc远程管理";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"1. 安装x11vnc";i:1;i:4;i:2;i:38;}i:2;i:38;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:38;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:29:"
sudo apt-get install x11vnc
";i:1;N;i:2;N;}i:2;i:65;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:104;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"2. 接下来创建登陆密码";i:1;i:4;i:2;i:104;}i:2;i:104;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:104;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:26:"
sudo x11vnc -storepasswd
";i:1;N;i:2;N;}i:2;i:146;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:182;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"3. 再设置X11VNC的密码文件：";i:1;i:4;i:2;i:182;}i:2;i:182;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:182;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:46:"
sudo x11vnc -storepasswd in /etc/x11vnc.pass
";i:1;N;i:2;N;}i:2;i:230;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:286;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"4. 将密码文件复制过去：";i:1;i:4;i:2;i:286;}i:2;i:286;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:286;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:40:"
sudo cp ~/.vnc/passwd /etc/x11vnc.pass
";i:1;N;i:2;N;}i:2;i:331;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:381;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:155:"5. 打开/etc/init/x11vnc.conf文件，粘贴以下内容。如果没有这个文件，就用文本工具创建一个。端口:5900，自己可以定义。";i:1;i:4;i:2;i:381;}i:2;i:381;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:381;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:174:"
start on login-session-start
script
x11vnc -display :0 -auth /var/run/lightdm/root/:0 -forever -bg -o /var/log/x11vnc.log -rfbauth /etc/x11vnc.pass -rfbport 5900
end script
";i:1;N;i:2;N;}i:2;i:548;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:732;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"6. 保存后重启Ubuntu。";i:1;i:4;i:2;i:732;}i:2;i:732;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:732;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:765;}i:27;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:765;}}