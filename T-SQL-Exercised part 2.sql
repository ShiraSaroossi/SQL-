use NORTHWND
go:

--T-SQL-EXERCISED PART 2
DECLARE @HowManyOrders int=2,
@HowManyOrderDetailsMin int=1,
@HowManyOrderDetailsMax int=5,
@HowManyOrderDetails int,

@CUSTID NVARCHAR(10),
@EMPID INT,
@orderID int,
@prodID int,
@i int=1,
@n int

while @i<=@HowManyOrders
begin
		set @CUSTID=(select top 1 customerid from Customers order by NEWID())
		set @EMPID=(select top 1 EmployeeID from Employees order by NEWID())

		insert into Orders (CustomerID,EmployeeID,OrderDate)
		values (@CUSTID,@EMPID,getdate())

		set @orderid=(select max(OrderID) from Orders)
		
		set @HowManyOrders=((select dbo.fn_RanBetween(@HowManyOrderDetailsMin,@HowManyOrderDetailsMax)))
		set @n=1

		while @n<=@HowManyOrders
				begin
					set @prodID=(select top 1 productid from products where productid not in(select productid from [Order Details] where OrderID=@orderID) order by newid())

					insert into [Order Details]
				   values(@orderID,@prodID,(select unitprice from Products where ProductID=@prodID),(select dbo.fn_RanBetween(10,1)),RAND())
				set @n=@n+1
				end
	
	set @i=@i+1
end


select *
from Orders

select *
from [Order Details]