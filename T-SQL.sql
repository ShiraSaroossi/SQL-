--Q1
declare @x NVARCHAR(10),@Y NVARCHAR(10)

SET @X='MY FIRST'
SET @Y='VARIABLE'

PRINT @X+' '+@Y
go


--Q2

declare @x nvarchar(20),@Y NVARCHAR(20)

set @x='THE DATE TODAY IS: '
SET @Y=CONVERT(NVARCHAR(20),GETDATE(),3)

PRINT @X+@Y
GO

--Q3
use NORTHWND
declare @x nvarchar(10)
set @x=(select LastName from Employees where EmployeeID=4)
print @x
go

--Q4
declare @x nvarchar(10),@y nvarchar(20)
select @X=ProductName,@Y=CategoryName
from Products P join Categories C
on p.CategoryID=C.CategoryID
where ProductID=5

PRINT @X+' FROM CATEGORY: ' +@Y
GO

--Q5
declare @price float,@y int
set @y =9

label:
set @price=(select UnitPrice from Products where ProductID=@y)
if @price>50
	print 'I like this product'
else
	select 'I do not like this product'

if @y=9 
	begin
	set @y=17
	goto label
	end

go

--Q6
declare @price float,@Name nvarchar(15)
set @name='Chai'

label:
set @price=(select UnitPrice from Products where ProductName=@Name)
if @price<20
	print 'THE NEW PRICE OF PRUDUCT '+@NAME+' '+'IS '+CONVERT(NVARCHAR(10),@PRICE*1.10)
else
	IF @PRICE>=20 OR @PRICE<40
		print 'THE NEW PRICE OF PRUDUCT '+@NAME+' '+'IS '+CONVERT(NVARCHAR(10),@PRICE*1.20)	
	ELSE
	print 'THE NEW PRICE OF PRUDUCT '+@NAME+' '+'IS '+CONVERT(NVARCHAR(10),@PRICE*1.50)

if @NAME='CHAI' 
	begin
	set @NAME='Tofu'
	goto label
	end			
ELSE
	IF @NAME='TOFU'
	begin
	set @NAME='Tarte au sucre'
	goto label
	end		

GO

--Q7

declare @i int,@name nvarchar(15)
set @i=1

while @i<=9
	begin
		select @name=LastName
		from Employees
		where EmployeeID=@i and LastName like '%e%'

		if @name is not null
				print @name
	
		set @i=@i+1
		set @name=null
	end

go

--Q8
declare @Cname nvarchar(15),@id int
set @id=3

label:
set @id=@id+1
DECLARE @T TABLE (CategoryID int, CategoryName nvarchar(50), [Description] nvarchar(50),picture image)
BEGIN TRAN
insert into @T
select  *
from Categories
where CategoryID=@id
ROLLBACK

SELECT * FROM @T
delete @t

if (select categoryName from Categories where CategoryID=@id+1) like '%a%' GOTO label
else
	print 'Category '+convert(nvarchar(2),@id+1)+' does not have A in her name'


go
