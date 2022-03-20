select no, name, salary from emp 
where no = 0009;
-- no有索引：使用索引查询！

select no, name, salary from emp 
where no = 0009 or no = 0010;
-- 不会使用索引，全表检索！
select no, name, salary from emp 
where no in(0009, 0010);

-- union / union all：作用就是将多个查询语句查询结果进行拼接处理！
select no, name from student where no in(1003, 1004, 1005)
union all
select no, name from student where no in(1001, 1002, 1003);

select no, name from student where no in(1003, 1004, 1005)
union
select no, name from student where no in(1001, 1002, 1003);
-- union相对于union all可以对数据进行去重操作！


select no, name, salary from emp where no in(0009, 0010); -- 不使用索引


select no, name, salary from emp where no = 0009
union
select no, name, salary from emp where no = 0010;
-- 使用到索引进行查询！








