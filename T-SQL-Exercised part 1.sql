use NORTHWND
go:

--T-SQL EXERCISED - PART 1
declare @HowManyOrders int=2,
@CUSTID NVARCHAR(10),
@EMPID INT,
@orderID int,
@prodID int,
@i int=1

while @i<=@HowManyOrders
begin
		set @CUSTID=(select customerid from orders where OrderID=(select dbo.fn_RanBetween((select min(orderid) from orders),(select max(orderid) from orders))))
		set @EMPID=(select EmployeeID from orders where OrderID=(select dbo.fn_RanBetween((select min(orderid) from orders),(select max(orderid) from orders))))

		insert into Orders (CustomerID,EmployeeID,OrderDate)
		values (@CUSTID,@EMPID,getdate())

		set @orderid=(select max(OrderID) from Orders)
		set @prodID=(select dbo.fn_RanBetween((select min(productid) from products),(select max(productid) from products)))

		insert into [Order Details]
		values(@orderID,@prodID,(select unitprice from Products where ProductID=@prodID),(select dbo.fn_RanBetween(10,1)),RAND())

		set @i=@i+1
end

select *
from Orders

select *
from [Order Details]
