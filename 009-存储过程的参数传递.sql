/*
	存储过程的括号里，可以声明参数
	语法：
		[in/out/inout] 参数名 参数类型
*/
DROP PROCEDURE p5;
CREATE PROCEDURE p5(width INT, height INT)
BEGIN
	SELECT CONCAT('面积为', width*height) as erea;

	IF width > height THEN
		SELECT '胖矩形' as xingzhang FROM DUAL;
	ELSEIF width < height THEN
		SELECT '瘦矩形' as xingzhang FROM DUAL;
	ELSE
		SELECT '正方形' as xingzhang FROM DUAL;
	END IF;
END;
CALL p5(6, 4);