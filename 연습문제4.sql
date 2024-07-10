
create table `Student`(
`stdNo` char(8) primary key,
`stdName` varchar(20) not null,
`stdHP` char(13) unique,
`stdYear` tinyint not null,
`stdAddress` varchar(100) 
);

create table `Lecture`(
`lecNO` int primary key,
`lecNAme` varchar(20) not null,
`lecCredit` tinyint not null,
`lecTime` int not null,
`lecClass` varchar(10) default null
);

create table `Register`(
`regStdNO` char(8),
`regLecNO` int,
`regMidScore` tinyint,
`regFinalScore` tinyint,
`regTotalScore` tinyint ,
`regGrade` char(1) 
);



insert into `student` value ('20201016', '김유신', '010-1234-1001', 3,null );
insert into `student` value ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `student` value ('20200216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `student` value ('20200326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `student` value ('20200416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `student` value ('20200516', '송상현', '010-1234-1006', 1, '부산시 동래구');


insert into `Lecture` value(159, '인지행동심리학', 3, 40, '본304');
insert into `Lecture` value(167, '운영체제론', 3, 25, '본B05');
insert into `Lecture` value(234, '중급 영문법', 3, 20, '본2001');
insert into `Lecture` value(239, '세법개론', 3, 40, '본204');
insert into `Lecture` value(248, '빅데이터 개론', 3, 20, '본B01');
insert into `Lecture` value(253, '컴퓨팅사고 와코딩', 2, 10, '본B02');
insert into `Lecture` value(349, '사회복지 마케팅', 2, 50, '본301');


insert into `Register` value(20201126, 234,null,null,null,null); 
insert into `Register` value(20201016, 248,null,null,null,null); 
insert into `Register` value(20201016, 253,null,null,null,null); 
insert into `Register` value(20201126, 239,null,null,null,null); 
insert into `Register` value(20210216, 349,null,null,null,null); 
insert into `Register` value(20210326, 349,null,null,null,null); 
insert into `Register` value(20201016, 167,null,null,null,null); 
insert into `Register` value(20220416, 349,null,null,null,null); 


#실습 3-4
select *from `Lecture`;

#실습 3-5
select *from `student`;

#실습 3-6
select *from `Register`;

#실습 3-7
select *from `Student` where `stdYear`=3;

#실습 3-8
select *from `Lecture` where `lecCredit`=2;
SET SQL_SAFE_UPDATES = 0;

#실습 3-9
update `Register` set `regMidScore` = 36, `regFinalScore`= 42 where
`regStdNO`='20201126' and `regLecNO`=234;

update `Register` set `regMidScore` = 24, `regFinalScore`= 62 where
`regStdNO`='20201016' and `regLecNO`=248;

update `Register` set `regMidScore` = 28, `regFinalScore`= 40 where
`regStdNO`='20201016' and `regLecNO`=253;

update `Register` set `regMidScore` = 37, `regFinalScore`= 57 where
`regStdNO`='20201126' and `regLecNO`=239;

UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE
`regStdNo`='20210216' AND `regLecNo`=349;

UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE
`regStdNo`='20210326' AND `regLecNo`=349;

UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE
`regStdNo`='20201016' AND `regLecNo`=167;

UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE
`regStdNo`='20220416' AND `regLecNo`=349;


select *from `Register`;

#실습 3-10
update `Register` set 
`regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade`= if(`regTotalSCore` >= 90, 'A',
			if(`regTotalSCore` >= 80, 'B',
			if(`regTotalSCore` >= 70, 'C',
			if(`regTotalSCore` >= 60, 'D', 'F'))));
            
#실습 3-11
select *from `register` order by `regTotalscore` desc;
#실습 3-12
select *from `register` order by `regLecNO` desc;

#실습 3-13
select *from `lecture` where `lecTime` > 30 order by `lecTime` desc limit 3;

#실습 3-14
select `lecName`, `lecClass` from `Lecture`;
#실습 3-15
select `stdNO`, `stdName` from `student`;

#실습 3-16
select *from `student` where `stdAddress` is null;
#실습 3-17
select *from `student` where `stdAddress` like '부%';
#실습 3-18
select *from `student` as a left
join `Register` as b on a.stdNO = b.regStdNo;
#실습 3-19
SELECT 
	`stdNo`,
	`stdName`,
	`regLecNo`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM 
	`Student` AS a, `Register` AS b 
WHERE a.stdNo = b.regStdNo;

#실습 3-20

SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b 
on a.stdNo = b.regStdNo
where regLecNo = 349;


SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
#실습 3-21
select `stdNo`, `stdName`,
count(`stdNo`)as`수강신청 건수`,
sum(`regTotalScore`) as `총합점수`,
sum(`regTotalScore`)/ count(`stdNo`) as `평균`
from `student` as a
join `register` as b
on a.stdNo = b.regStdno
GROUP BY `stdNo`;
#실습 3-22
select * from `register` as a 
join `Lecture` as b 
ON a.regLecNo = b.lecNo;

#실습 3-23
select
	`regStdNo`,
	`regLecNo`,
	`lecName`,	
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from
		`register` as a
	join
		`lecture` as b
	on a.reglecNo = b.lecNo;

#실습 3-24
select 
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `register` as a
join `lecture` as b
on a.reglecNo = b.lecNo
where `lecName` = '사회복지 마케팅';


#실습 3-25

select 
	`regStdNo`,
    `lecName`
    from `register` as a 
    join `lecture` as b 
    on a.regLecNO = b.lecNo
    where `regGrade`='A';
#실습 3-26
select *from `student` as a
join `register` as b
join `lecture` as c
on a.stdNo = b.regStdNO and 
b.regLecNO = c.lecNO;

#실습 3-27
select 
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFialScore`,
`regTotalScore`,
`regGrade`
from `student` as a
join `register` as b on a.stdNo = b.regStdNO 
join `lecture` as c on b.regLecNO = c.lecNo
group by `regTotalScore` desc;

#실습 3-28
select
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from`Student` as a
join `Register` as b on a.stdNo = b.regstdNo
join `Lecture` as c on b.reglecNo = c.lecNo
where `regGrade` = 'F';

#실습 3-29
select
`stdNo`,
`stdName`,
sum(`lecCredit`) as `이수학점`
	from `student` as a
    join `register` as b on a.stdNo = b. regStdNO
    join `lecture` as c on b.reglecNo = c.lecNo
    where `regGrade` <> 'F'
    group by `stdNo`;
    

#실습 3-30
select
`stdNo`,
`stdName`,
	group_concat(`lecName`) as `신청과목`,
    group_concat(if(`regTotalScore` >= 60, `lecName` , null)) as `이수과목`
	from `student` as a
    join `register` as b on a.stdNo = b. regStdNO
    join `lecture` as c on b.reglecNo = c.lecNo
    where `regGrade` <> 'F'
    group by `stdNo`;