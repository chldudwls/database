#날짜: 20247/2
#이름: 최영진
#내용: 3장 제약조건

#실습 3-1
CREATE TABLE `User2`(
	`uid` VARCHAR(10) primary key,
	`name` VARCHAR(10),
	`birth` CHAR(10),
    `addr` VARCHAR(50)
    );
#실습 3-2
insert into `user2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `user2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `user2` values ('A103', '장보고', '1978-03-01', '전남 완도시');
insert into `user2` values ('A104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `user2` values ('A105', '이순신', '1981-05-23', '부산시 진구');

#실습 3-3
CREATE TABLE `User3` (
	`uid` VARCHAR(10) primary key,
	`name` VARCHAR(10),
	`birth` CHAR(10),
    `hp` 	CHAR(13) UNIQUE,
    `addr` VARCHAR(50)
    );
    SELECT * FROM `User3`;
    
#실습 3-4
insert into `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
insert into `user3` values ('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
insert into `user3` values ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도시');
insert into `user3` values ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
insert into `user3` values ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구');
insert into `user3` values ('A106', '정약용', '1981-05-23', NULL, '부산시 진구');
#실습 3-5
CREATE table `parent`(
	`pid` VARCHAR(10) primary KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(100)
    );
    
CREATE TABLE `Child` (
	`uid` VARCHAR(10) primary key,
	`name` VARCHAR(10),
    `hp` 	CHAR(13) UNIQUE,
    `parent` VARCHAR(50),
    FOREIGN KEY (`parent`) REFERENCES `parent` (`pid`)
    );
    
#실습 3-6
insert into `parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
insert into `parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
insert into `parent` values ('P103', '장보고', '1978-03-01', '전남 완도시');
insert into `parent` values ('P104', '강감찬', '1079-08-16', '서울시 관악구');
insert into `parent` values ('P105', '이순신', '1981-05-23', '경남 김해시');

insert into `Child` values ('C101', '김철수', '010-1234-1001', 'P101');
insert into `Child` values ('C102', '김영희', '010-1234-1002', 'P101');
insert into `Child` values ('C103', '강철수', '010-1234-1003', 'P103');
insert into `Child` values ('C104', '이철수', '010-1234-1004', 'P105');
insert into `Child` values ('C105', '최실수', '010-1234-1005', 'P107'); # parent 테이블에 pid p107이 없기 때문에 Insert 안됨
SELECT * FROM `user4`;
#실습 3-7
drop table `User4`;
CREATE TABLE `User4`(
	`uid` varchar(10) primary key,
	`name` varchar(10) not null,
    `gender` char(1),#default null생략
    `age` int default 1,
    `hp` char(13) unique,
    `addr` varchar(10)
    );
    #실습 3-8
insert into `User4` values(1, '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `User4` values(2, '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
insert into `User4` values(3, '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
insert into `User4` values(4, '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구');
insert into `User4` values(5, '이순신', 'M', 25, '010-1234-5555', '부산시 서구');
insert into `User4` values(6, '신사임당', 'F', 32, null, '강릉시');
insert into `User4` values(7, '허난설현', 'F', 27, null, '경기도 광주시');
    

#실습 3-9
create table `user5`(
	`seq` int primary key auto_increment,
	`name` varchar(10) not null,
	`gender` char(1) check (`gender` in ('M','F')),
	`age` int default 1 check (`age` > 0 and `age`< 100),
	`addr` varchar(20)
    );
#실습 3-10
insert into `User5` values(1, '김유신', 'M', 25, '경남 김해시');
insert into `User5` values(2, '김춘추', 'M', 23, '경남 경주시');
insert into `User5` values(3, '장보고', 'M', 35, '전남 완도시');
insert into `User5` values(4, '강감찬', 'M', 42, '서울시 관악구');
insert into `User5` values(5, '이순신', 'M', 51, '부산시');
insert into `User5` values(6, '신사임당', 'F', 51, '강릉시');

