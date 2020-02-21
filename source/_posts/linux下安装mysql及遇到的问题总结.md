---
title: linux下安装mysql遇到的问题总结
date: 2020-02-21 21:51:39
tags:
---

我真的没想到安装myslq数据库会遇到这么多问题，浪费了很多时间，所以记录下来。

## 一，安装
安装：yum -y install mysql mysql-server mysql-devel

可能会出现的问题：No package mysql-server available
也就是说没安装上mysql-server
解决办法：  rpm -ivh https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm
然后重新执行命令： yum -y install mysql-server

## 二，安装完成后root密码是随机的

查看随机密码的方式：cat /var/log/mysqld.log | grep password

有了这个密码就可以重新更改root密码了

## 三，修改密码报错Your password does not satisfy the current policy requirements

这是因为你的密码太简单了，需要设置密码强度级别
登录mysql运行：set global validate_password_policy=LOW;
然后就可以改简单密码了

## 四，默认root密码是不允许远程访问的

提示错误：2003 can't connect to MySQL server on ip(10060)

解决办法：登录mysql然后运行以下语句
1，use mysql;
2，UPDATE user SET `Host` = '%' WHERE `User` = 'root' LIMIT 1;
3，flush privileges;


注:查看允许访问的ip方式:SELECT User, Host FROM mysql.user;

## 五，开放防火墙端口号

centos 7使用firewall方式，这里记录的是centos 7，7以下用的是iptables，需要自行百度

1，查看本机已经启用的监听端口:
ss -ant
2，firewall常用命令：
#centos7启动防火墙
systemctl start firewalld.service
#centos7停止防火墙/关闭防火墙
systemctl stop firewalld.service
#centos7重启防火墙
systemctl restart firewalld.service

3，新增开放一个端口号
firewall-cmd --zone=public --add-port=80/tcp --permanent
4，重启防火墙：
systemctl restart firewalld.service

## 六，如果以上操作还不行！！！
那么请你登录你的云服务器，找到  网络和安全组，
配置网络和安全组3306（mysql运行的端口）
终于，可以连接了！！！

