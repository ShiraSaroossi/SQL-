use NORTHWND
go:

--Q1
select ProductName
from products
 where unitprice <(select unitprice
                   from Products
					where ProductID=8)

--Q2
select ProductName,UnitPrice
from products
 where unitprice >(select unitprice
                   from Products
				    where ProductName='Tofu')

--Q3
select FirstName+' '+LastName [Full Name], HireDate
from Employees
where HireDate>(select HireDate
				from Employees
				where EmployeeID=6)

--Q4
select ProductID,ProductName,UnitPrice
from Products
where UnitPrice>(select avg(unitprice)
				from Products)

--Q5
select ProductName,UnitsInStock
from Products
where UnitsInStock<(select min(unitsinstock)
					from Products
					where CategoryID=5)

--Q6
select *
from Products
where CategoryID=(select CategoryID
				  from Products
				  where ProductName='Chai') and ProductName<>'Chai'

--Q7
select ProductName,UnitPrice,CategoryID
from Products
where UnitPrice=any(select UnitPrice 
					from Products 
					where CategoryID=5)

--Q8
select ProductName,UnitPrice
from Products
where UnitPrice>any(select UnitPrice 
					from Products 
					where CategoryID=5)

--Q9
select ProductName,UnitPrice
from Products
where UnitPrice>all(select UnitPrice 
					from Products 
					where CategoryID=5)

--Q10
select *
from Orders
where customerid=any (select CustomerID
					from Customers
					where Country in ('Germany','France','Sweden')) and year(OrderDate)=1997

--Q11
select ProductName,ProductID,UnitPrice
from Products
where UnitPrice> (select avg(unitprice)
				from Products
				where UnitsInStock>50)

--Q12
select ProductName,categoryid,supplierid
from Products
where categoryid= any(select CategoryID
					   from Categories
					   where CategoryName in ('Beverages' ,'Condiments')) 
and SupplierID=any (select SupplierID
					from Suppliers
					where Region is null)

--Q13
select CompanyName
from Suppliers
where SupplierID=any(select SupplierID
					from Categories C join Products P
					on c.CategoryID=p.CategoryID
					where CategoryName='Beverages')

--CLASS-QA*
SELECT EmployeeID,orderid,OrderDate
FROM Orders o1
WHERE O1.OrderDate=(SELECT MAX(O2.orderdate)
					from Orders O2
					where o1.EmployeeID=o2.EmployeeID)
order by EmployeeID


--CLASS-QB*
SELECT SupplierID,CompanyName
FROM Suppliers s
WHERE exists (SELECT *
			  FROM Products P
			  where 3=p.SupplierID and p.UnitPrice<20)












