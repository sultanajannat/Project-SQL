/*       
					SQL Project Name : ZOO MANAGEMENT SYSTEM (ZMS)
							    Trainee Name : SULTANA JANNAT   
						    	  Trainee ID : 1272204       
							Batch ID : CS/PNTL-M/53/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [ZMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/  
CREATE DATABASE ZMS
ON
(
	name = 'ZMS_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ZMS_data.mdf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5%
)
LOG ON
(
	name = 'ZMS_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ZMS_log.ldf',
	size = 8MB,
	maxsize = 40MB,
	filegrowth = 5MB
)
GO

USE ZMS
GO

/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/
/*
--============== Table with IDENTITY, PRIMARY KEY, FOREIGN KEY & nullability CONSTRAINT... ============--
                  PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT
-==============    CHECK CONSTRAINT & set CONSTRAINT name ============--



*/

Create table City
(
	CityID int primary key identity,
	CityName varchar(30) not null
)
Create Table BloodGroup
(
	BloodID int primary key identity,
	BloodGroup varchar(20) not null
)
Create table AllShift
(
	ShiftID int primary key identity,
	ShiftName varchar(30) not null
)
Create table Gender
(
	GenderID int primary key identity,
	GenderName varchar(20) default null
)
Create table Person
(
	PersonID int primary key,
	FullName varchar(30) not null,
	Address varchar(50),
	CityID int references City(CityID),
	PostalCode int,
	Phone varchar(20),
	Email varchar(30) unique constraint ck_email CHECK (email LIKE '%@%' ),
	NID varchar(15) ,
	GenderID int references Gender(GenderID),
	DOB date
)
Create table Visitors
(
	TicketNumber int primary key,
	visitorName varchar(20) not null,
	VisitDate date default getdate(),
	PersonID int references Person(PersonID)
	
)
Create table department
(
	deptID int primary key,
	DepartmentName varchar(30) not null
)
Create table EmployeeType
(
	EmployeeTypeID int primary key,
	EmployeeType varchar(30) not null
)
go
Create table Employees
(
	EmployeeID int primary key,
	EmployeeName varchar(30) not null,
	FatherName Varchar(30),
	MotherName varchar(30),
	BloodID int references BloodGroup(BloodID),
	HireDate date null,
	phone char(20) ,
	email varchar(40),
	EmployeeTyepeID int references EmployeeType(employeetypeID),
	deptID int references  Department(deptID),
	PersonId int references person(personID),
	Salary money

)
go
 create table officeStaff
 (
staffid int primary key,
staffName varchar(30) not null,
deskno int null,
employeeid int references Employees(EmployeeID)
)
go
Create Table AnimalType
(
	AnimalTypeID int primary key,
	AnimalTypes Varchar(30)
)
Create table Zookeeper
(
zookeeperid int primary key,
Name varchar(30) not null,
AnimalTypeID int references AnimalType(AnimalTypeID),
EmployeeID int references Employees(EmployeeID)
)
go

Create Table Feedings
(
	FoodID int primary key,
	FoodName varchar(40)
)
create table animal
(
	animalID int primary key,
	AnimalName varchar(30) not null,
	Age int ,
	AnimalTypeID int references AnimalType (AnimalTypeID),
	FoodID int references Feedings(FoodID)
	
)
go
create table equipments
(
	productid int primary key,
	equipmentName varchar(30),
	price money,
	stock int default 0
)
create table stockIN
(
	stockid int primary key,
	productId int references equipments(productId),
	quantity int not null
)
go
create table SalesAndExpense
([Date] date primary key default getdate(),
PerDayTotalEarned money,
PerDayTotalExpense money,

)
create table Comments
(
	CommentID int,
	Comment Nvarchar(100)
)
go
create table commentinfo
(id int primary key,
comment nvarchar(100),
age int default 5)
go
--drop table commentinfo


go



/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


--============== Update column definition ============--
alter table Comments
alter column Comment Nvarchar(100) NOT NULL
go
--============== ADD column with DEFAULT CONSTRAINT ============--
alter table Animal
add Amimalprice money default 0.00
go
--============== DROP COLUMN ============--
alter table allShift
drop column ShiftName
go
--============== DROP TABLE ============--
--DROP TABLE AllShift


/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/
-- Clustered Index
create clustered index IX_Comments
on Comments
(commentID)
go

-- Nonclustered Index
create unique nonclustered index IX_Employeesinfo
on Employees
(
	Phone,
	Email
)
go
/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

create sequence seqSerial
	as int
	start with 1
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 200
	CYCLE
	CACHE 10
go

--============== ALTER SEQUENCE ============--
alter sequence seqSerial
	MAXVALUE 200
	CYCLE
	CACHE 9
go


/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/
create view V_visitorsInfo
as
select TicketNumber,visitorName,VisitDate,PersonID from Visitors
go


 /*  
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/
--============== STORED PROCEDURE for insert data using parameter ============--
create procedure SPInsertPerson 
								@PersonID int ,
								@FullName varchar(30),
								@Address varchar(50),
								@CityID int,
								@PostalCode int,
								@Phone varchar(20),
								@Email varchar(30),
								@NID varchar(10),
								@GenderID int,
								@DOB date

as
begin
	insert into Person(PersonID,FullName,[Address],CityID,PostalCode,Phone,Email,NID,GenderID,DOB)
	values(@PersonID,@FullName,@Address,@CityID,@PostalCode,@Phone,@Email,@NID,@GenderID,@DOB)				   
end


go
--============== STORED PROCEDURE for insert data with OUTPUT parameter ============--
create procedure SPInsertEmployee 
								 @EmployeeName varchar(30),
								  @FatherName Varchar(30),
								  @MotherName varchar(30),
								  @BloodID int ,
								  @HireDate date ,
								  @phone char(20) ,
								  @email varchar(40),
								  @EmployeeTyepeID int ,
								  @deptID int,
								  @PersonId int,
								  @Salary money,
								  @ID int output

as
begin
	insert into Employees(EmployeeName,FatherName,MotherName,BloodID,HireDate,phone,email,EmployeeTyepeID,deptID,PersonId,Salary)
	 values(@EmployeeName,@FatherName,@MotherName,@BloodID,@HireDate,@phone,@email,@EmployeeTyepeID,@deptID,@PersonId,@Salary)
			select @ID=ident_current('employees')
end
go
--============== STORED PROCEDURE for UPDATE data ============--
create procedure SPupdatePerson @PersonID int,
								@Phone varchar(20)

as
begin 
	update Person
	set
	Phone=@phone
	where PersonID=@PersonID
end
		go

--============== STORED PROCEDURE for DELETE Table data ============--
create procedure SPDelShift @ShiftID int
as
begin
	delete from AllShift 
	where ShiftID=@ShiftID
end
go
--============== ALTER STORED PROCEDURE ============--
alter procedure spupdatePerson @PersonID int,
					@Phone varchar(20),
					@email varchar(30)
as
begin
	Update Person
	set
	Phone=@Phone,
	Email=@email
	where PersonID=@PersonID
end
go
/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current date Total Net Sales

create function fnPeryearEarn()
 returns money
 as

begin 
	declare @totalEarns money
	select @totalEarns = sum((PerDayTotalEarned))
	from SalesAndExpense
	where year(SalesAndExpense.[Date]) =year(getdate())
	return @totalEarns
end
go
/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

-- Create trigger on Stockin table and update stock in product table

create trigger trStockIn
on StockIn
FOR insert
AS
begin
	declare @pid int
	declare @stock int

	select
	@pid = productId,
	@stock = inserted.quantity
	from inserted

	update equipments
	set stock = stock + @stock
	where productId = @pid
	print 'Stock updated via Stock Entry'
end
go
--============== AN AFTER/FOR TRIGGER FOR INSERT, UPDATE, DELETE ============--

create trigger  trProductStockManage
on stockin
for insert, update, delete
as
	begin
		declare @pid int
		declare @qty int
				-- Check if this trigger is executed only for updated
				if (exists(select * from inserted) AND exists(select * from DELETED))
					begin
						update equipments
						set stock = (case
										when i.quantity > d.quantity then stock - (i.quantity-d.quantity)
										when i.quantity < d.quantity then stock + (d.quantity-i.quantity)
										else i.quantity
									end)
						from inserted As i
						inner join deleted AS d
						on i.productId = d.productId
						where equipments.productId = i.productId
						print 'Stock updated via modified sales entry'
					end
								--Check if this trigger is for only for inserted
				else if (exists(select * from inserted) AND NOT exists(select * from deleted))
					begin
						select
						@pid = productid,
						@qty = quantity
						from inserted

						update equipments
						SET stock = stock - @qty
						where productId = @pid
						print 'Stock updated via new sales'
					end
				-- Check if this trigger is executed only for deleted
				else if (exists(select * from deleted) and not exists(select * from inserted))
					begin
						select
						@pid = productid,
						@qty = quantity
						from deleted

						update equipments
						set stock = stock + @qty
						where productId = @pid
						print 'Stock updated due to deleted sales id'
					end
				-- If not match any condition then rollback the transaction
				else rollback transaction
		end
GO	


/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/
create trigger trViewInsteadInsert
ON V_visitorsInfo
instead OF insert
AS
begin
	insert into Visitors (TicketNumber,visitorName,PersonID)
	select i.TicketNumber, i.visitorName,i.PersonID from inserted i
END
GO

--============== ALTER TRIGGER ============--


alter trigger trViewInsteadInsert
ON V_visitorsInfo
instead OF insert
AS
begin
	insert into Visitors (TicketNumber,visitorName,PersonID,VisitDate)
	select i.TicketNumber, i.visitorName, i.PersonID,i.VisitDate from inserted i
end
