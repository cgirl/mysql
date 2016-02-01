/* 
  触发器 trigger
  需求：
      商品表：goods
      订单表：order
   
   当下一个订单时，对应的商品要相应减少（买几个商品就少几个库存）
   
   分析：
       监视谁：order
       监视动作：insert
       触发时间：after
       触发时间：update

    模型：
        CREATE TRIGGER 触发器名称
        AFTER/BEFORE (触发时间)
        INSERT/UPDATE/DELETE (监视事件)
        ON 表名(监视地址)
        FOR EACH ROW
        BEGIN
        sql1;
        ....
        sqln;
        END
*/

-- 查看已有triggers: SHOW TRIGGERS;
-- 删除已有triggers: DROP TRIGGER TRIGGER名;
DROP TRIGGER t1;

-- 生成订单减少商品数量
CREATE TRIGGER t2
AFTER 
INSERT
ON orders
FOR EACH ROW
BEGIN
UPDATE goods SET num = num-new.much WHERE gid=new.gid; -- 引入行变量，insert-new  delete-old
END;

-- 触发器使用操作 --
SHOW TRIGGERS; -- 展示现有的触发器
TRUNCATE orders;
INSERT INTO orders VALUES (1, 2, 4);
INSERT INTO orders VALUES (2, 1, 3); -- 无论买几只都会减少2只
SELECT * from orders;
SELECT * from goods;

-- 撤销订单增加商品数量
CREATE TRIGGER t3
AFTER 
DELETE
ON orders
FOR EACH ROW
BEGIN
UPDATE goods SET num = num+old.much WHERE gid=old.gid; -- 引入行变量，insert-new  delete-old
END;

DELETE FROM orders where oid = 1;