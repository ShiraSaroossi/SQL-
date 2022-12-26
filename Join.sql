use NORTHWND
go:

--Q1
select ProductName, CategoryName
from Products P
join Categories C
on p.CategoryID=c.CategoryID

--Q2
select ProductName,CompanyName
from Products P
join Suppliers S
on p.SupplierID=s.SupplierID

--Q3
select OrderID,CompanyName
from Orders O
join Customers C
on o.CustomerID=c.CustomerID
where CompanyName like 'A%'

--Q4
select RegionDescription,TerritoryDescription
from Region R
join Territories T
on r.RegionID=t.RegionID
order by RegionDescription,TerritoryDescription


--Q5
select ProductID,CategoryName,UnitPrice
from Products P
join Categories C
on p.CategoryID=c.CategoryID
where UnitPrice>50


--Q6
select ProductID,CategoryName,p.UnitPrice,SupplierID
from Products P
join Categories C
on p.CategoryID=c.CategoryID
where SupplierID=3

--Q7
select ProductID,CategoryName,UnitPrice,SupplierID
from Products P
join Categories C
on p.CategoryID=c.CategoryID
where CategoryName like '%A%' 


--Q8
select ProductName,CategoryName,CompanyName
from Products P
join Categories C 
on p.CategoryID=c.CategoryID
join Suppliers S
on p.SupplierID=s.SupplierID


--Q9
select ProductName,Description,City
from products P
join  Categories C
on p.CategoryID=C.CategoryID
join Suppliers S
on p.SupplierID=s.SupplierID
where city in ('london','tokyo')

--Q10
select ProductID,Description,Country
from Products P
join Categories C
on p.CategoryID=c.CategoryID
join Suppliers S
on p.SupplierID=s.SupplierID
where Country like 'A%'


--Q11
select c.CustomerID,CompanyName,OrderID
from Customers C
left join Orders O
on c.CustomerID=o.CustomerID

--Q12
select OrderID,o.CustomerID,CompanyName,ShipAddress,OrderDate
from Orders O
join Customers C
on o.CustomerID=c.CustomerID and YEAR(OrderDate)=1996
where o.CustomerID like 'A%' or o.CustomerID like 'C%'

--Q13
select OrderID [Order],o.CustomerID,CompanyName [Customer Name],ShipAddress [Address],OrderDate [Order Date],
FirstName+' '+LastName as [Employee name]
from Orders O
join Customers C
on o.CustomerID=c.CustomerID and YEAR(OrderDate)=1996
join Employees E
on o.EmployeeID=e.EmployeeID
where o.CustomerID like 'A%' or o.CustomerID like 'C%'
order by OrderDate desc


--Q14a
select E1.LastName,E2.LastName
from Employees E1
join Employees E2
ON E1.ReportsTo=E2.EmployeeID

--Q14b
select E1.LastName,E2.LastName
from Employees E1
left join Employees E2
ON E1.ReportsTo=E2.EmployeeID

--Q15
select p1.ProductID,p1.ProductName, p1.UnitPrice
from Products P1
join Products P2
on p2.ProductName ='alice mutton'
where p1.UnitPrice>p2.UnitPrice

