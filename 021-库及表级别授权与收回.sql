#针对某个库做授权
GRANT ALL ON ecshop.* TO study@'192.168.1.%'; #授权后show DATABASES可以看到ecshop

#查看user权限
SELECT * FROM user WHERE user='study';

#查看db库权限
SELECT * FROM db;

#收回库级别的权限
REVOKE ALL ON ecshop.* FROM study@'192.168.1.%';

#针对表级别授权
GRANT INSERT,UPDATE,SELECT ON ecshop.ecs_goods TO study@'192.168.1.%';

#查看表级别的权限
SELECT * FROM tables_priv;

#提示：如果在开发中某张表的数据是原始数据，不能被删除，除了在PHP的业务逻辑控制
#还需要在运维层面进行数据权限控制
#mysql的权限控制甚至可以精确到列（自行看手册）
