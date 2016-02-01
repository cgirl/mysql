/*
  触发器的for each row是做什么用的？
  在oracle触发器中，分语句级触发器和行级触发器
  
  比如：
  create trigger tn
  after update
  on xxtab
  for each row 
  BEGIN
    sqlN
  END

  执行：update xxtab set xx=xx where id>100; 修改了100行
那么sqlN会被触发几次？
  答：会被触发100次
*/
CREATE table tmp(
val INT
);

CREATE TRIGGER t6
BEFORE UPDATE ON orders FOR EACH ROW #每行受影响，触发器都执行，叫做行级触发器
BEGIN
INSERT INTO tmp VALUES (5);
END;

SHOW TRIGGERS;
DROP TRIGGER t4;
select * from orders;
select * from tmp;
UPDATE orders SET much=0;

/*
总结：
在oracle中，for each row如果不写，无论update语句一次影响了多少行，都只执行1次
比如；1人下了订单，买了5件商品，insert了5次：
      可以用行级触发器，修改5次库存
      用语句级触发器，insert一条发货提醒

遗憾的是：mysql不支持语句级触发器。for each row 必须写
*/