create database assignment;

use assignment;
create table orders1 (
ord_no int primary key,
purch_amt float not null,
ord_date date,
customer_id int not null,
salesman_id int not null);

select * from orders1;

insert into orders1
( ord_no,purch_amt,ord_date,customer_id,salesman_id)
values 
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.6,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001);
-- total purchase amount
select sum(purch_amt) from orders1;

-- average of purchase amount 
select avg(purch_amt) from orders1;

-- total unique salespersons count 
select salesman_id ,count(salesman_id) from orders1 
group by (salesman_id);

-- select purch_amt from orders1 
-- group by purch_amt
-- having max(purch_amt);

-- Maximum purchase 
select max(purch_amt) from orders1;

-- min purchase 
select min(purch_amt) from orders1;

-- finding highest purchase amount for each customer
select customer_id, max(purch_amt) from orders1
group by customer_id;


-- highes purchase by customer on date 
select customer_id, ord_date, max(purch_amt) from orders1
group by customer_id, ord_date;

-- Highest Purchase Amount by Salesperson on '2012-08-17'
select salesman_id ,ord_date, max(purch_amt) from orders1
where ord_date = '2012-08-17'
group by salesman_id,ord_date
;

-- count orders on 2012-08-17
select customer_id, count(ord_date) from orders1
where ord_date = '2012-08-17'
group by customer_id;

-- Highest Purchase Amount by Customer on Specific Date
select customer_id , max(purch_amt), ord_date from orders1
group by customer_id, ord_date;

-- Max Purchase Amount by Customer and Order Date (2000-6000)
select  ord_date, customer_id ,purch_amt from orders1
where purch_amt > 2000 and purch_amt < 6000;