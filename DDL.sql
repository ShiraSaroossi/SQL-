--Q1
create database human_resource_db

--Q2
create table employees
(
	Employee_id INT primary key identity(1,1),
	Last_name nvarchar(20)  not null,
	hire_date datetime default(getdate()) not null,
	salary money default(5000),
	email nvarchar(30) 

unique (email)
)

--Q3
alter table employees
add Department_ID int foreign key references departments(department_id)


--Q4
select *
into emp_history
from employees

--Q5
truncate table emp_history
