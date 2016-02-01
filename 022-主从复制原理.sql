/*
	原理：主从分离
	
	主服务器：master
  进行insert，update等数据变化操作，
	形成binlog，
	然后从服务器slave读取binlog，
	形成自己能识别的relaylog，
	然后写入到自己的服务器上。

	
	如上，则说明：
	1.主服务器要配置binlog
	2.从服务器要配置relaylog
	3.从服务器如何有权读取master的binlog?

  binlog是比较敏感的
	答：授权，master要授予slave账号
	4.从服务器用账号连接master
*/