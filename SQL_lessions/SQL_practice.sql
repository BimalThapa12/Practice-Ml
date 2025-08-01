create database swivtsql;
drop database swivtsql;
use swivtsql;

create table student (
	id int auto_increment primary key,
    name varchar(20),
    age int not null)
    auto_increment = 1000;
    
    insert into student
    ( name,age)
    values
    ('bimal',23),
    ('arun',22);
    
    select * from student;
    