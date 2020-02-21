---
title: mybatis逆向工程使用
date: 2020-02-20 15:54:18
tags:
---

## 官网地址
[官方地址](http://mybatis.org/generator/)
我这里有一份已经下载好的文件（ide是eclipse），<a href="/file/generatorSqlmapCustom.zip" target="_blank">下载地址</a>


## 介绍

为什么说是逆向呢，因为通常我们用mybatis做项目都是手动写mapper，然后再在mybatis里面配置映射。但是mybatis逆向工程可以根据数据库表，
自动生成基本mapper，我们只需要搭建数据库表就行了，可以大大提高工作效率。

## 文件配置
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
  PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
  "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>
	<context id="testTables" targetRuntime="MyBatis3">
		<commentGenerator>
			<!-- 是否去除自动生成的注释 true：是 ： false:否 -->
			<property name="suppressAllComments" value="true" />
		</commentGenerator>
		<!--数据库连接的信息：驱动类、连接地址、用户名、密码 -->
		<jdbcConnection driverClass="com.mysql.jdbc.Driver"
			connectionURL="jdbc:mysql://localhost:3306/mybatis" userId="root"
			password="root">
		</jdbcConnection>
		<!-- <jdbcConnection driverClass="oracle.jdbc.OracleDriver"
			connectionURL="jdbc:oracle:thin:@127.0.0.1:1521:yycg" 
			userId="yycg"
			password="yycg">
		</jdbcConnection> -->

		<!-- 默认false，把JDBC DECIMAL 和 NUMERIC 类型解析为 Integer，为 true时把JDBC DECIMAL 和 
			NUMERIC 类型解析为java.math.BigDecimal -->
		<javaTypeResolver>
			<property name="forceBigDecimals" value="false" />
		</javaTypeResolver>

		<!-- targetProject:生成PO类的位置 -->
		<javaModelGenerator targetPackage="com.helloxiaopeng.pojo"
			targetProject=".\src">
			<!-- enableSubPackages:是否让schema作为包的后缀 -->
			<property name="enableSubPackages" value="false" />
			<!-- 从数据库返回的值被清理前后的空格 -->
			<property name="trimStrings" value="true" />
		</javaModelGenerator>
        <!-- targetProject:mapper映射文件生成的位置 -->
		<sqlMapGenerator targetPackage="com.helloxiaopeng.mapper" 
			targetProject=".\src">
			<!-- enableSubPackages:是否让schema作为包的后缀 -->
			<property name="enableSubPackages" value="false" />
		</sqlMapGenerator>
		<!-- targetPackage：mapper接口生成的位置 -->
		<javaClientGenerator type="XMLMAPPER"
			targetPackage="com.helloxiaopeng.mapper" 
			targetProject=".\src">
			<!-- enableSubPackages:是否让schema作为包的后缀 -->
			<property name="enableSubPackages" value="false" />
		</javaClientGenerator>
		<!-- 指定数据库表 -->
		<table schema="" tableName="user"></table>
		<table schema="" tableName="item"></table>
		
		<!-- 有些表的字段需要指定java类型
		 <table schema="" tableName="user">
			<columnOverride column="id" javaType="Long" />
		</table> -->
	</context>
</generatorConfiguration>
```

## 运行方式

找到src下面的GeneratorSql.java文件，运行main函数，会自动生成mapper和pojo，把它们放入需要的文件夹就行了。

## 项目下载

<a href="/file/helloworldparent.zip" target="_blank">项目文件</a>

该项目运行方式：
以maven方式导入项目，鼠标右键manager->run as->maven build->tomcat7:run

还有<a href="/file/mybatis.sql" target="_blank">sql文件</a>




