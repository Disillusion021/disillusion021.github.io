-- SQL语言单行注释
# SQL语言单行注释
/*
SQL语言多行注释
SQL语言多行注释
*/
-- 强调：Navicat中编写SQL语言一定要记得保存！(ctrl + s)

-- 增：
-- (1). 指定某些列添加数据
-- 语法结构：insert into 表名(列名, 列名) values(值1, 值2);
-- 注意：MySQL中日期或者字符串数据一定要声明单引号！

-- 案例：将斗罗大陆、唐家三少这本书添加到book表中！
insert into book(author, name) values('唐家三少', '斗罗大陆');


-- (2). 指定所有列添加数据
-- 语法结构：insert into 表名 values(值1, 值2, 值3);
-- 案例：向book表中添加一条数据
insert into book values(default, '惊悚乐园', '三天两觉', 39.9);
-- 问题：使用这种语法，一旦遇到有自动递增的情况怎么处理？
-- 答案：使用default占位符占位即可！


-- (3). 批量添加：一个SQL语句同时添加多条数据！
-- 语法结构：insert into 表名(列名, 列名) values(值1, 值2), (值1, 值2), (值1, 值2);
-- 语法结构：insert into 表名 values(值1, 值2), (值1, 值2), (值1, 值2);
insert into book values(default, '羊脂球', '莫泊桑', 19.9), 
(default, '唐吉坷德', '塞万提斯', 29.9), 
(default, '鲁宾逊漂流记', '鲁滨逊', 39.9);


-- 删：
-- 语法结构：delete from 表名 where 条件;
-- 案例：删除book表中价格超过30的图书信息！
delete from book where price > 30;
-- 注意：MySQL中条件的符号有(=  !=  <  >  <=  >=)
-- 注意：MySQL中多个条件之间用(and、or)进行关联

-- 案例：删除book表中价格在2 ~ 9元之间的图书信息
delete from book where price >= 2 and price <= 9;
delete from book where price between 2 and 9;


-- 改：
-- (1). 修改符合条件的数据中的某一列信息
-- 语法结构：update 表名 set 列名 = 新值 where 条件;
-- 注意：set表示更改，set后面的等号表示赋值，where后面的等号表示相等

-- 案例：将book表中，编号为4号的图书价格改为49.2
update book set price = 49.2 where id = 4;

-- (2). 修改符合条件的数据中的多列信息
-- 语法结构：update 表名 set 列名 = 新值, 列名 = 新值, 列名 = 新值 where 条件;









