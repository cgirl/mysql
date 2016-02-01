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
-- 更新订单数量来更新商品数量
CREATE TRIGGER t4
BEFORE
UPDATE
ON orders
FOR EACH ROW
BEGIN
UPDATE goods SET num = num-new.much+old.much WHERE gid=old.gid; -- 引入行变量，insert-new  delete-old
END;


-- 触发器使用操作 --
SHOW TRIGGERS; -- 展示现有的触发器
SELECT * from orders;
SELECT * from goods;
INSERT INTO orders VALUES (2, 3, 5);
DELETE FROM orders where oid = 1;
UPDATE orders set much=3 where gid=2;
UPDATE orders set much=2 where gid=3 and oid = 3;

/*
  引发问题
  思考：before目前似乎 没有看出与after的区别
  再思考：如果剩余3头猪，但客户买了10头猪，会发生什么情况？能否预防
  能否在购买much>库存量num时，把much自动改为num
  提示before下了
*/