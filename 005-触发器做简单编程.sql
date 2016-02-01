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
DROP TRIGGER t2; -- 删除增加订单减少商品数量的触发器

-- [Err] 1362 - Updating of NEW row is not allowed in after trigger
-- INSERT之后，new行已经插入到表中，成为事实，改new已经晚了。需要将after改为before
CREATE TRIGGER t5
#AFTER
BEFORE
INSERT
ON orders
FOR EACH ROW
BEGIN
DECLARE
rnum INT;
SELECT num INTO rnum FROM goods WHERE gid=new.gid;
IF new.much>rnum THEN
	SET new.much = rnum;
END IF;
UPDATE goods SET num = num-new.much WHERE gid=new.gid; -- 引入行变量，insert-new  delete-old
END;


-- 触发器使用操作 --
SHOW TRIGGERS; -- 展示现有的触发器
SELECT * from orders;
SELECT * from goods;
INSERT INTO orders VALUES (5, 3, 12);
DELETE FROM orders where oid = 1;
UPDATE orders set much=3 where gid=2;
UPDATE orders set much=2 where gid=3 and oid = 3;
