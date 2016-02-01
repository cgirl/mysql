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

-- 创建goods表 --
CREATE table goods (
gid INT,
name VARCHAR(20),
num SMALLINT
);

-- 创建order表 --
CREATE table orders (
oid INT,
gid INT,
much SMALLINT
);

-- 插入初始数据 --
INSERT INTO goods VALUES (1, 'cat', 34), (2, 'dog', 65), (3, 'pig', 21);

-- delimiter可以更改结束符 --
CREATE TRIGGER t1
AFTER 
INSERT
ON orders
FOR EACH ROW
BEGIN
UPDATE goods SET num = num-2 WHERE gid=1; -- 变量是写死的，问题
END;

-- 触发器使用操作 --
show TRIGGERS; -- 展示现有的触发器
INSERT INTO orders VALUES (1, 1, 2);
INSERT INTO orders VALUES (2, 1, 3); -- 无论买几只都会减少2只
SELECT * from orders;
SELECT * from goods;