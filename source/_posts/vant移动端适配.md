---
title: vant移动端适配
date: 2020-06-13 22:42:26
tags:
---

## 关于vant

官网：https://youzan.github.io/vant/#/zh-CN/quickstart。

vant是一个轻量、可靠的针对移动端的UI组件库，对vue3.0很友好。

那么既然是针对移动端，有关移动端的适配就很重要了，这里就重点讲解下官网推荐的移动端适配方案：lib-fleible + postcss-pxtorem插件。

## lib-flexible插件

github地址：https://github.com/amfe/lib-flexible。

原理：这款插件就是用来设置根元素字号大小的。

这个插件的移动端适配方案就是根据一个单位rem来的。简单来说，rem就是一个会根据根元素（根元素可以理解为html元素）字体大小以及浏览器默认字体大小而自动变化的一个单位。

rem与px的转换关系：1rem就等于根元素设定的font-size的px值。

一，使用方式：

1，安装插件：npm i -S lib-flexible
2，在main.js里面引入：import 'lib-flexible'
3，在postcss.config.js里面添加配置（没有这个文件就新建一个）：
'postcss-pxtorem': {
  rootValue: 37.5,
  propList: ['*'],
},
二，注意：
配置的时候，rootValue是用来配置根元素字体大小的，最好配置37.5，因为其他字号可能会跟你你引入的vant组件的内部css冲突，也就是会导致第三方字体缩小的问题。
具体原因就是vant组件是根据移动端设备的dpr（设备像素比）等于1的时候来写的，而在lib-flexible插件中，在rootValue为37.5的时候，dpr就为1，与第三方组件参照的标准一样。
当然，针对第三方字体缩小的问题也可以修改第三方组件的源文件或者webpack配置忽略node_modules文件夹，但是这样显然太麻烦。
三，lib-flexible兼容ipad，ipad pro
打开node_modules文件夹下面的lib-flexible中的fleible.js文件，你会发现在refreshRem函数里面有这么一个判断代码：
var width = docEl.getBoundingClientRect().width;
if (width / dpr > 540) {
    width = 540 * dpr;
}

这段代码就限制了屏幕宽度与dpr的比最大只能为540，所以想要兼容ipad甚至pc端，可以自己把540改大点或者直接注释掉if判断语句。

不过既然设计者故意添加了这个判断，那最好在ipad平台上就直接用pc端的样式比较好了。

## postcss-pxtorem 插件

一，使用方式：

1，安装插件：npm i -S postcss-pxtorem
2，在main.js里面引入：import 'postcss-pxtorem'
3，在postcss.config.js里面添加配置：
// webpack4新写法
'autoprefixer': {
  overrideBrowserslist: [
    'Android >= 4.0', 'iOS >= 8'
  ],
  grid: true,
},
  