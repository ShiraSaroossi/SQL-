use NORTHWND
go:

--Q1
create view emp_vw
as
	select EmployeeID,FirstName,LastName,[Address]
	from Employees
	where city in ('tacoma','london')

select * from emp_vw	

--Q2
create view pro_vw
as
select CategoryID,avg(UnitPrice) as [avg_UnitPrice]
from Products
where CategoryID in (1,2,4)
group by CategoryID

select * from pro_vw

--Q3
alter view pro_vw
as
select CategoryName, avg(p.unitprice) as [AVG_UnitPrice]
from Products P
join Categories C
on p.CategoryID=c.CategoryID
where p.CategoryID in (1,2,4) 
group by CategoryName
having avg(p.unitprice)>25

select * from pro_vw

--Q4
create view cust_orders_vw
as
select CompanyName,count(OrderID) as [NUM OF ORDERS]
from Orders O join Customers C
on o.CustomerID=c.CustomerID
group by CompanyName

select * from cust_orders_vw

--Q5
select CompanyName,[NUM OF ORDERS]
from cust_orders_vw
where [NUM OF ORDERS]>10
order by [NUM OF ORDERS]


--Q6
create view prods
AS
SELECT ProductID,ProductName,UnitPrice,unitsinstock-unitsonorder as [Units Left]
FROM Products
where UnitPrice<30


select *
from prods


--Q7
--a
update prods
set ProductName = 'jiffa'
where ProductID=52

select * from prods where productid=52

--b
update  prods
set UnitPrice=31
where ProductID=52



--c
select * from prods
where ProductID=52
--the view contains "where UnitPrice<30" - we now changed his price to 31 - the view
--will not show him any more .
--but if we will check in the main table (that's in the view) we will see that the price has changed.

select * from Products where productid=52

--d
update prods
set [Units Left]=41
where ProductID=1
--won't work becuase this column doesn't exsist in the main table - PRODUCTS.

--Q8
alter view prods
AS
SELECT ProductID,ProductName,UnitPrice,(unitsinstock-unitsonorder) as [Units Left]
FROM Products
where UnitPrice<30
with check option

select * from prods


--Q9
--7a
update prods
set ProductName='jiffa'
where ProductID=52
-- this row doen't exsist in the query from the view - so nothing happed - 0 rows affected

--7b
update prods
set UnitPrice=31
where ProductID=52
--the same as above 





