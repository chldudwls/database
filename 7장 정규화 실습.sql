#날짜 : 2024/07/19
#이름 : 최영진
#내용 : 7장 정규화 실습하기

CREATE TABLE bookstore (
    orderNo INT,
    orderDate DATE,
    userid VARCHAR(10),
    userName VARCHAR(10),
    userAddr VARCHAR(10),
    bookNo INT,
    bookName VARCHAR(20),
    count INT,
    price INT
);

insert into `bookstore` values( 10001, now(), 'a101', '김유신', '김해', 101, '프로그래밍',1,28000);
insert into `bookstore` values( 10001, now(), 'a101', '김춘추', '경주', 101, '프로그래밍',1,28000);
insert into `bookstore` values( 10001, now(), 'a101', '김춘추', '경주',101, '자료구조',2,60000);
insert into `bookstore` values( 10001, now(), 'a101', '정보고', '완도',102, '자료구조',2,32000);
insert into `bookstore` values( 10001, now(), 'a101', '강감찬', '서울',110, '데이터베이스',1,25000);
insert into `bookstore` values( 10001, now(), 'a101', '이순신', '서울',110, '데이터베이스',1,41000);
insert into `bookstore` values( 10001, now(), 'a101', '이순신', '서울',102, '자료구조',1,41000);


















