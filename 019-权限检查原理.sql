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
*/
use mysql;
select host, user, password from USER;

#修改host域，使指定ip也可以连接
UPDATE user SET host='192.168.1.106' where host = '127.0.0.1';
FLUSH privileges; #冲刷权限

#修改用户的密码
UPDATE user SET password=PASSWORD('123456') where host = '192.168.1.106';
FLUSH PRIVILEGES;

