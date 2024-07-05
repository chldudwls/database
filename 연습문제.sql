
create table `tbluser`(
`user_id` varchar(10),
`user_name` varchar(10),
`user_hp` char(13),
`user_age` tinyint,
`user_addr` varchar(100)
);


DROP TABLE `tbluser`;


insert into `tbluser` value ('p101', '김유신', '010-1234-1001', '25', '경남 김해시');
insert into `tbluser` value ('p102', '김춘추', '010-1234-1002', '23', '경남 경주시');
insert into `tbluser` value ('P103', '장보고', NULL, 31, '전남 완도군');
insert into `tbluser` (user_id, `user_name`, `user_addr`)
											VALUES ('P104', '강감찬', '서울시 중구');
insert into `tbluser` set
														`user_id`='p105',
                                                        `user_name`='이순신',
                                                        `user_hp`='010-1234-1005',
                                                        `user_age`=25;
                                SELECT * FROM `tbluser`;
                                
select `user_name` from `tbluser`;
select `user_name`, `user_hp` from `tbluser`;
select *from `tbluser` where `user_id`='p102';
select *from `tbluser` where `user_id`='p104' or `user_id`='p105';
select *from `tbluser` where `user_addr`='부산시 금정구';
select *from `tbluser` where `user_age` > 30;
select *from `tbluser` where `user_hp` is null;
update `tbluser` set `user_age`=42 where `user_id`='p104';
update `tbluser` set `user_addr`='부산시 진구' where `user_id`='p105';	
delete from	`tbluser` where `user_id`='p103';

select * form `tnlproduct`;


