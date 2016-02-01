/*
在一些语言中，如passcal，有一个概念叫“过程”-procedure和“函数”-function 
在php中，没有过程，只有函数

过程：封装了若干语句，调用时，这些封装体执行
函数：是一个有返回值的过程。
过程是没有返回值的函数

存储过程：我们把若干条sql封装起来，起个名字叫过程
把此过程存储在数据库中，即存储过程

存储过程的创建语法：
CREATE PROCEDURE 存储过程名称()
BEGIN
	sql语句
END;
 */

#创建存储过程
CREATE PROCEDURE p1()
BEGIN
	SELECT 2+3 FROM DUAL;
END;

#查看存储过程
SHOW PROCEDURE STATUS;

#调用存储过程
CALL p1();