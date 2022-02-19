---
title: 前端的blob,file,filereader对象
date: 2020-04-29 12:12:22
tags:
---
肯定有人在看到这三个对象的时候会很惊讶：难道前端终于开始像后端一样，可以操控文件了吗？
其实不是，现在来看看这三个对象：

## Blob
Blob：https://developer.mozilla.org/zh-CN/docs/Web/API/Blob

首先，Blob 对象表示一个不可变、原始数据的类文件对象。Blob 表示的不一定是JavaScript原生格式的数据。
接下来，File 接口基于Blob，继承了 blob 的功能并将其扩展使其支持用户系统上的文件。

## File
File：https://developer.mozilla.org/zh-CN/docs/Web/API/File

通常情况下， File 对象是来自用户在一个 <input> 元素上选择文件后返回的 FileList 对象,也可以是来自由拖放操作生成的 DataTransfer 对象，或者来自 HTMLCanvasElement 上的 mozGetAsFile() API。

## FileReader
FileReader：https://developer.mozilla.org/zh-CN/docs/Web/API/FileReader

FileReader 对象允许Web应用程序异步读取存储在用户计算机上的文件（或原始数据缓冲区）的内容，使用 File 或 Blob 对象指定要读取的文件或数据。

其中File对象可以是来自用户在一个<input>元素上选择文件后返回的FileList对象,也可以来自拖放操作生成的 DataTransfer对象,还可以是来自在一个HTMLCanvasElement上执行mozGetAsFile()方法后返回结果。

重要提示： FileReader仅用于以安全的方式从用户（远程）系统读取文件内容 它不能用于从文件系统中按路径名简单地读取文件。 要在JavaScript中按路径名读取文件，应使用标准Ajax解决方案进行服务器端文件读取，如果读取跨域，则使用CORS权限。

## 解释FileReader

从简介可以知道，其中blob，file都真的只是两个普通的对象而已，并不能读取文件，唯一能够读取文件的对象，却是不能通过路径读取，只能通过input ，拖放 ，HTMLCanvasElement，这三个对象生成的。

## 结论
所以，结论就是只靠前端js是没法直接、主动读取文件的

## 作用
那问题来了，这三个对象拿来有用吗？？
当然有用，这就是三个普通的js对象而已，在某些接口里面会需要用到这些对象（比如七牛上传文件的时候，文件格式就是blob的），你可能会需要用到它们。
