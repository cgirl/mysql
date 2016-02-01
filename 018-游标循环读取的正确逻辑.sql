/*
	逻辑优化
*/
DROP PROCEDURE p17;
CREATE PROCEDURE p17()
BEGIN
	DECLARE row_gid int DEFAULT 0;
	DECLARE row_num int DEFAULT 0;
	DECLARE row_name varchar(20) DEFAULT 0;

	DECLARE you int DEFAULT 1;
	DECLARE getgoods CURSOR FOR SELECT gid, num, name FROM goods;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET you:=0;

	OPEN getgoods;
	FETCH getgoods into row_gid, row_num, row_name; #防止首条为空

	REPEAT
			SELECT row_gid, row_num, row_name; #优先
			FETCH getgoods into row_gid, row_num, row_name;
	UNTIL you=0 END REPEAT;
	CLOSE getgoods;
END;
CALL p17();


DROP PROCEDURE p18;
CREATE PROCEDURE p18()
BEGIN
	DECLARE row_gid int DEFAULT 0;
	DECLARE row_num int DEFAULT 0;
	DECLARE row_name varchar(20) DEFAULT 0;

	DECLARE you int DEFAULT 1;
	DECLARE getgoods CURSOR FOR SELECT gid, num, name FROM goods WHERE gid=12;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET you:=0;

	OPEN getgoods;
	FETCH getgoods into row_gid, row_num, row_name; #防止首条为空

	WHILE you != 0
		DO
			SELECT row_gid, row_num, row_name; #优先
			FETCH getgoods into row_gid, row_num, row_name;
		END WHILE;
	CLOSE getgoods;
END;
CALL p18();