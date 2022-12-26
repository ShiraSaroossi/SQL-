

--Q1
create function fn_EmpBdateformat(@birthdate datetime)
returns nvarchar(20)
as
begin
return convert(nvarchar(50),@birthdate,3) 
end


select dbo.fn_EmpBdateformat(birthdate) as birthDate
from employees


print dbo.fn_EmpBdateformat(GETDATE())



--Q2
create function fn_UserName(@firstName nvarchar(50),@lastName nvarchar(50),@birthdate datetime)
returns nvarchar(50)
as
begin
declare @Res nvarchar (50)
SET @RES = LEFT(@firstName,1)+@lastName+convert(nvarchar(4),year(@birthdate))
return @Res
end

select dbo.fn_UserName(FirstName,LastName,BirthDate) as [User Name],FirstName,LastName,BirthDate
from Employees




--Q3
create function fn_GetCustomers(@ProductName nvarchar(50))
returns int
as
	begin
	declare @NumCustomers int
	set @NumCustomers=(select count(companyname)
						from
							(select distinct ProductName,companyname 
							from Customers C join Orders O
							on c.CustomerID=o.CustomerID
							join [Order Details] OD 
							on od.OrderID=o.OrderID
							join Products P
							on od.ProductID=p.ProductID)as prodcust
						where ProductName=@ProductName
						group by Productname)
	return @Numcustomers
	end


select ProductName,dbo.fn_getcustomers(productname) as [Num of customers]
from products



--Q4
create function fn_discontinued(@x int)
returns nvarchar(50)
as
begin
		declare @string nvarchar(50)
		if @x=1
		set @string='Active'
		else
		set @string='Discontinued'

return @string
end


select ProductID,ProductName,Discontinued,dbo.fn_discontinued(Discontinued) as [Active/Discontinued]
from Products




--Q5
alter function fn_OrDetByCustName(@customerName nvarchar(100))
returns @T_orDet table (orderID int,
						orddate nvarchar(20),
						shippedDate nvarchar(20),
						employeeName nvarchar(50))
as
begin
		insert into @T_orDet
		select o.OrderID,dbo.fn_EmpBdateformat(OrderDate) as [Order Date],dbo.fn_EmpBdateformat(ShippedDate) as [Shipped Date],e.FirstName+' '+e.LastName as [Employee Name]
		from orders O join Employees E
		on o.EmployeeID=e.EmployeeID
		where customerid=(select CustomerID
							from Customers
							where CompanyName=@customerName)
return
end


declare @comanyname nvarchar(50)
set @comanyname=(select CompanyName from Customers
				 where customerid='alfki') 
select *
from fn_ordetbycustname(@comanyname)


--Q6
create function fn_ord_num_and_rank_for_cust_fun(@startdate datetime,@enddate datetime)
returns @T_NumOrd table (customerid nvarchar (10),
						 numOrders int,
						 rating nvarchar(1))
as
begin

insert into @T_NumOrd
select CustomerID,count(orderid) as [NUM of Orders],
					case when ROW_NUMBER()over (order by count(orderid) desc)=1 then 'A'
					when ROW_NUMBER()over (order by count(orderid) desc)=2 then 'A'
					when ROW_NUMBER()over (order by count(orderid) desc)=3 then 'A'
					when ROW_NUMBER()over (order by count(orderid) desc)=4 then 'A'
					when ROW_NUMBER()over (order by count(orderid) desc)=5 then 'A'
					else 'B'
					end as [Rating]							
from orders O 
where orderdate>@startdate and orderdate<@enddate
group by CustomerID

return
end




select *
from fn_ord_num_and_rank_for_cust_fun('1996-11-12','1997-01-27')
