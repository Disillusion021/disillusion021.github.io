-- SQL语言查询分类
-- (1). 无条件查询
-- (2). 有条件查询
-- (3). 排序查询
-- (4). 模糊查询
-- (5). 单行函数查询
-- (6). 聚合函数查询
-- (7). 分组查询(☆)
-- (8). 子查询(嵌套查询)(☆)
-- (9). 多表查询(☆)
-- (10). 分页查询
-- (11). 高级查询


-- 1. 无条件查询：检索表中所有的数据
-- 语法结构：select * from 表名;
-- 建议：不要用(效率极低！)
select * from student;

-- 语法结构：select 列名, 列名, 列名 from 表名;
-- 案例：查询所有学生的学号，姓名，年龄！
select no, name, age from student;

-- (1). 查询时可以直接对列名进行四则运算！
-- 案例：查询所有学生的学号，姓名，成绩+10的结果！
select no, name, score + 10 from student;
-- 扩展：null和任何数据进行处理后结果永远是null

-- (2). 查询时可以直接对列名进行拼接操作！
-- 语法规则：concat(数据, 数据, 数据);
-- 案例：查询所有学生姓名拼接'是个好学生'的结果
select concat(name, '是个', '好学生') from student;
-- 扩展：SQL是一种弱类型语言(不会强制区分整数和小数的！)

-- (3). 可以对查询结果的列名进行声明别名的操作！
-- 语法结构：select 列名 as 别名 from 表名;
select concat(name, '是个', '好学生') as name from student;
-- 注意：别名无需声明引号！
-- 扩展：as关键字可以省略！



-- 2. 有条件查询：查询语句中通过where声明筛选条件！(过滤查询)
-- 语法结构：select 列名, 列名, 列名 from 表名 where 条件;
-- 案例：查询student表中成年学生的学号，姓名，年龄
select no, name, age from student where age >= 18;


-- (1). between and关键字：
-- 语法结构：where 字段 between a and b(表示查询字段在a ~ b之间的数据)
-- 语法结构：where 字段 not between a and b(表示查询字段不在a ~ b之间的数据)
-- 案例：查询student表中成绩在90 ~ 100分之间的学生姓名，成绩
select name, score from student where score >= 90 and score <= 100;
select name, score from student where score between 90 and 100;

-- (2). in关键字：
-- 语法结构：where 字段 in(a, b, c)(表示字段是否等于a或b或c)
-- 语法结构：where 字段 not in(a, b, c)(表示字段是否不等于a及b及c)
-- 案例：查询student表中班级为1班或者3班的学生学号，姓名，班级
select no, name, class from student where class = 1 or class = 3;
select no, name, class from student where class in(1, 3);


-- (3). distinct关键字：将查询结果中完全重复的数据剔除！
-- 语法结构：select distinct 列名, 列名 from 表名;
-- 案例：查询2班所有学生的成绩
select distinct score from student where class = 2;
-- 注意：distinct关键字只能声明一次，必须放置在select后！
select distinct score, class from student where class = 2;

-- (4). 查询中对于null值的判断！
-- 原理：SQL在进行条件查询时，会自动忽略条件字段中null数据！
-- 语法结构：where 字段 is null(判断字段是否为null)
-- 语法结构：where 字段 is not null(判断字段是否不为null)
-- 案例：查询班级不为1班的学生学号，姓名，班级！
select no, name, class from student where class != 1;

-- 案例：查询没有班级的学生学号，姓名，班级！
select no, name, class from student where class is null;

-- 案例：查询有班级的学生学号，姓名，班级！
select no, name, class from student where class is not null;



-- 3. 排序查询：
-- 语法结构：order by 字段 asc / desc
-- 排序规则：asc(升序)、desc(降序)
-- 扩展：如果省略asc或者desc，则默认值以升序排序！
-- 案例：查询2班学生的学号，姓名，成绩，按照成绩降序排序！
select no, name, score from student where class = 2 order by score desc;


-- 4. 模糊查询：关键字查询！
-- 语法规则：where 字段 like '匹配规则'
-- 匹配规则：需要声明通配符进行文字的匹配
-- (1). %：表示匹配任意长度的任意字符
-- (2). _：表示匹配一个长度的任意字符
-- 案例：查询student表中姓名中带有'小'字的学生学号，姓名
select no, name from student where name like '%小%';

-- 匹配姓名中小字开头的信息！
select no, name from student where name like '小%';

-- 匹配姓名中小字结尾的信息！
select no, name from student where name like '%小';

-- 匹配姓名中第二个字是小的信息！
select no, name from student where name like '_小%';

-- 匹配姓名中第五个字是小的信息！
select no, name from student where name like '____小%';









