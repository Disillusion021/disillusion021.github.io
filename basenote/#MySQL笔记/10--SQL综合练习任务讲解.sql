-- 22. 查询"财务部"工资最少的人的姓名和职务
-- 分析：子查询(捎带点多表查询！)
-- 子句：查询'财务部'的部门编号！
select deptno from dept where deptname = '财务部';
-- 子句：查询10号部门最低工资！
select min(salary) from emp 
where deptno = (select deptno from dept where deptname = '财务部');
-- 主句：
select name, job from emp 
where salary = (select min(salary) from emp 
where deptno = (select deptno from dept where deptname = '财务部')) and deptno = (select deptno from dept where deptname = '财务部');


-- 31.查询和Tom相同部门的员工姓名和入职时间（不包括Tom）
-- 子句：查询Tom的部门编号！
select deptno from emp where name = 'Tom';
-- 主句：查询主句
select name, joindate from emp 
where deptno = (select deptno from emp where name = 'Tom')
and name != 'Tom';



