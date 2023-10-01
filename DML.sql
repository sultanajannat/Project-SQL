
/*     SQL Project Name :        ZOO MANAGEMENT SYSTEM
							    Trainee Name : SULTANA JANNAT   
						    	  Trainee ID : 1272204      
							Batch ID : CS/PNTL-M/53/01 

	------------------------------------------------------------------------------------------------------
	TABLE OF CONTENTS:DML
						*INSERT DATA USING INSERT INTO KEYWORD
						*QUERY
						*A JOIN QUERY
						*A JOIN WITH GROUPBY QUERY
						*OUTER JOIN
						*CROSS JOIN
						*TOP CLAUSE WITH TIES
						*DISTINCT
						*COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
						*LIKE, IN, NOT IN, OPERATOR &  
						*OFFSET FETCH
						*UNION
						*EXCEPT INTERSECT
						*AGGREGATE FUNCTION
						*AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE
						*ROLLUP & CUBE OPERATOR
						*GROUPING SETS
						*SUB-QUERIES
						*CTE
						*MERGE
						* BUILT IN FUNCTION 
						* GET STRING LENGTH
						*CONVERT DATA USING CAST()
						*CONVERT DATA USING CONVERT()
						*CONVERT DATA USING TRY_CONVERT()
						* GET DIFFERENCE OF DATES
						* GET A MONTH NAME
						*CASE
						*IIF
						*GROPING FUNCTION
						*RANKING FUNCTION 
						*IF ELSE & PRINT
						*GOTO
						*TRY CATCH
						*WAITFOR


*/

                     --INSERT DATA USING INSERT INTO KEYWORD

GO
insert into city values('Dhaka'),('gazipur'),('Chittagang'),('Comilla'),('Syhet'),('Rajshahi'),('Barishal'),('jesshor')
go
insert into BloodGroup values('A+'),('A-'),('O+'),('O-'),('B+'),('B-'),('AB+'),('AB-')
go
insert into AllShift Values('Morning'),('Night')
go
insert into gender values ('Male'),('Female'),('Null')
go

insert into Person values(1,'Razu Ahmed','Monipur MollaPara',1,1200,'01672376443','Razu@Gmail.com','0009992244',1,'1995-07-13'),
(2,'Bahar Ahmed','Birganj Gazipur',2,1300,'01672376443','bahar@Gmail.com','0600555244',1,'1995-07-04'),
(3,'Bashir Ahmed','Zalalabad Ahmadnagar',3,1400,'01672370001','bashir@Gmail.com','0002222244',3,'1995-07-15'),
(4,'Karima anowar','Lalamatia maynamati cumilla',4,1500,'01673336443','karim@Gmail.com','0009121244',2,'1995-07-19'),
(5,'Alima Ahmed','bikrampur cumilla',4,1500,'01672276443','ali@Gmail.com','0009992277',2,'1995-06-13'),
(6,'Nazim Ahmed','lalkhal sylhet',5,1600,'01672374443','nazim@Gmail.com','0005562244',1,'1995-02-13'),
(7,'Nadir Ahmed','agargaon razbari',6,1700,'01675576443','nadir@Gmail.com','0009982244',1,'1995-07-17'),
(8,'kadir Ahmed','agargaon razbari',6,1700,'01623476443','kadir@Gmail.com','0009984524',1,'1995-01-13'),
(9,'Nadia sultana','gulshan dhaka',1,1200,'01675512343','nadia@Gmail.com','0009982837',2,'1995-03-13'),
(10,'tumpa akter','potuakhali barishar',7,1800,'01675456443','tumpa@Gmail.com','0002872244',2,'1995-04-13'),
(11,'alia zafar','jharkhand jessor',8,1900,'01675678443','alia@Gmail.com','00099826243',2,'1995-08-13'),
(12,'kamal rokon','jhigatola dhaka',1,1200,'01675213443','kama@Gmail.com','0009982345',1,'1995-07-30'),
(13,'raees sarkar','ahmadnagar jalalabad',5,1600,'01623476443','raees@Gmail.com','1239982244',1,'1995-07-25'),
(14,'iffat ara lia','kurmitola pilkhana',1,1200,'01675516543','iffat@Gmail.com','0123982244',2,'1995-07-23'),
(15,'saima sultana','mirpur dhaka',1,1200,'01671656443','saima@Gmail.com','0009982453',2,'1995-09-13'),
(16,'zaber Ahmed','agargaon razbari',6,1700,'01629876443','zaber@Gmail.com','00099832344',3,'1995-12-13')
go
select * from person
go
select * from visitors

insert into visitors values(100,'karima anowar','2022-12-01',4)
insert into visitors values(101,'bashar ahmed','2022-12-02',3)
insert into visitors values(102,'raju ahmed','2022-09-09',1)
insert into visitors values(103,'bahar ahmed','2022-02-05',2)
insert into visitors values(104,'alima ahmed','2022-12-21',5)
go

insert into department values(1,'Management')
insert into department values(2,'education')
insert into department values(3,'Finance')
insert into department values(4,'security')
insert into department values(5,'veterinary')
insert into department values(6,'maintenance')

go
insert into employeeType values(1,'full time employee')
insert into employeeType values(2,'part time employee')
insert into employeeType values(3,'temporary  employee')
insert into employeeType values(4,'seasonal employee')
go
insert into employees values(1,'Nazim Ahmed','zamaal','Hazera khatun',4,'2022-02-12','01672374443','nazim@Gmail.com',1,1,6,30000.00)
insert into employees values(2,'Nadir Ahmed','talukdar','kamala banu',1,'2022-03-01','01675576443','nadir@Gmail.com',1,3,7,25000.00)
insert into employees values(3,'kadir Ahmed','halim ali','fatema banu',3,'2022-02-01','01623476443','kadir@Gmail.com',3,4,8,10000.00)
insert into employees values(4,'Nadia sultana','kalim ullah','shuva moni',3,'2021-05-05','01675512343','nadia@Gmail.com',1,2,9,40000.00)
insert into employees values(5,'tumpa akter','suja ud dowla','rokeya begum',5,'2016-03-09','01675456443','tumpa@Gmail.com',1,1,10,50000.00)
insert into employees values(6,'alia zafar','bashir uddin','helen akter',6,'2020-09-15','01675678443','alia@Gmail.com',4,6,11,8000.00)
insert into employees values(7,'kamal rokon','rokon uz zaman','rowshan ara',8,'2019-04-08','01675213443','kama@Gmail.com',1,4,12,10000.00)
insert into employees values(8,'raees sarkar','galib ali','keya nila',7,'2022-09-04','01623476443','raees@Gmail.com',2,5,13,27000.00)
insert into employees values(9,'iffat ara lia','kashem khan','halima alam',7,'2021-05-01','01675516543','iffat@Gmail.com',3,6,14,20000.00)
insert into employees values(10,'saima sultana','salim ullah','shima begum',4,'2019-09-01','01671656443','saima@Gmail.com',4,6,15,15000.00)
insert into employees values(11,'zaber Ahmed','zobaer zaman','hazera',3,'2020-02-02','01629876443','zaber@Gmail.com',1,3,16,30000.00)
go
insert into officeStaff values(1,'Nazim Ahmed',1,1)
insert into officeStaff values(2,'Nadir Ahmed',2,2)
insert into officeStaff values(3,'Nadia sultana',3,4)
insert into officeStaff values(4,'tumpa akter',4,5)
insert into officeStaff values(5,'raees sarkar',5,8)
insert into officeStaff values(6,'zaber Ahmed',6,11)
go
insert into AnimalType values(1,'Mammals')
insert into AnimalType values(2,'Reptiles ')
insert into AnimalType values(3,'Aquatic ')
insert into AnimalType values(4,'birds')
insert into AnimalType values(5,'insects')


go
insert into Zookeeper values(1,'alia zafar',1,6)
insert into Zookeeper values(2,'iffat ara lia',2,9)
insert into Zookeeper values(3,'saima sultana',3,10)
insert into Zookeeper values(4,'alia zafar',4,6)
insert into Zookeeper values(5,'iffat ara lia',5,9)

go
insert into feedings values(1,'carnivorous')
insert into feedings values(2,'herbivorous')
insert into feedings values(3,'Both')
select * from feedings
go
insert into Animal values(1,'elephant',5,1,2,2000.00)
insert into Animal values(2,'Horse',2,1,2,1000.00)
insert into Animal values(3,'machranga',1,4,3,1000.00)
insert into Animal values(4,'crocodile',8,2,1,2000.00)
insert into Animal values(5,'snake',5,2,1,3000.00)
insert into Animal values(6,'tiger',10,1,1,4000.00)
insert into Animal values(7,'tia bird',1,4,3,500.00)
insert into Animal values(8,'dophine',3,3,1,3000.00)
insert into Animal values(9,'hippopotemus',7,1,2,5000.00)
insert into Animal values(10,'zebra',4,2,2,4000.00)
insert into Animal values(11,'deer',3,1,2,3000.00)
insert into Animal values(12,'lion',11,1,1,7000.00)
insert into Animal values(13,'butterfly',1,5,2,5000.00)
insert into Animal values(14,'monkey',5,1,2,400.00)
insert into Animal values(15,'hayeena',8,1,1,1500.00)
go
select * from animal

insert into equipments values(1,'chair',500.00,20)
insert into equipments values(2,'table',800.00,10)
insert into equipments values(3,'computer',10000.00,5)
insert into equipments values(4,'case',300.00,30)
insert into equipments values(5,'medicine',2000.00,30)
insert into equipments values(6,'bamboo feeder',100.00,15)
insert into equipments values(7,'under water fish feeder',200.00,10)
insert into equipments values(8,'zookeeper tool',500.00,20)
insert into equipments values(9,'toy products',500.00,20)
insert into equipments values(10,'tray',50.00,20)
insert into equipments values(11,'vaccine',500.00,20)
insert into equipments values(12,'spike tree',100.00,20)
go
insert into stockIN values(1,1,20)
insert into stockIN values(2,2,10)
insert into stockIN values(3,3,5)
insert into stockIN values(4,4,30)
insert into stockIN values(5,5,30)
insert into stockIN values(6,6,15)
insert into stockIN values(7,7,10)
insert into stockIN values(8,8,20)
insert into stockIN values(9,9,20)
insert into stockIN values(10,10,20)
insert into stockIN values(11,11,20)
insert into stockIN values(12,12,20)
go
insert into comments values(1,'good')
insert into comments values(2,'bad')
insert into comments values(3,'need to upgrade')
go
select * from person
go


           --QUERY----



select * from person
GO
select * from visitors
go
select * from V_visitorsInfo
go

               ---A JOIN QUERY


select * from person p
inner join visitors v on p.personID=v.personid
go


--A JOIN WITH GROUPBY QUERY


select p.FullName,count(p.personId) as 'person' from person p
inner join visitors v on p.personID=v.personid
group by p.FullName
go


--OUTER JOIN
select * from employees e
left join bloodgroup bg on bg.BloodID=e.BloodID
right join zookeeper zk on zk.employeeID=e.employeeID
go

select * from zookeeper


--CROSS JOIN


SELECT * from animalType al
cross join zookeeper zk 
go


--TOP CLAUSE WITH TIES--


select top 5 with ties p.fullname,p.genderID from person p
inner join employees emp on emp.personid=p.personid
order by employeeid
go

--DISTINCT


select DISTINCT employeeid, p.fullname,p.genderID from person p
inner join employees emp on emp.personid=p.personid
order by employeeid
go


--COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR


select * from person
where cityid=1
and DOB between '1995-07-13' and '1995-09-13'
and not genderid =3
and postalcode>1800
go


--LIKE, IN, NOT IN, OPERATOR &  


select * from animal
where animalname like '%a'
and animaltypeid not in ('5','1')
go

--  OFFSET FETCH --

select * from person
order by genderid
offset 5 rows
fetch next 5 rows only
go


--UNION --


select * from person 
where cityid in ('1','2','3')
union
select * from person 
where cityid in ('4','5','6')
go


--EXCEPT INTERSECT

--EXCEPT


select * from person
except 
select * from person 
where genderid=2

--INTERSECT


select * from animal
where animalid>5

INTERSECT
select * from animal
where animalid>10
go


--AGGREGATE FUNCTION


select count(*) 'total employee',
		sum(salary) 'total salary',
		avg(salary) 'avarage salary',
		min(salary) 'min salary',
		max(salary) 'max salary'
from employees
go


--AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE


select emp.employeeid, emp.employeename, sum (salary) from employees emp
inner join  zookeeper zk on zk.employeeid=emp.employeeid
group by emp.employeeid, emp.employeename
having sum(salary)<50000.00

go


--ROLLUP & CUBE OPERATOR---


--ROLLUP


select emp.employeeid, emp.employeename, sum (salary) from employees emp
inner join  zookeeper zk on zk.employeeid=emp.employeeid
group by rollup (emp.employeeid, emp.employeename)
go


--CUBE OPERATOR


select emp.employeeid, emp.employeename, sum (salary) from employees emp
inner join  zookeeper zk on zk.employeeid=emp.employeeid
group by cube (emp.employeeid, emp.employeename)


--GROUPING SETS


select emp.employeeid, emp.employeename, sum (salary) from employees emp
inner join  zookeeper zk on zk.employeeid=emp.employeeid
group by grouping sets (emp.employeeid, emp.employeename)


go
--SUB-QUERIES=
--A SUBQUERY TO FIND OUT PERSONS WHO ARE  VISITORS 


SELECT  * from person
where personid not in (select personid from employees)

go


--CTE


with cteKEEPER as
(select p.personid,p.fullname,emp.salary from person p
inner join employees emp on p.personid=emp.personid
)
select * from zookeeper 
GO

--MERGE


SELECT * FROM COMMENTS
select * from commentinfo
go
merge comments as source 
using commentinfo as target
on source.commentid =target.id
when not matched by target then
insert (commentid, comment) Values();
go
  

  --BUILT IN FUNCTION 

  -- Get current date and time

  select getdate()
  
-- GET STRING LENGTH
select * from Employees

select employeeId, LEN([EmployeeName]) 'Name Length' FROM Employees
GO

-- CONVERT DATA USING CAST()


select CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()


declare @currTime datetime = GETDATE()
select CONVERT(VARCHAR, @currTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()


select TRY_CONVERT(float, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES


select datediff(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME


SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO


--==============  CASE ============--

select p.personid,p.fullname,emp.salary,
						case when emp.salary<20000 then 'lower salary'
							when emp.salary>20000 then 'average salary'
							when emp.salary>49000 then 'higher salary'

						end as 'comment'

from person p
inner join employees emp on p.personid=emp.personid

--==============  iif ============--

select p.personid,p.fullname,emp.salary ,
							iif((salary>25000),'great salary','lower price') as 'status'
from person p
inner join employees emp on p.personid=emp.personid

--==============  GROPING FUNCTION ============--


select  
						case when grouping(genderid) = 1 then 'female'
						else 'male'
						end as 'status'
from person p
inner join employees emp on p.personid=emp.personid
group by genderid
go

--==============  RANKING FUNCTION ============--


select
rank() over (order by personid) as 'rank',
dense_rank() over (order by cityid ) as 'dense rank',
ntile(4) over (order by personid) as 'ntile',
personid, fullname, cityid  from  person
go


--==============  IF ELSE & PRINT ============--


declare @salary money
select @salary=avg(salary)
from employees
if @salary>30000
begin
	print 'sufficient for living'
end
else 
	begin 
		print 'not sufficient for living'
	end

	go

	--==============  TRY CATCH ============--


begin try
	delete from comments
	print 'SUCCESSFULLY DELETED'
end try

begin catch
		declare @Error varchar(200) = 'Error' + CONVERT(varchar, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE()
		print (@Error)
END catch
go


--==============  GOTO ============--


declare @value INT
set @value = 0

while @value <= 10
	begin
	   IF @value = 2
		  goto printMsg
	   set @value = @value + 1

	   	IF @value = 9
		  GOTO printMsg2
	   set @value = @value + 1
	end
printMsg:
   PRINT 'Crossed Value 2'
printMsg2:
   PRINT 'Crossed Value 9'
go


--==============  WAITFOR ============--



print 'HELLO'
waitfor delay '00:00:03'
print 'GOOD LUCK'
go