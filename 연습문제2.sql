create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on shop. * to 'shop'@'%';
flush privileges;

use `shop`;


CREATE TABLE `Customer` (
	`custId` VARCHAR(10)  PRIMARY KEY,
	`name`   VARCHAR(10)  NOT NULL,
	`hp`	 CHAR(13)     DEFAULT NULL,
	`addr`   VARCHAR(100) DEFAULT NULL,
	`rdate`	 DATE         NOT NULL
);

CREATE TABLE `Product` (
	`prodNo`	INT         PRIMARY KEY,
	`prodName`  VARCHAR(10) NULL,
	`stock`		INT         DEFAULT 0,
	`price`		INT 	    DEFAULT NULL,
	`company`   VARCHAR(20) NULL
);
drop  table `Product`;


CREATE TABLE `Order`(
	`orderNO`	int auto_increment primary key,
    `orderld`	varchar(10) not null,
    `orderProduct`	int not null,
    `orderCount`	int default 1,
    `orderDate`	datetime not null
    );
    
    insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
	insert into `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
	insert into `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-02');
	insert into `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-02');
	insert into `Customer` VALUES ('c105', '이성꼐', '(null)', '(null)', '2022-01-02');
	insert into `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-02');
	insert into `Customer` VALUES ('c107', '허준', '(null)', '(null)', '2022-01-02');
	insert into `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-02');
	insert into `Customer` VALUES ('c110', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-02');
	insert into `Customer` VALUES ('c111', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-02');
    
    
    insert into `Product` VALUES(1, '새우깡', 5000, 1500, '농심');
    insert into `Product` VALUES(2, '초코파이', 2500, 2500, '오리온');
    insert into `Product` VALUES(3, '포카칩', 3600, 1700, '오리온');
    insert into `Product` VALUES(4, '양파링', 1250, 1800, '농심');
    insert into `Product` (`prodNO`, `prodName`, `stock`, `company`) values (5, '죠리퐁', 2200, '크라운');
    insert into `Product` VALUES(6, '마카렛트', 3500, 3500, '롯데');
    insert into `Product` VALUES(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');
    
    
    insert into `Order` values(1, 'c102', 3, 2, '2022-07-01 13:15:10');
    insert into `Order` values(2, 'c101', 4, 1, '2022-07-01 14:16:11');
    insert into `Order` values(3, 'c108', 1, 1, '2022-07-01 17:23:18');
    insert into `Order` values(4, 'c109', 6, 5, '2022-07-02 10:46:36');
    insert into `Order` values(5, 'c102', 2, 1, '2022-07-03 09:15:37');
    insert into `Order` values(6, 'c101', 7, 3, '2022-07-03 12:35:12');
    insert into `Order` values(7, 'c110', 1, 2, '2022-07-03 16:55:36');
    insert into `Order` values(8, 'c104', 2, 4, '2022-07-04 14:23:23');
    insert into `Order` values(9, 'c102', 1, 3, '2022-07-04 21:54:34');
    insert into `Order` values(10, 'c107',6, 1, '2022-07-08 14:21:03');
    
    
    select * from `Product`;
    select `custId`, `name`, `hp` from `Customer`;
    select * from `product`;
	select `company` from `product`;
    select distinct `company` from `product`;
    select `prodName`, `price` from `product`;
    select `prodName`, `stock`, `price` from `product` where `company`='오리온';
	select 
			`orderProduct`,
			`orderCount`,
            `orderDate` 
            from `Order` 
            where `orderId`='c102';
	
    select * from `Product` where `price` >= 1000 and `price` <= 2000;
    select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '김%';
    select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__';
    select * from `customer` where `hp` is null;
<<<<<<< HEAD
    select * from `customer` where `addr` is not null;
=======
    select * from `customer` where `addr` is not null;
    
    
    
    
    
    
    
    
    
>>>>>>> 5a8875c940cd801fdf722a22971c2a7327921fd9
