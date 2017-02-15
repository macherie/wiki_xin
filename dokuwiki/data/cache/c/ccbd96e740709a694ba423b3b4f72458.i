a:33:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"安装git daemon";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"1. 创建git账户";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:31;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"sudo useradd –m git：创建一个名为git的账户";}i:2;i:60;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:114;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:114;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"sudo passwd git：运行此命令后，可设置git账户的密码";}i:2;i:116;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:182;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:184;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"2. 安装 git daemon";i:1;i:2;i:2;i:184;}i:2;i:184;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:184;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
sudo apt-get install git-daemon-run
";i:1;N;i:2;N;}i:2;i:220;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:267;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:74:"3. 安装好git-daemon后, 需要修改配置文件 /etc/sv/git-daemon/run";i:1;i:2;i:2;i:267;}i:2;i:267;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:267;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:267;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"将";}i:2;i:353;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:362;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:174:"
#!/bin/sh
exec 2>&1
echo 'git-daemon starting.'
exec chpst -ugitdaemon \
  "$(git --exec-path)"/git-daemon --verbose --reuseaddr \
    --base-path=/var/cache /var/cache/git
";i:1;N;i:2;N;}i:2;i:362;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:362;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"修改为：";}i:2;i:545;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:563;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:207:"
#!/bin/sh
exec 2>&1
echo 'git-daemon starting.'
exec chpst -ugitdaemon:git \
  "$(git --exec-path)"/git-daemon --verbose --enable=receive-pack --export-all --reuseaddr \
    --base-path=/home/git /home/git
";i:1;N;i:2;N;}i:2;i:563;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:780;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"4. 修改后重启git-daemon";i:1;i:2;i:2;i:780;}i:2;i:780;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:780;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:47:"
sudo sv down git-daemon
sudo sv up git-daemon
";i:1;N;i:2;N;}i:2;i:824;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:880;}i:32;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:880;}}