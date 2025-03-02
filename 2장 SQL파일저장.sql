#날짜: 2024/7/1
#이름: 최영진
#내용: 2장 SQL 기본

#실습 2-1. 테이블 생성 , 제거
use studyDB;

create table `user1`(
`uid`	varchar(10),
`name`	varchar(10),
`hp`	char(13),
`age`	int
);

drop table `user1`;

#실습 2-2 데이터 입력
insert inio `user1` values ('A101', '김유신', '010-1234-1111', 25);
insert inio `user1` values ('A102', '김춘추', '010-1234-1111', 23);
insert inio `user1` values ('A103', '장보고', '010-1234-1111', 45);
insert inio `user1` (`uid`, `name`, `age`) values ('A104', '강감찬', 45)
insert into `user1` set `uid`= 'A105`,
						 `name`='이순신',
						`h[`='010-1234-5555';
                        
실습 2-3
select * from `user1`; where `uid`='A101';
select * from `user1`; where `name`='김춘추';
select * from `user1`; where `age` < 30;
select * from `user1`; where `age` >= 30;
select `uid`, `name`, `age` from `user1`;

#실습 2-4
#수정 할 때 you are using safe update mode~ 뜨면서 안될때
set sql_safe_updates=0;
update `user1` set `hp`='010-1234-4444' where `uid`='A104';
update `user1` set `age`=51 where `uid`=`A105`;
update `user1` set `hp`='010-1234-1001', `age`= 27 where `uid`='A101';

#실습 2-5
#삭제 할떄 위와 같이 뜨면서 안될때
set sq;_safe_updates=0;
delete from `user1` where `uid`=A101`;
delete from `user1` where `uid`=A102` and `age`=25;
delete from `user1` where `age` >= 30;

#실습 2-6
#실습 2-7
#실습 2-8
#실습 2-9

