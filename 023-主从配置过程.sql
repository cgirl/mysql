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
