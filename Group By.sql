use NORTHWND
go:

--Q1
select min(lastname) as [Min Epmloyee LastName]
from Employees

--Q2
select max(lastname) as [Max Employee LastName]
from Employees

--Q3
select count(*) as [Num of employies]
from Employees

--Q4
select count(region) as [Num of Regions]
from Employees

--Q5
select avg(unitprice) as [Avg UnitPrice]
from Products

--Q6
select max(unitprice) as [Max UnitPrice], avg(unitprice) as [Avg UnitPrice]
from Products

--Q7
select CONVERT(nvarchar(20),min(birthdate),113) as [Birthday of the oldest employee],
CONVERT(nvarchar(20),max(birthdate),113) as [Birthday of the youngest employee]
from Employees

--Q8
select count(*) as [Num of Customers]
from Customers

--Q9
select count(distinct customerID)
from Orders

--Q10
select CategoryID,max(unitprice) as [Max UnitPrice],min(unitprice) as [Min UnitPrice],avg(unitprice) as [Avg UnitPrice]
from Products
group by CategoryID

--Q11
select SupplierID, max(unitprice) as [Max UnitPrice]
from Products
group by SupplierID
order by SupplierID desc

--Q12
select avg(unitprice) as [Avg UnitPrice],SupplierID
from Products
group by SupplierID
order by avg(unitprice) desc

--Q13
select country,city,count(CustomerID) [Num of employees]
from Customers
group by Country,City
order by country,City


--Q14
select CategoryID,avg(unitprice) as [Avg UnitPrice]
from Products
where UnitPrice >40
group by CategoryID

--Q15
select city,count(customerid) as [Num of Customers]
from Customers
group by City
having city ='london'

--Q16
select CategoryID,SupplierID,
max(unitprice) [Max UnitPrice],
min(unitprice) [Min UnitPrice],
avg(unitprice) [Avg UnitPrice],
count(productid) [Num of Products]
from Products
group by CategoryID,SupplierID

--Q17
select CategoryID,max(UnitPrice) as [Max UnitPrice]
from Products
group by CategoryID
having max(unitprice)>40

--Q18
select SupplierID,avg(UnitPrice) as [Avg UnitPrice]
from Products
group by SupplierID
having avg(unitprice)>40

--Q19
select CategoryName,sum(unitsonorder) [Units on Order],
sum(unitsinstock) [Units in Stock]
from Products P join Categories C
on p.CategoryID=c.CategoryID
group by CategoryName
having CategoryName like '%c%' and sum(UnitsOnOrder)>100

--20
select Region,City,count(customerid) [Num of Customers]
from Customers
where (City like '%m%' or City like '%l%') and Region is not null
group by Region,City
having count(customerid)>=2

--Q21
select LastName,count(orderid) [Num of Orders],max(orderdate) [Last Order Date]
from Employees E join Orders O
on e.EmployeeID=o.EmployeeID
group by LastName
having count(orderid)>100



