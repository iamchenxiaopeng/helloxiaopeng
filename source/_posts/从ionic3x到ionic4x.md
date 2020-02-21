---
title: 从ionic3x到ionic4x
date: 2019-12-12 21:43:53
tags:
---
有段时间没接触ionic了，现在对ionic4x和3x版本区别做个对比，让自己对ionic4x快速熟悉起来!
首先，ionic3x的[官网地址](https://ionicframework.com/docs/v3/)。
然后ionic4x的[官网地址](https://ionicframework.com/)。
顺便吐槽下，这些年前端技术更新真的是太快了。

## 最大变化

首先，[官方的迁移地址](https://ionicframework.com/docs/building/migration)

1，ionic4x将会支持Vue和React。
2，ionic4x支持的系统：
Android：4.4+
ios：10+


## ionic-Cli

``` bash
ionic start <name> <template> [options]
```

想要看看有哪些template？
``` bash
ionic start --list
```

想继续使用ionic3x？
``` bash
--type=ionic-angular
例如：ionic start myApp super --type=ionic-angular
```

[关于具体options以及其余命令可以到这里看看](https://ionicframework.com/docs/cli/commands/start)

<!-- ## ionic Native

从文档上看，ionic4x似乎比3x少了太多了，但是4x该有的功能似乎都有，只是在4x中很多类似的操作被集合到了一个api上面来。
例如3x操作手机文件的api有：
File Transfer，File Path，File Opener，File Encryption，File Chooser，File六个。
ionic4x只有一个：Filesystem。
但是ionic4x的这个api已经包含了3x的六个api的所有相关功能。

另一个变化就是ionic4x现在支持Capacitor，可以替代cordova。

所以ionic Native改进可以说是相当大，不仅增加了文档可读性，还大大的拓宽了框架的延展性。 -->

## ionic Component
ionic4x组件文档更简洁了，可以直接看每个组件的api（ionic3x的API docs在单独的页面）

## 目录结构
ionic3x
<img src="/images/191212/ionic3.png" style="width: 15%;display: inline-block"><img src="/images/191212/ionic3_1.png" style="width: 85%;display: inline-block">

ionic4x
<img src="/images/191212/ionic4.png" style="width: 15%;display: inline-block"><img src="/images/191212/ionic4_1.png" style="width: 85%;display: inline-block">
通过对比可以发现，ionic4x改变了整个项目的基本结构：
<font color=red face="黑体">**ionic4x默认就有angular的router，而且是使用模块的方式来组成一个app的**</font>
<font color=red face="黑体">**ionic3x默认没有router，使用的是component来组成的app**</font>

