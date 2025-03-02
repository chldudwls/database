#날짜: 2024
#이름: 최영진
#내용: 데이터베이스 개체
#실습 5-1
show index from `user1`;
show index from `user2`;
show index from `user3`;

#실습 5-2

create index `idx_user1_uid` on `user1`(`uid`);
analyze table `user1`;

select *from `user5`;
insert into `user5` (`name`, `gender`, `age`, `addr`) select `name`, `gender`, `age`, `addr` from `user5`;

update `user5` set `name`='홍길동' where `seq`=3;
update `user5` set `name`='정약용' where `seq`=2000000;

drop table `user5`;

select count(*) from `user5`;
select * from `user5` where `seq`=11000;
select * from `user5` where `name`='홍길동';
create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;

delete from `user5` where `seq` >5;
#실습 5-3
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);
create view `vw_user4_age_under30` as (select * from `user4` where` age` < 30);
create view `vw_member_with_sales` as(
select
a.`uid` as `직원아이디`,
b.`name` as `직원이름`,
b.`pos` as `직급`,
c.`name` as `부서명`,
a.`year` as `매출년도`,
a.`month` as `월`,
a.`sale` as `매풀액`
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depno
);




#실습 5-5

#실습 5-7

DELIMITER $$
	create procedure proc_test1()
    begin
		select * from `member`;
        select * from `department`;
	end $$
	DELIMITER ;
    
call proc_test1();
    
#실습 5-8

delimiter $$
	create procedure proc_test2(in _username varchar(10))
    begin
		select * from `member` where `name`=_username;
	end $$
    delimiter ;
    
    call proc_test2('김유신');
    
    
DELIMITER $$
	create procedure proc_test3(in_pos varchar(10), in_dep tinyint)
    begin
		select * from `member` where `pos`=_pos and `dep`=_dep;
        end $$
        delimiter ;
        call proc_test3('차장', 101);
        
delimiter $$
create procedure proc_test4(in _pos varchar(10), out _count int)
begin
	select count(*) into _count from `member` where `pos`=_pos;
    end $$
    delimiter ;

call proc_test4('대리',@_count);
select concat('_count : ', @_count)

delimiter $$
	create procedure proc_test5(in _name varchar(10))
	begin
		declare userid varchar(10);
        select `uid` into userid from `member` where `name` = _name;
        select * from `sales` where `uid`=userid;
	end $$
    delimiter ;
call proc_test5('김유신');

delimiter $$
	create procedure proc_test6()
    begin
		declare num1 int;
		declare num2 int;
        
        if (num1 > num2) then
			select 'num1이 num2보다 크다.' as `결과2`;
		else
            select 'num1이 num2보다 작다.' as `결과2`;
		end if;
	end $$
    delimiter ;

call proc_test6();

delimiter $$
	create procedure proc_test7()
    begin
		declare sum int;
		declare num int;
        
        set sum = 0;
        set num = 1;
        
        while (num <= 10) do
			set sum = sum + num;
            set num = num + 1;
            end while;
            
            select sum as '1부터 10까지 합계';
		end $$
        delimiter ;
        
        
#실습 5-10
delimiter $$
	create procedure proc_test8()
    begin
    #커서 선언
DECLARE total int default 0;
declare price int;
declare endOfRow boolean default false;
    #커서 선언
    declare salescursor cursor for
		select `sale` from `sales`;
    #반복 조건
declare continue handler
		for not found set endofrow = true;
    #커서 열기    
	open salescursor;
    
    cursor_loop: loop
    fetch salescursor into price;
    
    if endofrow then
    leave cursor_loop;
    end if;
    
    set total = total + price;
    end loop;
    
    close salescursor;
    end $$
    delimiter ;
    
    call proc_test8();
#실습 5-11

delimiter $$
	create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
        
        select sum(`sale`) into total from `sales` where `uid`=_userid;
        
        return total;
	end $$
	delimiter ;
    
    select func_test1('a101');
    
    
delimiter $$
 create function func_test2(_sale int) returns double
 begin
	declare bonus double;
    
    if(_sale >= 100000) then
		set bonus = _sale * 0.1;
	else
		set bonus = _sale * 0.05;
	end if;
    
    return bonus;
    end $$
    delimiter ;
    
    select
    `uid`,
    `year`,
    `month`,
    `sale`,
    func_test2(`sale`) as `bonus`
    from `sales`;
   
    
