# 南大通用GBASE 8.5S 实施经验

南大通用GBASE移植过程中的注意事项和文档。以下内容只是应用于GBase 8s, 其他版本如GBase 8a并不适用。感谢来自原厂工程师的支持。

## 启动和停止

onmode -ky && oninit -v



## GBASE 类型

* text 不支持用sql插入, 内容不多可以用varchar(320000)代替
* bool就是boolean，值是 'T'=true, 'F'= false

## 切换数据库
* 用database <dbname> 来切换, 比如 database erpdatabase
  
## GBASE 约束
* 约束的名字在最后面

## 分页查询
* select * from user limit 10, 10 可以工作，但是该种模式下，位置不能通过PreparedStatement参数来设置，不要用于编程环境
* select skip 2 first 2 * from user 也可以工作，改模式可以通过PreparedStatement参数来设置，推荐在程序中使用
* Oracle那种模式也能工作，还没有测试过

## 命令行工具 dbaccess

* 导入文件 dbaccess - import.sql

## 设置日期格式

在文件profile.gbaseserver中设置

export GL_DATE=%Y-%m-%d



## JDBC连接和解决中文问题

* 连接字符串jdbc:gbasedbt-sqli://47.99.97.125:9088/gbasedb:gbasedbtserver=gbaseserver;db_locale=zh_cn.utf8;client_locale=zh_cn.utf8;NEWCODESET=utf-8,utf8,57372;
* 驱动类名称 com.gbasedbt.jdbc.IfxDriver
* 用户名，安装该软件的用户名
* 密码，安装该软件的密码

## JDBC解决中文问题(JDBC抛出SQLEXCEPTION，提示出现Locale mismatch）
```
先以原来身份进入

 unset DB_LOCALE CLIENT_LOCALE



解决方案，要在../profile.gbaseserver  设置

export CLIENT_LOCALE=zh_cn.utf8
export DB_LOCALE=zh_cn.utf8
export SERVER_LOCALE=zh_cn.utf8

执行source ../profile.gbaseserver后，重新导入
```
通过 执行查询，如果出现类似下面结果相应的数据库dbs_collate=zh_CN.57372则认为正确

```
> database his;

Database selected.

> select * from sysmaster:sysdbslocale;



dbs_dbsname  sysmaster
dbs_collate  en_US.819

dbs_dbsname  sysutils
dbs_collate  en_US.819

dbs_dbsname  sysuser
dbs_collate  en_US.819

dbs_dbsname  sysadmin
dbs_collate  en_US.819

dbs_dbsname  residentialquarter
dbs_collate  zh_CN.57372

dbs_dbsname  retailscm
dbs_collate  zh_CN.57372

dbs_dbsname  his
dbs_collate  zh_CN.57372

7 row(s) retrieved.


```

## 解决Grouby子句包含函数问题

* 这样不能工作 select date(update_time) ,count(*) as count from expense_type_data group by date(update_time) ; 
* 这样可以工作 select date(update_time) as date_key, count(*) as count from expense_type_data group by date_key ; 


## 启动和停止日志

```
Your evaluation license will expire on 2020-05-07 00:00:00
shared memory not initialized for GBASEDBTSERVER 'gbaseserver'
Your evaluation license will expire on 2020-05-07 00:00:00
Reading configuration file '/home/gbasedbt/gbase/etc/onconfig.gbaseserver'...succeeded
Creating /GBASEDBTTMP/.infxdirs...succeeded
Allocating and attaching to shared memory...succeeded
Creating resident pool 255114 kbytes...succeeded
Creating infos file "/home/gbasedbt/gbase/etc/.infos.gbaseserver"...succeeded
Linking conf file "/home/gbasedbt/gbase/etc/.conf.gbaseserver"...succeeded
Initializing rhead structure...rhlock_t 262144 (8192K)... rlock_t (239062K)... Writing to infos file...succeeded
Initialization of Encryption...succeeded
Initializing ASF...succeeded
Initializing Dictionary Cache and SPL Routine Cache...succeeded
Bringing up ADM VP...succeeded
Creating VP classes...succeeded
Forking main_loop thread...succeeded
Initializing DR structures...succeeded
Forking 1 'soctcp' listener threads...succeeded
Starting tracing...succeeded
Initializing 32 flushers...succeeded
Initializing SDS Server network connections...succeeded
Initializing log/checkpoint information...succeeded
Initializing dbspaces...succeeded
Opening primary chunks...succeeded
Validating chunks...succeeded
Initialize Async Log Flusher...succeeded
Starting B-tree Scanner...succeeded
Init ReadAhead Daemon...succeeded
Init DB Util Daemon...succeeded
Initializing DBSPACETEMP list...succeeded
Init Auto Tuning Daemon...succeeded
Checking database partition index...succeeded
Initializing dataskip structure...succeeded
Checking for temporary tables to drop...succeeded
Updating Global Row Counter...succeeded
Forking onmode_mon thread...succeeded
Creating periodic thread...succeeded
Creating periodic thread...succeeded
Starting scheduling system...succeeded
Verbose output complete: mode = 5


```


