/*
	存储过程是可以编程的
  意味着可以使用变量，表达式，控制结构类来完成复杂的功能
  
	在存储过程中，用declare来声明变量
	declare 变量名 变量类型 [DEFAULT 默认值]
*/
DROP PROCEDURE p2;

#引入变量
CREATE PROCEDURE p2()
BEGIN
	DECLARE age INT DEFAULT 18;
	DECLARE height INT DEFAULT 180;

	SELECT CONCAT('年龄是：', age, ' 身高是：', height) AS '好男人';

END;

CALL p2();

/*
	存储过程中，变量可以在sql语句中做合法的运算，如 + - * /
	注意的是，运算的结果，如何赋值给变量
	SET 变量名 := expression
*/
#引入运算
CREATE PROCEDURE p3()
BEGIN
	DECLARE age INT DEFAULT 18;

	SET age := age+20;
	SELECT CONCAT('20年后的年龄为', age) as myage FROM DUAL;
END;
CALL p3();

/*
	if/else控制结构
	if CONDITION 为真  THEN
		sql处理1
	ELSE
		sql处理2
	END;
*/
#引入控制
CREATE PROCEDURE p4()
BEGIN
	DECLARE age INT DEFAULT 18;

	IF age>=18 THEN
		SELECT '你已经成年' as man FROM DUAL;
	ELSE
		SELECT '你尚未成年' as man FROM DUAL;
	END IF;
END;
CALL p4();