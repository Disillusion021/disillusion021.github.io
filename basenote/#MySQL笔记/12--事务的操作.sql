insert into test values(default, '小明');

-- 设置手动提交
set autocommit = 0;

-- 事务开启！(但凡运行增删改语句，事务就已经开启了！)
insert into test values(default, '小强');
insert into test values(default, '夯大力');
commit; -- 结束事务！并提交事务！

insert into test values(default, '小美');
rollback;

insert into test values(default, '小红');
insert into test values(default, '小黑');
commit;







