a:22:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"HTML显示计时器";i:1;i:3;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:4:"html";i:1;a:1:{i:0;s:664:"
<div id="test" style="color:green; font-size:30pt; margin:auto; text-align:center"></div>
<script>
var a = document.getElementById("test");
function startTimer() {
    setTimeout("startTimer()", 10);
    msec += 10;
    if(msec >= 1000) {
        msec = 0;
        sec +=1;
    }
    if(sec >= 60) {
        sec = 0;
        min += 1;
    }
    a.innerHTML = o(min) + ":" + o(sec) + ":" + t(msec);
}
function o(arg) {
    return arg >= 10 ? arg : "0" + arg;
}
function t(arg) {
    if(arg >= 100) return arg;
    if(arg >= 10) return "0" + arg;
    return "00" + arg;
}
var min, sec, msec;
min = sec = msec = 0;
a.innerHTML = "00:00:000";
startTimer();
</script>
";}i:2;i:35;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:706;}i:6;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:707;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:710;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"HTML计时器源码";}i:2;i:712;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:731;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:733;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:739;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:679:"
<html>
<div id="test" style="color:green; font-size:30pt; margin:auto; text-align:center"></div>
<script>
var a = document.getElementById("test");
function startTimer() {
    setTimeout("startTimer()", 10);
    msec += 10;
    if(msec >= 1000) {
        msec = 0;
        sec +=1;
    }
    if(sec >= 60) {
        sec = 0;
        min += 1;
    }
    a.innerHTML = o(min) + ":" + o(sec) + ":" + t(msec);
}
function o(arg) {
    return arg >= 10 ? arg : "0" + arg;
}
function t(arg) {
    if(arg >= 100) return arg;
    if(arg >= 10) return "0" + arg;
    return "00" + arg;
}
var min, sec, msec;
min = sec = msec = 0;
a.innerHTML = "00:00:000";
startTimer();
</script>
</html>
";i:1;s:10:"javascript";i:2;N;}i:2;i:739;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:739;}i:14;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1439;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:1441;}i:16;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1442;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1444;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1450;}i:19;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:489:"

package com.android.sim;                                                                                                                                       
 
public class CommonDrive {
    static {
        System.loadLibrary("CommonDrive");
    }
    public native int getVoltage();
    public native String getCapacity();
    public native int changeUsbDriver(String value);
    public native int getUsbDriver();
    public native int openMic();
    public native int closeMic();
}
";i:1;s:4:"java";i:2;s:14:"myexample.java";}i:2;i:1450;}i:20;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1967;}i:21;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1967;}}