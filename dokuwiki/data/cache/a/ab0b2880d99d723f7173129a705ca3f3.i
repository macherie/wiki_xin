a:23:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"using the check_vmlinux_match.py to check if the dump and vmlinux mismatch or not.";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:83;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:83;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"1. what is check_vmlinux_match.py";}i:2;i:86;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:125;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:500:"
yingangl@yingangl-work:~/sdc/case/Huawei/02389676/dump00$ cat check_vmlinux_match.py
import binascii
a = "Linux version"
line_no = 0
print "================Vmliux:===================="
for line in open("vmlinux",'rb'):
    line_no = line_no+1
    if a in line:
        print"%d            :" %line_no +line


print "=================DDRCS0.bin:================"
line_no = 0
for line in open("DDRCS0.BIN",'rb'):
    line_no = line_no+1
    if a in line:
        print"%d            :" %line_no +line
";i:1;N;i:2;N;}i:2;i:125;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:125;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"2. the check_vmlinux_match.py , dump and vmlinux should put in the same path";}i:2;i:636;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:718;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:420:"
yingangl@yingangl-work:~/sdc/case/Huawei/02389676/dump00$ ls
CODERAM.BIN  DDRCS1.BIN     IPA_DICT.bin  IPA_IRAM.bin  IPA_REG2.bin  load.cmm     OCIMEM.BIN    PMIC_RTC.BIN       RST_STAT.BIN
DATARAM.BIN  DDR_DATA.BIN   IPA_DRAM.bin  IPA_MBOX.bin  IPA_REG3.bin  loadreg.cmm  parser        QCAPReport00.html  vmlinux
DDRCS0.BIN   dump_info.txt  IPA_HRAM.bin  IPA_REG1.bin  IPA_SRAM.bin  MSGRAM.BIN   PMIC_PON.BIN  rpm.bat
";i:1;N;i:2;N;}i:2;i:718;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:718;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"3. run the  python check_vmlinux_match.py";}i:2;i:1148;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1195;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:529:"
yingangl@yingangl-work:~/sdc/case/Huawei/02389676/dump00$ python check_vmlinux_match.py
================Vmliux:====================
42685            :Linux version 3.10.84-gac0d179-dirty (android@localhost) (gcc version 4.9.x-google 20140827 (prerelease) (GCC) ) #1 SMP PREEMPT Thu Mar 17 15:14:31 CST 2016

=================DDRCS0.bin:================
43828            :Linux version 3.10.84-gac0d179-dirty (android@localhost) (gcc version 4.9.x-google 20140827 (prerelease) (GCC) ) #1 SMP PREEMPT Thu Mar 17 15:14:31 CST 2016
";i:1;N;i:2;N;}i:2;i:1195;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1195;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"4. if you see the timestamp is not matched, this means the dump and vmlinux is mismatched,";}i:2;i:1734;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1824;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1824;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"if you see the timestamp matched, this means the dump and vmlinux is mismatched.";}i:2;i:1827;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1827;}i:22;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1827;}}