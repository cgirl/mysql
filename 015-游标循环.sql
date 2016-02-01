/*
	
*/
CREATE PROCEDURE p14()
BEGIN
	DECLARE row_gid int DEFAULT 0;
	DECLARE row_num int DEFAULT 0;
	DECLARE row_name varchar(20) DEFAULT 0;

	DECLARE cnt int DEFAULT 0;
	DECLARE i int DEFAULT 0;
	
	DECLARE getgoods CURSOR FOR SELECT gid, num, name FROM goods;

	SELECT count(*) into cnt from goods;

	OPEN getgoods;

	REPEAT
			SET i:=i+1;
			FETCH getgoods into row_gid, row_num, row_name;
			SELECT row_gid, row_num, row_name;
	UNTIL i>=cnt END REPEAT;
END;
CALL p14();