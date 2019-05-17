# 南大通用GBASE 8S实施经验

南大通用GBASE移植过程中的注意事项和文档， 2014年IBM授权南大通用使用Informix源代码，所以很多方面跟Informix相似。

## GBASE 类型

* text 不支持用sql插入
* bool就是boolean，值是 'T'=true, 'F'= false

## 切换数据库
* 跟informix一样，用database <dbname> 来切换
  
## GBASE 约束
* 约束的名字在最后面

## 分页查询
* 跟MYSQL 一样select * from user limit 10, 10 可以工作
* 跟Informix一样 select skip 2 first 2 * from user 也可以工作
* Oracle那种模式也能工作，还没有测试过

## 命令行工具 dbaccess

* 导入文件 dbaccess - import.sql

