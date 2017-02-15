a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:18228:"
q@pc:~$ mkdir git
q@pc:~$ cd git/
q@pc:~/git$ git init
初始化空的 Git 版本库于 /home/q/git/.git/
q@pc:~/git$ la
.git
q@pc:~/git$ vi .git/config 
q@pc:~/git$ vi test1.c
q@pc:~/git$ git status 
位于分支 master

初始提交

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	test1.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）
q@pc:~/git$ git add test1.c 
q@pc:~/git$ git status 
位于分支 master

初始提交

要提交的变更：
  （使用 "git rm --cached <file>..." 撤出暂存区）

	新文件:       test1.c

q@pc:~/git$ git commit -m "test commit"
[master （根提交） cfe7dcc] test commit
 1 file changed, 1 insertion(+)
 create mode 100644 test1.c
q@pc:~/git$ git log
commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git status 
位于分支 master
无文件要提交，干净的工作区
q@pc:~/git$ git log
commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ vi test2.c
q@pc:~/git$ git status 
位于分支 master
未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	test2.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）
q@pc:~/git$ git add .
q@pc:~/git$ git commit 
[master fffadee] test commit 2
 1 file changed, 1 insertion(+)
 create mode 100644 test2.c
q@pc:~/git$ git log
commit fffadee61cd9ee871309b5a77b7d03e0fec6bf97
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit
    
q@pc:~/git$ git reset --soft HEAD^
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test2.c

q@pc:~/git$ git reset HEAD *
q@pc:~/git$ git status 
位于分支 master
未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	test2.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）
q@pc:~/git$ vi test2.c 
q@pc:~/git$ git add test2.c 
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test2.c

q@pc:~/git$ git commit -c ORIG_HEAD
[master a9f64a1] test commit 2
 1 file changed, 1 insertion(+)
 create mode 100644 test2.c

q@pc:~/git$ git log
commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit
q@pc:~/git$ vi test3.c
q@pc:~/git$ vi test4.c
q@pc:~/git$ git status 
位于分支 master
未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	test3.c
	test4.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）

q@pc:~/git$ git add test*
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test3.c
	新文件:       test4.c

q@pc:~/git$ git stash save "test stash 1"
Saved working directory and index state On master: test stash 1
HEAD 现在位于 a9f64a1 test commit 2
q@pc:~/git$ git stash list 
stash@{0}: On master: test stash 1

q@pc:~/git$ git status 
位于分支 master
无文件要提交，干净的工作区

q@pc:~/git$ git stash apply 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test3.c
	新文件:       test4.c

q@pc:~/git$ git log
commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit
q@pc:~/git$ git commit -m "test commit 3"
[master dcc5a56] test commit 3
 2 files changed, 2 insertions(+)
 create mode 100644 test3.c
 create mode 100644 test4.c
q@pc:~/git$ git status 
位于分支 master
无文件要提交，干净的工作区
q@pc:~/git$ git format-patch -1
0001-test-commit-3.patch
q@pc:~/git$ git log
commit dcc5a5624678d369ee0e97600bcc3de55871f2e3
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git reset --soft cfe7dcc085860bfb96a767e1852b90a0ae12bc84
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test2.c
	新文件:       test3.c
	新文件:       test4.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-3.patch

q@pc:~/git$ git reset HEAD test2.c
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test3.c
	新文件:       test4.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-3.patch
	test2.c

q@pc:~/git$ vi test2.c 
q@pc:~/git$ git status 
位于分支 master
要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	新文件:       test3.c
	新文件:       test4.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-3.patch
	test2.c

q@pc:~/git$ git reset HEAD *
q@pc:~/git$ git status 
位于分支 master
未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-3.patch
	test2.c
	test3.c
	test4.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）
q@pc:~/git$ git add test2.c
q@pc:~/git$ git commit -m "test commit 2-1"
[master b1fe9f4] test commit 2-1
 1 file changed, 2 insertions(+)
 create mode 100644 test2.c
q@pc:~/git$ git status 
位于分支 master
未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-3.patch
	test3.c
	test4.c

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）

q@pc:~/git$ git log 
commit b1fe9f4ea676a68b763dfe8acdefc042a315ba9e
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:46:16 2015 +0800

    test commit 2-1

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit
    
q@pc:~/git$ git format-patch -1
0001-test-commit-2-1.patch
q@pc:~/git$ git reflog
b1fe9f4 HEAD@{0}: commit: test commit 2-1
cfe7dcc HEAD@{1}: reset: moving to cfe7dcc085860bfb96a767e1852b90a0ae12bc84
dcc5a56 HEAD@{2}: commit: test commit 3
a9f64a1 HEAD@{3}: commit: test commit 2
cfe7dcc HEAD@{4}: reset: moving to HEAD^
fffadee HEAD@{5}: commit: test commit 2
cfe7dcc HEAD@{6}: commit (initial): test commit

q@pc:~/git$ git reset --hard dcc5a56
HEAD 现在位于 dcc5a56 test commit 3
q@pc:~/git$ git log
commit dcc5a5624678d369ee0e97600bcc3de55871f2e3
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git reset --hard b1fe9f4
HEAD 现在位于 b1fe9f4 test commit 2-1
q@pc:~/git$ git log
commit b1fe9f4ea676a68b763dfe8acdefc042a315ba9e
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:46:16 2015 +0800

    test commit 2-1

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ vi test2.c 
q@pc:~/git$ git stash save "test2.c"
Saved working directory and index state On master: test2.c
HEAD 现在位于 cfe7dcc test commit
q@pc:~/git$ git stash list 
stash@{0}: On master: test2.c
stash@{1}: On master: test stash 1
q@pc:~/git$ git reflog
cfe7dcc HEAD@{0}: reset: moving to HEAD^
b1fe9f4 HEAD@{1}: reset: moving to b1fe9f4
dcc5a56 HEAD@{2}: reset: moving to dcc5a56
b1fe9f4 HEAD@{3}: commit: test commit 2-1
cfe7dcc HEAD@{4}: reset: moving to cfe7dcc085860bfb96a767e1852b90a0ae12bc84
dcc5a56 HEAD@{5}: commit: test commit 3
a9f64a1 HEAD@{6}: commit: test commit 2
cfe7dcc HEAD@{7}: reset: moving to HEAD^
fffadee HEAD@{8}: commit: test commit 2
cfe7dcc HEAD@{9}: commit (initial): test commit
q@pc:~/git$ git reset --hard dcc5a56
HEAD 现在位于 dcc5a56 test commit 3
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

提交为空，但是存在尚未跟踪的文件（使用 "git add" 建立跟踪）
q@pc:~/git$ git log
commit dcc5a5624678d369ee0e97600bcc3de55871f2e3
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git stash apply stash@{0} 
自动合并 test2.c
冲突（添加/添加）：合并冲突于 test2.c
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

未合并的路径：
  （使用 "git reset HEAD <file>..." 撤出暂存区）
  （使用 "git add <file>..." 标记解决方案）

	双方添加：     test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

修改尚未加入提交（使用 "git add" 和/或 "git commit -a"）
q@pc:~/git$ git diff
diff --cc test2.c
index 6f715d5,fc2fde8..0000000
--- a/test2.c
+++ b/test2.c
@@@ -1,1 -1,2 +1,5 @@@
  332222
++<<<<<<< Updated upstream
++=======
+ test temp -1
++>>>>>>> Stashed changes
q@pc:~/git$ vi test2.c 
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

未合并的路径：
  （使用 "git reset HEAD <file>..." 撤出暂存区）
  （使用 "git add <file>..." 标记解决方案）

	双方添加：     test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

修改尚未加入提交（使用 "git add" 和/或 "git commit -a"）
q@pc:~/git$ git reset HEAD test2.c
重置后撤出暂存区的变更：
M	test2.c
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

尚未暂存以备提交的变更：
  （使用 "git add <file>..." 更新要提交的内容）
  （使用 "git checkout -- <file>..." 丢弃工作区的改动）

	修改:         test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

修改尚未加入提交（使用 "git add" 和/或 "git commit -a"）
q@pc:~/git$ git diff
diff --git a/test2.c b/test2.c
index 6f715d5..fc2fde8 100644
--- a/test2.c
+++ b/test2.c
@@ -1 +1,2 @@
 332222
+test temp -1
q@pc:~/git$ git log
commit dcc5a5624678d369ee0e97600bcc3de55871f2e3
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git commit --amend 
[master f2cd579] test commit 3,modify
 2 files changed, 2 insertions(+)
 create mode 100644 test3.c
 create mode 100644 test4.c
q@pc:~/git$ git log
commit f2cd5795fd9a8c162ce5ccd60cb50608c26cbab9
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3,modify

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

q@pc:~/git$ git add test2.c
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	修改:         test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

q@pc:~/git$ git add test2.c
q@pc:~/git$ git commit --amend 
[master d6be829] test commit 3,modify
 3 files changed, 3 insertions(+)
 create mode 100644 test3.c
 create mode 100644 test4.c
q@pc:~/git$ git log --stat 
commit d6be8295272430475552bf6c716b82280e764702
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:42:25 2015 +0800

    test commit 3,modify

 test2.c | 1 +
 test3.c | 1 +
 test4.c | 1 +
 3 files changed, 3 insertions(+)

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

 test2.c | 1 +
 1 file changed, 1 insertion(+)

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit

 test1.c | 1 +
 1 file changed, 1 insertion(+)

q@pc:~/git$ git am --abort 
您好像在上一次 'am' 失败后移动了 HEAD。未回退至 ORIG_HEAD
q@pc:~/git$ git am --abort 
解决操作未进行，我们不会继续。
q@pc:~/git$ git am --abort 
解决操作未进行，我们不会继续。
q@pc:~/git$ git am -3 0001-test-commit-2-1.patch
正应用：test commit 2-1
使用索引来重建一个（三路合并的）基础目录树...
转而在基础版本上打补丁及进行三路合并...
自动合并 test2.c
冲突（添加/添加）：合并冲突于 test2.c
无法合并变更。
补丁失败于 0001 test commit 2-1
失败的补丁文件副本位于：
   /home/q/git/.git/rebase-apply/patch
当您解决了此问题后，执行 "git am --continue"。
如果您想跳过此补丁，则执行 "git am --skip"。
要恢复原分支并停止打补丁，执行 "git am --abort"。
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

未合并的路径：
  （使用 "git reset HEAD <file>..." 撤出暂存区）
  （使用 "git add <file>..." 标记解决方案）

	双方添加：     test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

修改尚未加入提交（使用 "git add" 和/或 "git commit -a"）
q@pc:~/git$ git diff
diff --cc test2.c
index 6f715d5,fc2fde8..0000000
--- a/test2.c
+++ b/test2.c
@@@ -1,1 -1,2 +1,5 @@@
  332222
++<<<<<<< HEAD
++=======
+ test temp -1
++>>>>>>> test commit 2-1
q@pc:~/git$ vi test2.c 
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

未合并的路径：
  （使用 "git reset HEAD <file>..." 撤出暂存区）
  （使用 "git add <file>..." 标记解决方案）

	双方添加：     test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

修改尚未加入提交（使用 "git add" 和/或 "git commit -a"）
q@pc:~/git$ git add test2.c
q@pc:~/git$ git status 
位于分支 master
您正处于 am 操作过程中。
  （解决冲突，然后运行 "git am --continue"）
  （使用 "git am --skip" 跳过此补丁）
  （使用 "git am --abort" 恢复原有分支）

要提交的变更：
  （使用 "git reset HEAD <file>..." 撤出暂存区）

	修改:         test2.c

未跟踪的文件:
  （使用 "git add <file>..." 以包含要提交的内容）

	0001-test-commit-2-1.patch
	0001-test-commit-3.patch

q@pc:~/git$ git am --continue 
正应用：test commit 2-1
q@pc:~/git$ git log
commit b1862b52542fc3fe04727011332e0eb2f4dad8e3
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:46:16 2015 +0800

    test commit 2-1

commit a9f64a1e23f161e95f2d7ed3d7830173870c8dec
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:37:39 2015 +0800

    test commit 2

commit cfe7dcc085860bfb96a767e1852b90a0ae12bc84
Author: qiancheng <qiancheng@sim.com>
Date:   Fri Aug 14 10:36:51 2015 +0800

    test commit


";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}