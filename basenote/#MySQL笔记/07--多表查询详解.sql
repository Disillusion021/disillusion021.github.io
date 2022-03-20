-- 什么是多表查询？
-- 多表查询就是将多张表合并后统一进行查询的结果！
-- 换言之：查询的内容从多张表中获取！

-- 多表查询经过改革后出现了两种语法结构：
-- SQL92版本：
-- 语法结构：select 字段, 字段 from 表A, 表B where 关联条件;

-- SQL98版本：主要使用SQL98版本语法！(☆☆☆☆☆)
-- 语法结构：select 字段, 字段 from 表A join 表B on 关联条件;

-- 使用多表查询的注意事项：
-- 注意1：使用多表查询时，多表中重名字段一定要通过表名.字段名区分
-- 注意2：如果使用多表查询，没有加入适当的关联条件，会造成笛卡尔积错误

-- 什么是笛卡尔积错误？
-- 多张表进行关联时，由于缺失关联条件，或者关联条件错误时，从而导致查询结果冗杂或者错误的现象称为笛卡尔积错误！


-- 案例：查询所有员工的姓名，工资，部门编号以及所在部门名称
-- 分析：当发现查询字段中出现了多张表中的数据时，使用多表查询！
select name, salary, emp.deptno, deptname from emp, dept 
where emp.deptno = dept.deptno;

select name, salary, emp.deptno, deptname from emp join dept
on emp.deptno = dept.deptno;
-- on：其实表示的也是声明条件，但是和where区别在于，on用于多表关联！
-- where用于多表关联之后，对关联之后的数据进行统一筛选！

-- 案例：查询在'大连区'工作的员工的工号，姓名，工资！
-- 分析：是不是多表查询？是！
select no, name, salary from emp join dept 
on emp.deptno = dept.deptno
where description = '大连区';

-- 第二种写法：子查询！(当发现查询字段都是一张表中的数据时！)
-- 子句：查询dept表中'大连区'的部门编号
select deptno from dept where description = '大连区';
-- 主句：
select no, name, salary from emp
where deptno = (select deptno from dept where description = '大连区');


-- 案例：查询emp表中所有有奖金的员工中，部门平均工资超过1500的部门编号和部门名称！
-- 分析：使用多表查询！
select emp.deptno, deptname from emp join dept 
on emp.deptno = dept.deptno 
where bonus != 0
group by emp.deptno
having avg(salary) > 1500;


-- 根据多表查询结果不同，多表查询可以划分为两种大类别：
-- 1. 内连接：inner join(inner join就等价于join，inner可以省略！)
-- 特点：只能查询到两张表中满足关联条件的数据！
select * from emp inner join dept 
on emp.deptno = dept.deptno;
-- (1). 等值内连接：关联条件使用等号进行声明！
-- (2). 不等值内连接：关联条件使用非等号进行声明！
-- 案例：查询所有员工的姓名，工资以及工资等级名称！
select emp.name, salary, level.name from emp join level
on emp.salary between low_salary and high_salary;

-- (3). 自连接：自连接其实就是一张表自己和自己关联！
-- 解决方案：通过给同一张表声明不同的别名进行关联以区分！

-- 案例：查询emp表中所有员工姓名，领导姓名！
select worker.name 员工姓名, leader.name 领导姓名 from emp as worker -- 员工表
join emp as leader -- 领导表
on worker.manageno = leader.no;


-- 2. 外连接：outer join 
-- 扩展：from后面一般被称呼为主表或者左表，join后面的被称为从表或者右表
-- (1). 左外连接：left outer join (可以简化为：left join)
select * from emp left outer join dept 
on emp.deptno = dept.deptno;

-- (2). 右外连接：right outer join (可以简化为：right join)
select * from emp right outer join dept 
on emp.deptno = dept.deptno;

-- 什么时候使用内连接？什么时候使用外连接？
/*
user表															order表
用户编号   用户昵称   用户地址			订单编号	  订单价格   用户编号

要求：查询所有的用户(左)和对应的下单(右)信息！左外连接！

总结：工作中大部分情况还是使用的是内连接！一般外连接会提前声明需求！
*/


-- 如果遇到了两张以上的表进行关联时，如何声明SQL语句？
/*
select 字段 from 表A
join 表B
on 表A和表B的关联条件
join 表C
on 表C和表A的关联条件 / 表C和表B的关联条件
join 表D
on 表D和表A的关联条件 / 表D和表B的关联条件 / 表D和表C的关联条件
..... 
where 筛选条件
.....
*/








