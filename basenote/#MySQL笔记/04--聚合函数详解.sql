-- 聚合函数：多行数据经过聚合函数处理后只返回一行结果
-- 注意：聚合函数在处理数据时会优先忽略null值数据！

-- 1. max()：求最大值
-- 案例：查询student表中所有学生的最高分！
select max(score) from student;

-- 2. min()：求最小值
-- 案例：查询student表中所有学生的最低分！
select min(score) from student;

-- 3. sum()：求和
select sum(score) from student; -- 505分！

-- 4. count()：求指定列中数据的个数！(返回数据条数！)
select count(no) from student;
-- 建议：count函数中就声明主键字段这样可以保证求出的数量是正确的！

-- 5. avg()：求平均值！(底层：sum() / count())
select avg(score) from student; -- 72.1429

select sum(score) / count(no) from student; -- 63.1250

select avg(ifnull(score, 0)) from student; -- 63.1250
-- 扩展：函数是可以嵌套使用的！！！



