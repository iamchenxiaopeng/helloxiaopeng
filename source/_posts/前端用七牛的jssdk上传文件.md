---
title: 前端用七牛的jssdk上传文件
date: 2019-12-17 22:05:04
tags:
---

## 起步
[JavaScript SDK 下载地址](https://github.com/qiniu/js-sdk/releases)。
[JavaScript SDK 源码地址](https://github.com/qiniu/js-sdk)。
[JavaScript SDK 下载地址](http://jssdk-v2.demo.qiniu.io/)。

下载完毕后解压该项目

1，进入 test 目录，按照目录下的 config.json.example 示例，创建 config.json 文件，其中，Access Key 和 Secret Key 按如下方式获取

开通七牛开发者帐号
登录七牛开发者自助平台，查看 AccessKey 和 SecretKey 。
``` bash
module.exports = {
  AccessKey: "<Your Access Key>",
  SecretKey: "<Your Secret Key>",
  Bucket: "<Your Bucket Name>", //这个是创建对象存储的时候，给它取的名字
  Port: 19110,
  UptokenUrl: "token", // 填 'token' 就好了
  Domain: "<Your Bucket Domain>" // Bucket 的外链默认域名，在 Bucket 的内容管理里查看，如：'http://xxx.bkt.clouddn.com/'
}

```
Domain可以在内容管理里看到：
<img src="/images/other/qiniu.png">
2，进入项目根目录，执行 npm install 安装依赖库，然后打开两个终端，一个执行 npm run serve 跑 server， 一个执行 npm run dev 运行服务 demo1； demo2 为测试es6语法的 demo，进入 demo2 目录，执行 npm install，然后 npm start 运行 demo2，demo1 和 demo2 都共用一个 server。

## 说一下需要注意的地方
这个项目分有前端也有后端
先说后端
UptokenUrl是什么呢？它是后端用来获取token的，就是你存储对象的地址
在项目中test文件夹下server.js中，使用express插件搭建了node服务器，通过  
fs.readFileSync(path.resolve(__dirname, "config.json"))
获取了刚刚我们从config.json里面的配置，然后获取了token
然后是前端
前端就是熟悉的webpack了，把webpack.dev.js里面的devServer的一个host属性改成localhost，项目就运行了

如果bootstrap加载失败了的话，直接在网上找一个在线引入的boostrap就行了

## 最后发一个精简版本的七牛上传代码
``` bash
let putExtra = {
  fname: "",
  params: {},
  mimeType: null
}
let config = {
  useCdnDomain: true,
  disableStatisticsReport: false,
  retryCount: 6,
  region: qiniu.region.z2
}
let observable = qiniu.upload(file, name, token, putExtra, config);
observable.subscribe({
  error: (err) => {console.error(JSON.stringify(err))},
  complete: (res) => {
    console.log(res)
  }
})
```