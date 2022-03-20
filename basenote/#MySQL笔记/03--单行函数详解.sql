-- 什么是MySQL的函数？
-- MySQL中函数就是可以对数据进行处理的子程序(和Java方法类似)
-- 根据MySQL函数处理数据的结果特点不同，共有两种函数：
-- (1). 单行函数：一行数据经过处理后返回一行结果
-- (2). 聚合函数：多行数据经过处理后返回一行结果

-- 一. 单行函数：根据处理数据的类型和特点不同，单行函数又分为如下几种
-- 1. 字符型函数：适用于处理任何类型的数据！
-- 扩展：函数可以用在查询字段中，也可以用在判断条件中！
-- (1). length(str)：返回指定数据的字节长度！
select length('我和你');

-- 案例：查询student表中每个学生的姓名长度！
select length(name) from student;

-- (2). concat(str1, str2)：将指定数据进行拼接！(☆)

-- (3). upper(str) / lower(str)：将指定数据全大写/小写处理
select upper('AbC');

-- (4). instr(str1, str2)：返回第二个数据在第一个数据中首次出现的位置
-- 扩展：如果没出现则返回0
select instr('abcdefg', 'a');

-- 案例：查询姓名中包含小字的学生的学号，姓名！
select no, name from student where instr(name, '小') > 0;

-- (5). substring(str1, begin, length)：截取指定的数据！(☆)
select substring('abcdefg', 2, 4); -- bcde
select substring('abcdefg', 1, 3); -- abc
select substring('abcdefg', 3, 4); -- cdef

-- 案例：查询student表中姓名第二个字是小字的学生学号，姓名
select no, name from student where substring(name, 2, 1) = '小';

-- (6). replace(str1, old, new)：将数据中的指定内容替换！(☆)
select replace('abcdefg', 'a ', 'zzzz');
-- 功能：去除空格！

-- (7). left(str, position) / right(str, position)：从最左、最右开始截取数据
select left('abcdefg', 3);
select right('abcdefg', 3);

-- (8). trim(str)：剔除指定数据前后两段空格！
select trim('    a   b   c      ');

-- 1>. trim(str1 from str2)：剔除指定数据前后两段的指定内容！
select trim('a' from 'aaaaaaaaabaacaadaaaaaaaaaaa');

-- 2>. trim(leading str1 from str2)：剔除指定数据前段的指定内容！
select trim(leading 'a' from 'aaaaaaaaabaacaadaaaaaaaaaaa');

-- 3>. trim(trailing str1 from str2)：剔除指定数据后段的指定内容！
select trim(trailing 'a' from 'aaaaaaaaabaacaadaaaaaaaaaaa');

-- (9). lpad(str, length, str2) / rpad(str, length, str2)：
-- 如果第一个数据不足指定长度，则在左端/右端拼接指定数据直到满足指定长度位置！
select lpad('你好', 10, '*');
select rpad('abc', 10, '*');

apple................19.9$
banana...............25.5$
pear.................14.2$


-- 2. 数字型函数：只适用于数字格式的内容！
-- (1). round(num)：对指定的数字进行四舍五入的操作！(☆)
select round(123.567);

-- 扩展：round(num, position)：从指定位置开始对数据进行四舍五入！
select round(123.567, -1);-- 正数表示小数点向后推，负数表示小数向前推

-- (2). mod(num1, num2)：求num1对num2求余数的结果！
select mod(10, 3);

-- (3). ceil(num)：对指定数字进行向上取整

-- (4). floor(num)：对指定数字进行向下取整


-- 3. 日期型函数：只适用于日期类型的数据或者具备日期格式的整数或者字符串数据！
-- (1). now()：获取当前系统时间！
select now();

-- (2). year(date)：获取指定日期中的年份
-- 案例：查询emp表中2015年入职的员工的工号，姓名，工资！
select no, name, salary from emp 
where joindate between '20150101' and '20151231';

select no, name, salary from emp 
where joindate like '2015%';

select no, name, salary from emp 
where year(joindate) = 2015;

-- (3). month(date)：获取指定日期中的月份

-- (4). day(date)：获取指定日期中的日子


-- 4. 控制型函数：(☆☆☆☆☆)
-- (1). ifnull(str, result)：如果第一个数据为null，则替换为第二个数据展示！
-- 案例：查询emp表中所有员工的姓名和月薪(工资+奖金)
select name, (salary + bonus) from emp;
-- 注意：null和任何数据处理之后的结果都是null！

select name, (salary + ifnull(bonus, 0)) from emp;

-- (2). if(condition, result1, result2)：类似于Java的三目运算符！
select if(1 != 1, 'a', 'b');
-- 案例：查询student表中所有学生的姓名和成绩(不显示分数，显示'及格'、'不及格')
select name, if(score >= 60, '及格', '不及格') from student;
-- 扩展：if可以嵌套，但是过于复杂不如直接使用case语句！
-- 问题：if能否代替ifnull使用？可以代替！(大可不必！)
select name, (salary + if(bonus is null, 0, bonus)) from emp;

-- (3). case .. when .. then .. else .. end语句：自行研究！(类似于switch语句)


















