-- 8.查询工资低于1000的人数，工资在1000~2000的人数，工资高于2000的人数
select count(no) from emp 
group by salary < 1000, salary between 1000 and 2000, salary > 2000;


-- 7. 查询年龄比1班学生年龄大的学生中，最高成绩的学生的姓名，班级和分数
-- 子句：查询1班最大年龄
select max(age) from student where class = 1;
-- 子句：年龄大于19岁的学生的最高成绩！ 88分
select max(score) from student 
where age > (select max(age) from student where class = 1);
-- 主句：
select name, class, score from student 
where score = (select max(score) from student 
where age > (select max(age) from student where class = 1))
and age > (select max(age) from student where class = 1);


-- 1. 查询部门平均工资最低的部门，该部门的部门编号
-- 子句：查询每个部门的平均工资(当做表！)
select avg(salary) a_salary from emp group by deptno;
-- 子句：查询平均工资最低的平均工资！
select min(a_salary) from 
(select avg(salary) a_salary from emp group by deptno) as aa;
-- 主句：查询部门平均工资为500的部门的编号！
select deptno from emp 
group by deptno
having avg(salary) = (select min(a_salary) from 
(select avg(salary) a_salary from emp group by deptno) as aa);

-- 偷鸡版写法：有问题！
select deptno from emp group by deptno
order by avg(salary) asc
limit 1;


-- 2. 查询平均工资最高的部门的部门编号，其部门编号中的对应的员工姓名、工资
-- 子句：
select deptno from emp 
group by deptno
having avg(salary) = (select max(a_salary) from 
(select avg(salary) a_salary from emp group by deptno) as aa);
-- 主句：
select name, salary from emp 
where deptno = (select deptno from emp 
group by deptno
having avg(salary) = (select max(a_salary) from 
(select avg(salary) a_salary from emp group by deptno) as aa));


-- 3. 查询部门平均工资高于公司平均工资的部门，其部门编号
-- 子句：查询公司平均工资！2338.4615
select avg(salary) from emp;
-- 主句：
select deptno from emp
group by deptno
having avg(salary) > (select avg(salary) from emp);


-- 7. 查询哪个部门的平均工资大于30号部门的平均工资(查询出部门的部门编号)
-- 子句：30号部门的平均高工资！
select avg(salary) from emp where deptno = 30;
-- 主句：
select deptno from emp
group by deptno
having avg(salary) > (select avg(salary) from emp where deptno = 30);


-- 8.查询'CEO'手下的员工，工资最高的员工的编号，姓名，工资，职务
-- 子句：查询'CEO'的工号！
select no from emp where job = 'CEO';
-- 子句：查询领导工号是0001的员工的最高工资！
select max(salary) from emp 
where manageno = (select no from emp where job = 'CEO');
-- 主句：
select no, name, salary, job from emp 
where salary = (select max(salary) from emp 
where manageno = (select no from emp where job = 'CEO'))
and manageno = (select no from emp where job = 'CEO');


-- 13.查询工资在所有员工平均工资之上的员工的工号，名字，工资，其中不包括"CEO"
-- 子句：查询所有员工的平均工资！
select avg(salary) from emp;
-- 主句：
select no, name, salary from emp 
where salary > (select avg(salary) from emp)
and job != 'CEO';














