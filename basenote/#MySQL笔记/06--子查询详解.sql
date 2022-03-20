-- 什么是子查询？
-- 子查询又名嵌套查询，就是把一个查询语句查询的结果当做另一个查询的条件或者表来使用的形式称为子查询！

-- 子查询的特点如下：
-- (1). 被当做条件或者表的查询语句称为子句，最终的查询语句称为主句
-- (2). 一个查询语句中只能存在一个主句，但是可以存在多个子句
-- (3). 子句的任何条件不会对主句产生任何影响，而主句的条件可能会对子句产生影响

-- 案例：查询student表中年龄比小王大的学生的学号，姓名，年龄！
-- 分析：查询条件中出现了未知数据！可以借助子查询先查询未知数据！
-- 子句：先查询小王的年龄 (19岁)
select age from student where name = '小王';
-- 主句：查询年龄大于19的学生信息！
select no, name, age from student 
where age > (select age from student where name = '小王');


-- 案例：查询student表中成绩最高的学生的学号，姓名，成绩！
-- 错误案例：
select no, name, score from student 
where score = max(score);


-- 正确示范：
-- 子句：查询最高成绩！(99分)
select max(score) from student;
-- 主句：
select no, name, score from student 
where score = (select max(score) from student);


-- 根据子句返回的结果的行列数量，子查询可以分为如下三种写法(外加一种特殊的写法)
-- 1. 单行单列子查询：子句查询的结果是一行一列的结果！
-- 思路：只需要将子句查询的结果看做一个变量即可！直接当做条件使用！

-- 案例：查询2班最高分对应的学生的姓名，成绩，班级！
-- 子句：查询2班最高分(99分)
select max(score) from student where class = 2;
-- 主句：查询成绩为99分的学生信息！
select name, class, score from student 
where score = (select max(score) from student where class = 2)
and class = 2;


-- 案例：查询5号入职的员工中最高工资对应的员工的姓名，工资，入职时间
-- 子句：查询5号入职的最高工资！
select max(salary) from emp where day(joindate) = 5;
-- 主句：查询工资为2001的员工的信息！
select name, salary, joindate from emp 
where salary = (select max(salary) from emp where day(joindate) = 5)
and day(joindate) = 5;

-- 案例：查询emp表中入职最晚的员工中，最低工资对应的员工的姓名，工资，入职时间
-- 子句：查询最晚的入职时间！
select max(joindate) from emp;
-- 子句：查询最晚入职时间的员工中最低的工资！
select min(salary) from emp 
where joindate = (
	select max(joindate) from emp
);
-- 主句：查询员工信息！
select 
	name, 
	salary, 
	joindate 
from emp 
where salary = (
	select min(salary) from emp 
	where joindate = (
		select max(joindate) from emp
	)
)
and joindate = (
	select max(joindate) from emp
);


-- 2. 单行多列子查询：子句查询的结果是一行多列的结果！
-- 解决方案：where (列名, 列名) = (单行多列查询结果！)

-- 案例：查询student表中班级和成绩都和小王相同的学生的姓名，班级，成绩
-- (不包括小王本身)
-- 第一种写法：
-- 子句：查询小王的班级和成绩
select class, score from student where name = '小王';
-- 主句：
select name, class, score from student 
where (class, score) = (select class, score from student where name = '小王') and name != '小王';

-- 第二种写法：
-- 子句：查询小王的班级
select class from student where name = '小王';
-- 子句：查询小王的成绩
select score from student where name = '小王';
-- 主句：
select name, class, score from student 
where class = (select class from student where name = '小王')
and score = (select score from student where name = '小王')
and name != '小王';


-- 3. 多行单列子查询：子句查询的结果是多行一列的结果！
-- 解决方案：使用any或者all关键字解决！
-- (1). all：where 字段 > all(多行结果)，表示字段必须大于所有结果才满足！
-- (2). any：where 字段 > any(多行结果)，表示字段只需大于其中任何一个即可！

-- 案例：查询年龄比小王和大刚都要大的学生的学号，姓名，年龄！
-- 子句：先查询小王和小刚的年龄！
select age from student where name in('小王', '大刚');
-- 主句：
select no, name, age from student 
where age > all(select age from student where name in('小王', '大刚'));


-- 4. 表子查询(特殊语法)
-- 表子查询本质上就是将查询结果当做表结构提供给另一个查询语句使用！
-- 注意1：查询语句当做表处理一定要起别名声明表名！
-- 注意2：被当做表的子句查询结果的列名是什么，主句就得使用什么当做列名

-- 案例：查询student表中每个班级平均分中的最高平均分！
select max(avg(ifnull(score, 0))) from student group by class;
-- MySQL中不允许聚合函数嵌套！只允许单行函数嵌套，或者聚合函数嵌套单行函数！

-- 子句：查询每个班级的平均成绩！
select avg(ifnull(score, 0)) from student group by class;
-- 主句：将子句查询的结果当做表处理！进行进一步的查询！
select max(s) from 
(select avg(ifnull(score, 0)) as s from student group by class) as bb;











