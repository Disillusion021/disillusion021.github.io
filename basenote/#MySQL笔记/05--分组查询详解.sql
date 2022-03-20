-- 分组查询(group by)
-- 概念：将表中所有的数据按照指定的规则进行分类/分组
-- 分组后再进行查询时，分成几个组就会查询到几个结果！

-- 分组查询的语法共有三种：
-- (1). group by 列名：将某列数据中重复的数据划分到同一个小组中！
-- (2). group by 列名, 列名：将多列数据中完全重复的数据划分到同一个小组中！
-- (3). group by 条件1, 条件2, 条件3：将符合条件的数据划分到同一个小组中！

-- 案例1：查询student表中每个班级的学生人数！
select count(no) from student group by class;

-- 案例2：查询emp表中每个部门的平均工资！
select avg(ifnull(salary, 0)) from emp group by deptno;

-- 案例3：查询emp表中有奖金的员工中，每个部门的部门人数！
-- 注意：where一定要声明在group by的前面！
select count(no) from emp where bonus != 0 group by deptno;


-- 口诀：声明情况下一定需要进行分组查询？？
-- (1). 但凡查询中出现每个、每组、每种、每层等字样时，一定需要分组！
-- (2). 但凡SQL查询中出现聚合函数，查询中的普通字段有一个算一个，必须分组！
-- 扩展：聚合函数，很多程序员又喜欢成他为分组函数！

-- 案例：查询student表中的班级号和班级人数！
select class, count(no) from student group by class;



-- 什么是having关键字？
-- having在SQL中的作用和where类似，都是用于声明判断条件进行数据筛选！
-- 但是和where不同之处在于，having是针对于分组之后对组进行过滤筛选！
-- where用于普通字段的筛选，having用于聚合函数字段的筛选！(可以任意存在或者共存)

-- 案例：查询student表中班级平均成绩超过50分的班级号，和班级平均成绩！
select class, avg(ifnull(score, 0)) from student 
group by class
having avg(ifnull(score, 0)) > 50;


-- 查询student表中有班级的所有学生，每个班人数超过2人的班级号和班级人数！
select class, count(no) from student 
where class is not null 
group by class
having count(no) > 2;


-- 简单预习一下子查询的语法特点就可以！
























