/*
	DECLARE 处理条件
	游标取值越界时，有没有标识？来利用标识来区分
*/
DROP PROCEDURE p15;
CREATE PROCEDURE p15()
BEGIN
	DECLARE row_gid int DEFAULT 0;
	DECLARE row_num int DEFAULT 0;
	DECLARE row_name varchar(20) DEFAULT 0;

	DECLARE you int DEFAULT 1;
	DECLARE getgoods CURSOR FOR SELECT gid, num, name FROM goods;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET you:=0;

	OPEN getgoods;

	REPEAT
			FETCH getgoods into row_gid, row_num, row_name;
			SELECT row_gid, row_num, row_name;
	UNTIL you=0 END REPEAT;
	CLOSE getgoods;
END;
CALL p15();
