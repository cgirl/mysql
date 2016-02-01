#201主机主服务器
#vi /etc/mysql.cnf 打开主服务器的配置文件，内容如下：
[client]
default-character-set = utf8

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

server-id=201 #给每个服务器设置一个独特的id，同一个局域网中一般以末尾ip作为server-id
log-bin=mysql-bin #开启二进制日志，声明二进制日志文件为mysql-bin.xxx
binlog-format=mixed #二进制日志的格式 mixed/row/statement

default-storage-engine = INNODB
character-set-server = utf8
collation-server = utf8_general_ci

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid


#202主机从服务器
[client]
default-character-set = utf8

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

server-id=202 #给每个服务器设置一个独特的id，同一个局域网中一般以末尾ip作为server-id
log-bin=mysql-bin #开启二进制日志，声明二进制日志文件为mysql-bin.xxx，从服务器可开可不开，打开数据备份
binlog-format=mixed #二进制日志的格式 mixed/row/statement
relay-log=mysql-relay #开启从服务器的二进制日志

default-storage-engine = INNODB
character-set-server = utf8
collation-server = utf8_general_ci

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid


#插曲
#mysql连接报错：ERROR 2002 (HY000):can't connect to local through socket '/tmp/mysqld.sock'(2)
#解决方案1：强制指定目录
#    mysql -uroot -p123456 -S /var/lib/mysql/mysql.sock
#解决方案2：建立软连接
#    ln -s /var/lib/mysql.sock /tmp/mysqld.sock

SHOW MASTER STATUS; #查看主服务器的master状态
SHOW SLAVE STATUS;  #查看从服务器的slave状态

#建立主从服务器的关系
#1.在主服务器201上给从服务器202授权
GRANT replication client, replication slave on *.* to repl@'192.168.1.%' IDENTIFIED by 'repl';
FLUSH PRIVILEGES;
#2.在从服务器202上连接主服务器201
CHANGE MASTER TO
master_host='192.168.1.201',
master_user='repl',
master_password='repl',
master_log_file='mysql-bin.000001',
master_log_pos='348';

#启动从服务器：
START SLAVE; #主服务器要关闭防火墙

/*
	总结：
		主从分离
	主：
	binlog-format=row/statement
	statement:二进制记录执行语句，如update等
	row：二进制记录的是磁盘变化
	mixed：混合的，由系统根据语句来决定
	
	哪个好？
	update age=age+1 where id=3; //语句长而磁盘变化少，宜用row
	update salary=salary+1000; //语句短但要影响上万行，磁盘变化大，宜用statement
	如果上面不确定用哪种，就用mixed。
*/
