CREATE DATABASE abc;

use abc;

create table userData5(
id int auto_increment primary key,
first_Name varchar(30),
last_name varchar(30),
age int not null check(age >18),
gender varchar(1),
mobile bigint not null 
)auto_increment=4001; 

select * from userData5;

insert into userData5
(  first_name , last_name , age, gender , mobile)
values
('deepak','naidu',24,'O',9800000000);

select * from userData5 where age>19;

select * from userData5 where age>19 and gender='m';

select * from userData5 where age between 18 and 20;

select * from userData5 where gender in ('m','f');

select * from userData5 where gender not in ('m','f');

delete from userData5 where id in  (4002,4007);

select * from userData limit 3;

select first_name age from userData5 order by age desc limit 1;

select count(first_name) from userData5;

select min(age) from userData5;

select max(age) from userData5;

select avg(age) from userData5;

select sum(age) from userData5;

select first_name , count(id)
from userData5
group by first_name
having max(age) > 22
limit 1;

select first_name,count(id) from userData5 
group by first_name 
having max(age) >= 24 limit 1;

create table courses(
student varchar(20),
class varchar(30));

insert into courses
(  student , class)
values
('F','Computer');

select * from courses;




select class ,count(student) from Courses group by class having count(student) >= 3;
