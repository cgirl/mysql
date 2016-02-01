/*
	控制结构：
	顺序，选择，循环
	求1-n之和
*/
CREATE PROCEDURE p7(in n INT)
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT DEFAULT 0;

	WHILE num<n
		DO
			SET num := num + 1;
			SET total := total + num;
		END WHILE;
	SELECT total FROM DUAL;
END;
CALL p7(100);

/*
	in型参数：是一个输入型参数
	out型参数：是一个输出型参数
*/
DROP PROCEDURE p8;
CREATE PROCEDURE p8(in n INT, out total INT)
BEGIN
	DECLARE num INT DEFAULT 0;
	SET total := 0;
	WHILE num<n
		DO
			SET num := num + 1;
			SET total := total + num;
		END WHILE;
END;

CALL p8(10, @tmp);
SELECT @tmp;

#INOUT类型
CREATE PROCEDURE p9(inout age INT)
BEGIN
	SET age := age+20;
END;

SET @tmp = 19;
CALL p9(@tmp);
SELECT @tmp;

/*
	思考一下变量名和变量值
*/