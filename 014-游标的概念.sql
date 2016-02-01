/*
	CURSOR 游标
	1条sql，对应n条结果集的资源，去除资源的接口或者句柄，就是游标
	沿着游标，可以一次取出1行

	DECLARE 声明：DECLARE 游标名 CURSOR FOR select语句;
	OPEN 打开:		OPEN 游标名;
	FETCH 取值:		FETCH 游标名 INTO val1, val2, ...
	CLOSE 关闭:		CLOSE 游标名
*/
DROP PROCEDURE p12;
CREATE PROCEDURE p12()
BEGIN
	DECLARE row_gid int;
	DECLARE row_name VARCHAR(20);
	DECLARE row_num int;

	DECLARE getgoods CURSOR FOR
		SELECT gid, num, name FROM goods;
	OPEN getgoods;
	FETCH getgoods INTO row_gid, row_num, row_name;
	CLOSE getgoods;
	
	SELECT row_gid, row_num, row_name FROM DUAL;
END;

CALL p12();


DROP PROCEDURE p13;
CREATE PROCEDURE p13()
BEGIN
	DECLARE row_gid int;
	DECLARE row_name VARCHAR(20);
	DECLARE row_num int;

	DECLARE getgoods CURSOR FOR
		SELECT gid, num, name FROM goods;
	OPEN getgoods;
	FETCH getgoods INTO row_gid, row_num, row_name;
	SELECT row_gid, row_num, row_name FROM DUAL;

	FETCH getgoods INTO row_gid, row_num, row_name;
	SELECT row_gid, row_num, row_name FROM DUAL;

	FETCH getgoods INTO row_gid, row_num, row_name;
	SELECT row_gid, row_num, row_name FROM DUAL;

	FETCH getgoods INTO row_gid, row_num, row_name;
	SELECT row_gid, row_num, row_name FROM DUAL;
	CLOSE getgoods;
	
END;
CALL p13();