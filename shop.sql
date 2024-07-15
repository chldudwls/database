


insert into `customer` values('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
insert into `customer` values('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
insert into `customer` values('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
insert into `customer` values('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
insert into `customer` values('c105', '이순신', '010-1234-1005', '부산시 금청구', '2023-01-05');

insert into `product` values(1, '새우깡', 5000, 1500, '농심');
insert into `product` values(2, '초코파이', 2500, 2500, '오리온');
insert into `product` values(3, '포카칩', 3600, 1700, '오리온');
insert into `product` values(4, '양파링', 1250, 1800, '농심');
insert into `product` values(5, '죠리퐁', 2200, null, '크라운');

insert into `order` values(1, 'c102', 3, 2, '2023-01-01 13:15:10');
insert into `order` values(2, 'c101', 4, 1, '2023-01-01 13:15:12');
insert into `order` values(3, 'c102', 1, 1, '2023-01-01 13:15:14');
insert into `order` values(4, 'c103', 6, 5, '2023-01-01 13:15:16');
insert into `order` values(5, 'c105', 2, 1, '2023-01-01 13:15:18');

select 
`orderNo`,
`name`,
`prodName`,
`orderCount`,
`orderDate`
from `order` as a
join `customer` as b on a.orderId = b.custId
join `product` as c on a.orderProduct = c.prodNo;

select
`orderNO`,
`prodNo`,
`prodName`,
`price`
`orderCount`,
`orderDate`
from `customer` as a
join `order` as b on a.custId = b.orderId
join `product` as c on b.orderNO = c.prodNO
where name like'김유신';

select
 sum(`price`*`orderCount`)
 
from `order` as a
join `product` as b on a.orderProduct = b.prodNO;



