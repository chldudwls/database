

insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1001', '경남 경주시');
insert into `bank_customer` values ('730423-1000003', '장보고', 1, '010-1234-1001', '경남 완도군');
insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 1, '010-1234-1001', '부산시 부산진구');
insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1001', '서울 종로구');


insert into `bank_account` values('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
insert into `bank_account` values('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-04-12');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
insert into `bank_account` values('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-04-14');
insert into `bank_account` values('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-04-15');


insert into `bank_transaction` values(1, '101-11-1001', 1, 50000, '2023-01-01 13:15:10');
insert into `bank_transaction` values(2, '101-12-1001', 2, 1000000, '2023-01-02 13:15:12');
insert into `bank_transaction` values(3, '101-11-1002', 3, 260000, '2023-01-03 13:15:14');
insert into `bank_transaction` values(4, '101-11-1002', 2, 100000, '2023-01-04 13:15:16');
insert into `bank_transaction` values(5, '101-11-1003', 3, 75000, '2023-01-05 13:15:18');
insert into `bank_transaction` values(6, '101-11-1001', 1, 150000, '2023-01-06 13:15:28');

select 
a.`c_no`,
a.`c_name`,
a.`c_phone`,
b.`a_no`,
b.`a_item_name`,
b.`a_open_date`
from `bank_customer` as a
join `bank_account` as b on a.`c_no` = b.`c_no`;

select
`t_dist`,
`t_amount`,
`t_datetime`
from `bank_customer` as a
join `bank_transaction` as b on a.c_dist = b.t_dist
where `c_name`='이순신';

select
a.`c_no`,
a.`c_name`,
b.`a_no`,
b.`a_open_date`
from `bank_customer` as a
join `bank_account` as b on a.`c_no` = b.`c_no`
where `c_dist`=1
order by `a_balance` desc
limit 1;