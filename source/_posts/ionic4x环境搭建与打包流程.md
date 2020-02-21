---
title: ionic4x环境搭建与打包流程
date: 2019-12-14 01:01:02
tags:
---
整个流程下来，遇到很多坑，我发现最麻烦的就是所有工具包之间各个版本的兼容性问题，所以只要找到了能互相兼容、不出bug的版本，就算基本成功了！
剩下的一些需要注意的地方我在下面会特别说明。

## 环境与工具版本说明（很重要）

Android Studio: android-studio-ide-191.6010548-windows (最新版)
Android SDK Tools: 26.1.1
jdk: jdk1.8.0_71
gradle: 3.3
ionic-cli: 5.4.12 (ionic的版本是4.11.7)
cordova: 9.0.0(好像ionic用的是8.0.0)
node: 10.15.3

## 开始
### node，cordova，ionic安装
### jdk安装(最好安装1.8的)
### sdk安装
[官方地址](https://ionicframework.com/docs/installation/android)
注意添加  ANDROID_HOME  ANDROID_SDK_ROOT 这两个环境变量（值就是sdk路径）
然后在path里面添加 %ANDROID_HOME%\tools 和 %ANDROID_HOME%\platform-tools
### gradle全局安装
没有gradle直接打包会报错，所以先全局添加gradle
[地址](https://gradle.org/releases)
下载binary-only的类型，然后解压到任意文件夹，把该解压的文件的bin目录添加到环境变量中
### 创建项目
ionic start myApp tabs
### 添加平台
ionic cordova platform add android
### 打包
ionic cordova build android

## 总结
打包其实很简单的，麻烦的是环境搭建，不同版本号之间运行可能就会出现莫名其妙的错误。
所以最好就按照上面说的版本号来，上面是亲测可用的。