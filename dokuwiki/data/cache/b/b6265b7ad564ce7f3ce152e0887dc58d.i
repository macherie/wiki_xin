a:32:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"如何控制驱动代码的初始化时间";i:1;i:3;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:378:"一般情况下，我们注册驱动代码的init函数使用module_init这个宏。但是使用这个宏，我们只能保证代码被运行，不能确定他的运行时间。在有些场合，我们需要保证某个驱动先于另一个驱动被启动，则这个宏的功能就无法完成我们的目的。（我觉得在MTK的代码平台下会比较常有这种情况）";}i:2;i:52;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:431;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:431;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"init.h";i:1;i:4;i:2;i:431;}i:2;i:431;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:431;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:431;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"在kernel/include/linux/init.h中module_init做了详尽的声明";}i:2;i:444;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:515;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1256:"
/*为了方便阅读，我修改了行的顺序*/
268 #define module_init(x)  __initcall(x)
214 #define __initcall(fn) device_initcall(fn)
196 #define pure_initcall(fn)               __define_initcall(fn, 0)
198 #define core_initcall(fn)               __define_initcall(fn, 1)
199 #define core_initcall_sync(fn)          __define_initcall(fn, 1s)
200 #define postcore_initcall(fn)           __define_initcall(fn, 2)
201 #define postcore_initcall_sync(fn)      __define_initcall(fn, 2s)
202 #define arch_initcall(fn)               __define_initcall(fn, 3)
203 #define arch_initcall_sync(fn)          __define_initcall(fn, 3s)
204 #define subsys_initcall(fn)             __define_initcall(fn, 4)
205 #define subsys_initcall_sync(fn)        __define_initcall(fn, 4s)
206 #define fs_initcall(fn)                 __define_initcall(fn, 5)
207 #define fs_initcall_sync(fn)            __define_initcall(fn, 5s)
208 #define rootfs_initcall(fn)             __define_initcall(fn, rootfs)
209 #define device_initcall(fn)             __define_initcall(fn, 6)
210 #define device_initcall_sync(fn)        __define_initcall(fn, 6s)
211 #define late_initcall(fn)               __define_initcall(fn, 7)
212 #define late_initcall_sync(fn)          __define_initcall(fn, 7s)
";i:1;s:1:"c";i:2;N;}i:2;i:515;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:515;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"显然，module_init 等效于 device_initcall 从她后续的声明我们可以猜测，他的时间顺序要晚于arch_initcall等宏声明的函数。";}i:2;i:1782;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1936;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1936;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"实践";i:1;i:4;i:2;i:1936;}i:2;i:1936;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:4;}i:2;i:1936;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1936;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:137:"处于MTK平台的局限，我现在有个需求，需要将fm的代码先于MTK i2c adapter驱动运行。一下是我的修改方案：";}i:2;i:1949;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2092;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:621:"
1290 static int __init rda_module_init_f(void)
1291 {
1292         int err;
1293         RDA_DEBUG("chaser    init in it\n");
1294         err = i2c_register_board_info(3,&fm_i2c_info,1);
1295         RDA_DEBUG("chaser ret=%d\n",err);
1296         err = platform_device_register(&rda_fm_device);
1297         err = platform_driver_register(&rda_fm_platform);
1298         if(err)
1299         {
1300                 RDA_ERR("module_init:register i2c is err\n");
1301                 return err;
1302         }
1303         return 0;
1304 }
1305 - module_init(rda_module_init_f);
1305 + arch_initcall(rda_module_init_f);
";i:1;s:1:"c";i:2;N;}i:2;i:2092;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2092;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"一下是使用module_init和使用arch_initcall两种情况的log信息：";}i:2;i:2724;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2805;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:210:"
/*修改前使用module_init*/
4371 <1>[    3.512734]<2>.(1)[1:swapper/0]RDA DEBUG chaser    init in it
/*修改后使用arch_initcall*/
586 <1>[    0.676376]<2>.(1)[1:swapper/0]RDA DEBUG chaser    init in it
";i:1;s:1:"c";i:2;N;}i:2;i:2805;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2805;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"有效。";}i:2;i:3027;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3036;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3036;}i:31;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3036;}}