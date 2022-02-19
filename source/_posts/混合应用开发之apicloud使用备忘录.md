---
title: 混合应用开发之apicloud使用备忘录
date: 2020-04-2 20:52:26
tags:
---

## 开发环境配置
APICloud SKD(Apploader也在里面)下载：https://docs.apicloud.com/Download/download
安卓模拟器选择：夜神模拟器

## 项目开发
1，使用APIcloud Studio下载已有项目方法：
代码管理=>代码捡出=>APIcloud云端应用
2，使用APIcloud Studio下载已有项目方法：
文件=>新建=>APIcloud移动应用
3，项目运行
项目=>运行
4，开发的时候代码热更新（重要）
(1).鼠标移动到开发工具左边的项目根目录上，然后单击鼠标右键，然后Wifi自动同步=>打开
(2).鼠标移动到开发工具左边的项目根目录上，然后单击鼠标右键，然后选择Wifi全量同步
5.打包测试版本项目
鼠标移动到开发工具左边的项目根目录上，然后单击鼠标右键，然后单击本地编译（云编译也行）

## 开发积累
1，项目在模拟器上运行时候报错：XXX模块未绑定，如果您使用了apploader进行调试，请在网站控制台绑定后...
这个一般是使用了自定义模块后才有的，首先检查是否在项目中添加了该模块，步骤：
鼠标移动到开发工具左边的项目根目录上，然后单击鼠标右键，点击模块管理，点击模块库，搜索该模块，点击右上角的"+"添加该模块到项目中
其次得云编译自定义loader，然后下载到手机上运行就不会报错了，步骤：
鼠标移动到开发工具左边的项目根目录上，然后单击鼠标右键，点击云编译自定义loader，点击编译自定义loader。编译好后可以扫码下载
2，哪些是自定义loader？
一直以来，官方发布的AppLoader，只包含了官方模块。而其他开发者的自定义模块、付费模块、第三方SDK模块等都并未加入到loader中
https://docs.apicloud.com/Dev-Guide/Custom_Loader
3，项目中经常会使用到的功能：下滑到到底部后加载更多。这个需要用到apicloud的scrolltobottom事件。可以在common.js里面添加
``bash
function isBottom(callback) {
  api.addEventListener({
      name: 'scrolltobottom',
      extra: {
        threshold: 100 //设置距离底部多少距离时触发，默认值为0，数字类型
      }
    },
    function (ret, err) {
      if (callback) {
        callback(ret)
      }
    })
};
``
通过此函数判断，用户滑动到底部后执行回调函数
4，关于录音模块
如果百度录音模块，基本会搜到audioRecorder模块，但是这个模块是要钱的，这里说个不要钱的录音模块。
由于安卓和ios支持播放的音频格式不完全相同，所以对于一个混合开发来说，最好是找一个两个都能支持的音频格式：mp3。
这里推荐使用：recMp3这个模块。https://docs.apicloud.com/Client-API/Func-Ext/recMp3

