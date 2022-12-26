--Q1
--@@isentity it's a parameter- when we difined a column we can difine it as identity
--this parameter gets 2 numbers - 1. the fisrt number in the series 2. the incresment number
--it means that everytime we will insert a new row to the table- indentity will check the last number in the column
--and automaticly put a number that will be the last one plus the incresment number 
--it can be used as a command to bring the last number in the identity column as well

--Q2

use NORTHWND
go:

create table my_employees
(
id int primary key,
[name] nvarchar(50),
title nvarchar(50),
deptid int,
salary money default (3500),
)


--Q3
desc my_employees

--Q5
insert into my_employees
values (1,'Aviv cohen','Clerk',10,4000)

--Q6
insert into my_employees (id,[name],title,deptid,salary)
values (2,'Miriam Levi','Sales Manager',20,3750)

--Q7
insert into my_employees
values (3,'Alon Romano','Operation Manager',30,null)

--Q8
insert into my_employees (id,[name],deptid)
values (4,'Baruch Nave',30)
--yes, it is the same, becuase the column "title" can get the null value.
--when we didn't mation the column name in the insert sent. it  means that we don't want to insert value to this specific column- so SQL put the value null .
--the salary column have a default value, so if we did not mention the column name in the insert sent.-SQL will put 3500 (the default value we cwrite in the create table instractions)


--Q9
insert into my_employees (id,[name],title,deptid,salary)
values (5,'Danny Salomon','Sales Representative',20,7000)

--Q10
select *
from my_employees

--Q11
update my_employees
set salary=4500
where id=2

--Q12
update my_employees
set [name]='Shira Saroossi', deptid=20
where id=4

--Q13
select *
from my_employees

--Q14
update my_employees
set deptid=10
where deptid=30

--Q15
delete from my_employees
where [name]='Alon Romano'

--Q16
select *
from my_employees

--Q17
insert into my_employees (id,[name],title)
select EmployeeID,FirstName+' '+LastName,Title
from Employees
where EmployeeID>5

--Q18
select *
from my_employees