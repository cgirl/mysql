/*
	控制结构：
	顺序，选择，循环
	求1-100之和
*/
DROP PROCEDURE p6;
CREATE PROCEDURE p6()
BEGIN
	DECLARE total INT DEFAULT 0;
	DECLARE num INT DEFAULT 0;

	WHILE num<100
		DO
			SET num := num + 1;
			SET total := total + num;
		END WHILE;
	SELECT total FROM DUAL;
END;
CALL p6();
