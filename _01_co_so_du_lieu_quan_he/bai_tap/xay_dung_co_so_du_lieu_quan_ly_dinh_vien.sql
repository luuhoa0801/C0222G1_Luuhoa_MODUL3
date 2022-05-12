create database if not exists student_management;
use student_management;
create table class(
id INT,
`name` char(50)
);
create table teacher(
id INT,
`name` char(50),
age int,
country char(50)
);
insert into class value(1,"Luu Hoa");
select * from class;
delete from class where id = 1;

