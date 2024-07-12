create table `Customer`(
`custId` int primary key,
`name` varchar(10),
`address` varchar(20) default null,
`phonew` varchar(13) default null
);

create table `Book`(
`bookId` int primary key,
`bookName` varchar(20),
`publisher` varchar(20),
`price` int default null
);

create table `Order`(
`orderId` int primary key auto_increment,
`custId` int,
`bookid` int,
`salePrice` int,
`orderDate`  date
);

insert into `customer` values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into `customer` values (2, '김연아', '대한민국 서울', '000-6000-0002');
insert into `customer` values (3, '장미란', '대한민국 강원도', '000-7000-0003');
insert into `customer` values (4, '추신수', '미국 클리블랜드', '000-8000-0004');
insert into `customer` values (5, '박세리', '대한민국 대전', '');


insert into `book` values (1, '축구의 역사', '굿스포츠', '7000');
insert into `book` values (2, '축구아는여자', '나무수', '13000');
insert into `book` values (3, '축구의 이해', '대한미디어', '22000');
insert into `book` values (4, '골프 바이볼', '대한미디어', '35000');
insert into `book` values (5, '피겨 교본', '굿스포츠', '8000');
insert into `book` values (6, '역도 단계별기술' , '굿스포츠', '6000');
insert into `book` values (7, '야구의 추억', '이상미디어', '20000');
insert into `book` values (8, '야구를 부탁해', '이상미디어', '13000');
insert into `book` values (9, '올림픽 이야기', '성심당', '7500');
insert into `book` values (10, 'Olympic Champions', 'pearson', '13000');


insert into `order` values (1, 1, 1, 6000, '2014-07-1');
insert into `order` values (2, 1, 3, 21000, '2014-07-3');
insert into `order` values (3, 2, 5, 8000, '2014-07-3');
insert into `order` values (4, 3, 6, 6000, '2014-07-4');
insert into `order` values (5, 4, 7, 20000, '2014-07-5');
insert into `order` values (6, 1, 2, 12000, '2014-07-7');
insert into `order` values (7, 4, 8, 13000, '2014-07-7');
insert into `order` values (8, 3, 10, 12000, '2014-07-8');
insert into `order` values (9, 2, 10, 7000, '2014-07-9');
insert into `order` values (10, 3, 8, 13000, '2014-07-10');




#실습 5-4
select `custid`,`name`, `address`from customer ;

#실습 5-5
select `bookname`,`price` from book;

#실습 5-6
select `price`, `bookname` from book;

#실습 5-7
select *from Book;

#실습 5-8
select publisher from book;

#실습 5-9
select distinct publisher from book;
select publisher from book
group by publisher;

#실습 5-10
select *from book where price >= 20000;

#실습 5-11
select *from book where price < 20000;

#실습 5-12
select *from book where price > 10000 and price <= 20000;

#실습 5-13
select bookid, bookname, price from book where price > 15000 and price <= 30000;

#실습 5-14
select *from book where bookId=2 or bookid=3 or bookid=5 ;

#실습 5-15
select *from book where bookId %2 = 0;

#실습 5-16
select *from customer where name like '박%';

#실습 5-17
select *from customer where address like '대%';

#실습 5-18
select *from customer where phone is not null;


#실습 5-19
select *from book where publisher like '굿스포츠'and publisher like '대한미디어';
#실습 5-20
select publisher from book where bookName like '축구의 역사';

#실습 5-21
select publisher from book where bookName like '축구%';

#실습 5-22
select *from book where bookName like '%구%'; 

#실습 5-23
select *from book where bookName like '%축구%' and price > 20000; 

#실습 5-24
select *from book order by bookname;

#실습 5-25
select *from book order by price,bookName asc;

#실습 5-26
select *from book order by price desc ,bookName  asc;

#실습 5-27
select *from book order by price desc limit 3;

#실습 5-28
select *from book order by price asc limit 3;

#실습 5-29
select  Sum(salePrice) from `order`; 

#실습 5-30
select 
sum(salePrice),
avg(salePrice),
min(salePrice),
max(salePrice) from `order`;
#실습 5-31
select *from `order`;

#실습 5-32
select `bookid`,
replace(`bookname`, '야구', '농구')as `bookname`,
`publisher`,
`price`
from `book` ;

#실습 5-33
select 
`custid`,

count(*)as `수량` 
from `order` 
where `salePrice` >= 8000
group by `custId`
having `수량`>=2;

#실습 5-34
select *from customer a
join `order` as b on a.custid = b.custId;


#실습 5-35
select *from customer a
join `order` as b on a.custid = b.custId
order by b.custId asc;

#실습 5-36
select name, saleprice from customer a
join `order` as b on a.custid = b.custId
order by b.custId asc; 

#실습 5-37
select name, sum(saleprice) from customer a
join `order` as b on a.custid = b.custId
group by name;

#실습 5-38
select name, bookname 
from customer a
join `order` as b on a.custid = b.custId
join `book` as c on b.custId = c.bookId
order by b.custId asc;


#실습 5-39
select name, bookname 
from customer a
join `order` as b on a.custid = b.custId
join `book` as c on b.custId = c.bookId
where `salePrice` =20000;


#실습 5-40
select name, saleprice from customer a
left join `order` as b on a.custid = b.custId
order by b.custId asc;

#실습 5-41
select 
sum(saleprice) 
from customer a
join `order` as b on a.custid = b.custId
where name = '김연아';

#실습 5-42
select`bookname` from `book` order by `price` desc limit 1;

#실습 5-43
select `name` from `customer` as a
left join `order` as b on a.custId = b.custId
where `orderid` is null;
#실습 5-44
update `book` set bookid = '1';
#실습 5-45
update `customer` set address ='대한민국 부산' where custId=5;


select *from customer;
#실습 5-46
delete from customer where custid=5; 
