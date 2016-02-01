/*
	mysql的用户与权限管理
  
  用户连接到mysql，并做各种查询
  [用户] <---> [服务器]
  1.你有没有权限连接上来
  2.你有没有权限执行此操作

  对于1：
	服务器如何判断用户有没有权限连接上来？
  依据3个参数：
      你从哪里来？		host
      你是谁？    		user 
      你的密码是多少？password
  用户的这3个信息，存储在mysql库的user表中

	对于2：
  先db表，判断用户有没有某个库的操作权；然后再检测对某张表的操作权(授权与收回都是全局性质的)
*/
#新增一个用户
#GRANT [权限1，权限2，权限3....] ON 哪个库.哪个表 TO 用户@主机 identified by 密码
#常用权限有：all CREATE DROP INSERT UPDATE DELETE SELECT
GRANT ALL ON *.* TO study@'192.168.1.%' IDENTIFIED by '111111';

#创建一个库
create database test1;

#切换一个库
use test1;

#创建一张表
CREATE TABLE t1(id INT);

#删表
DROP TABLE t1;

#删库
DROP DATABASE test1;

#收回权限
REVOKE ALL ON *.* FROM study@'192.168.1.%';
FLUSH PRIVILEGES;