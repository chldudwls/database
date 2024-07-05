#날짜 : 2024/7/1/
#이름 : 최영진
#내용 : 1장 데이터베이스 개요와 mysql 설치

#실습 1-1 MySQL 접속, 데이터베이스 생성 및 삭제

CREATE TABLE `StudyDB`;
show databases;

drop database `studyDB`;


#실습 1-2. 일반 관리자 생성 및 권한 부여
create user 'dudwls'@'%' identified by '1234';
grant all privileges on `studyDB`.* to 'dudw;s'@'%';
flush privileges;

#실습 1-3. 사용자 비밀번호 수정 및 삭제
alter user 'dudw;s'@'%' identified by 'abc1234';
drop user 'dudwls'@'%';
flush privileges;
