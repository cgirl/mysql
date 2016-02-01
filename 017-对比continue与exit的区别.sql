/*
	DECLARE 处理条件
	游标取值越界时，有没有标识？来利用标识来区分
*/
DROP PROCEDURE p16;
CREATE PROCEDURE p16()
BEGIN
	DECLARE row_gid int DEFAULT 0;
	DECLARE row_num int DEFAULT 0;
	DECLARE row_name varchar(20) DEFAULT 0;

	DECLARE you int DEFAULT 1;
	DECLARE getgoods CURSOR FOR SELECT gid, num, name FROM goods;

	#声明的是一个continue的handler，这样被触发时，会继续执行后面的程序
	#导致在没有找到的时候，会再接着执行repeat里面的select语句
	#DECLARE CONTINUE HANDLER FOR NOT FOUND SET you:=0;
	#声明为exit时，则程序被触发的时候，直接结束后面的程序
	DECLARE EXIT HANDLER FOR NOT FOUND SET you:=0; 

	OPEN getgoods;

	REPEAT
			FETCH getgoods into row_gid, row_num, row_name;
			SELECT row_gid, row_num, row_name;
	UNTIL you=0 END REPEAT;
	CLOSE getgoods;
END;
/*
	EXIT与continue的区别是：exit不执行后面的语句，continue会继续执行
	除了以上两种，还有一种undo handler，触发后，前面的语句会撤销，但是是目前mysql不支持
*/
