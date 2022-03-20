-- 分页查询：limit
-- 作用：将数据库中的所有数据分页进行查找并展示！

-- (1). limit a：截取查询结果中前a条记录！
select * from emp limit 5;

-- 案例：查询emp表中工资排名前5的员工工号，姓名，工资！
select no, name, salary from emp 
order by salary desc 
limit 5;


-- (2). limit a, b：截取从第a + 1位开始的b条数据！
-- 演示：
select * from emp limit 1, 3; -- 2、3、4
select * from emp limit 2, 4; -- 3、4、5、6
select * from emp limit 0, 2; -- 1、2

-- 假设数据库中有1892条数据，规定每页展示10条
-- 第1页：第1 ~ 第10		limit 0, 10;
-- 第2页：第11 ~ 第20		limit 10, 10;
-- 第3页：第21 ~ 第30		limit 20, 10;
-- 第n页：							limit 10(n-1), 10;

-- 假设数据库中有a条数据，规定每页展示b条
-- 第c页：limit b(c-1), b;











