#Create Database database_name
create database sql_sample_01;
#use database_name;
use sql_sample_01;
drop database sql_sample_01;

create database sql_day_01;
show databases;
use sql_day_01;
#create table table_name(cl_name datatype...)
create table employee(emp_id tinyint, emp_name varchar(30), salary decimal(10,2), dept_id int, email varchar(30), city char(20));
desc employee;		#returns the structure of the table

#------------------------Alter-------------------------
# to add or drop the coloumns
#to modify the datatype and size
#to rename the coloumn or table
#to add or drop the constraints

#alter table table_name add column col_name datatype
alter table employee add column phn_no varchar(30);

#drop column
#alter table table_name drop column col_name;
alter table employee drop phn_no;

#modify the data type
#alter table table_name modify column col_name new_dataype;
alter table employee modify column emp_name char(30);
desc employee;

#rename the table
#alter table table_name rename to new_table_name;
alter table employee rename to emp;

#rename the column
#alter table table_name rename column old_col_name to new_col_ name;
alter table employee rename column emp_id to employee_id;
desc emp;

#using rename cmd to rename 
#rename table old_table name to new_table_name
rename table emp to employee;
desc employee;

alter table employee add column phn_no varchar(30), add column country char(10), drop column email;
desc employee;



#insert into table_name values(.....)
insert into employee values(1, 'shyam', 30000, 101, 'vjw', 8074459975, 'IND');

select * from employee;
select employee_id, emp_name, salary from employee;

insert into employee values
(2, 'sunder', 39000, 102, 'vizag', 9848562148, 'IND'),
(3, 'srinu', 45000, 103,  'hyd', 9100197195, 'IND');


use sql_day_01;
desc employee;
select * from employee;
#drop table table_name
drop table employee;

create table employee(emp_id int primary key, emp_name char(20) not null, dept_id int not null, email varchar(30) unique, salary decimal(10,2) check(salary >=25000), city char(20) default 'hyd');
desc employee;

#foreign key(child_col_name) references pareent_table_name(parent_col_name)
create table department(dept_id int, dept_name varchar(20) not null, primary key(dept_id), emp_id int, foreign key(emp_id) references employee(emp_id));
desc employee;
desc department;


insert into employee values(1,'shyam',101,'shyam@gmail.com',35000,'hyd');
select * from employee;
insert into employee values
(3,'srinu',102,'srinu2gmail.com',41000,'blr');
(4,'janardhan',104,'janardhan@gmail.com',35000,'blr');



insert into department values(101,'It',1);
select * from department;
insert into department values(102,'Marketing',2);
insert into department values(103,'Finance',3);
insert into department values(104,'production',3);

drop table employee;
drop table department;









create table students(std_id int, std_name char(20), course_id int, email varchar(20), phn_no varchar(30), city varchar(20));
desc students;




#add primary key
#alter table table_name add constraint constraint_name primary key(col_name);
alter table students add constraint prk_emp_id primary key(std_id);


#add unique
#alter table table_name add constraint c_name unique(col_name)
alter table students add constraint un_emp_name unique(std_name);


#check constraint for only positive values because we need positive only in check it will check when we give condition if > 0 
#alter table table_name add constraint c_name check(condition)
alter table students add constraint chk_cor_id check(course_id > 0);


#add default constraint
#alter table table_name alter column col_name set default 'value';
alter table students alter column city set default 'vizag';
desc students;

#add not null;
#alter table table_name modify column col_name datatype not null;
alter table students modify column email varchar(20) not null;



use sql_day_01;
desc students;
create table course(course_id int, course_name varchar(20),std_id int);
desc course;

#add foreign key
#alter table table_name add constraint c_name foreign key(child_col_name)
#references parent_table_name(parent_col_name);
alter table course add constraint fk_std_id foreign key(std_id)
references students (std_id);
desc course;

desc students;
insert into students values(1,'shyam',101,'shyam@gmail.com',8055696345,'vizag');
select * from students;
insert into students(std_id,email,phn_no)values(2,'sunder@gmail.com',9845896348);


#drop constraints
#drop primary key
#alter table table_name drop primary key;
alter table students drop primary key;


#drop foreign key before droping the primary key
#alter table table_name drop foreign key constraint_name;
alter table course drop foreign key fk_std_id;
desc course;


#drop unique key
#alter table table_name drop index constraint_name;
alter table students drop index un_emp_name;
show create table students;

#drop check constraint
#alter table table_name drop check constraint_name;
alter table students drop check chk_cor_id;



#drop default constraint
#alter table table_name alter column col_name drop default
alter table students alter column city drop default;
desc students;


#drop not null
#alter table table_name modify column col_name datatype null;
alter table students modify column email varchar(20) null;



select * from students;
insert into students values(3,'srinu',103,'srinu@gmail.com',7859569650,'vjw');
insert into students values(4,'janardhan',104,'janaedhan@gmail.com',7013341893,'vjw'),
(5,null,105,'harry@gmail.com',9878564126,'vjw'),
(6,'harry',106,'henry@gmail.com',7894561232,null);


update students set std_name = 'praveen' where std_id = 2;
set sql_safe_updates = 0;


update students set phn_no = 8965412352 where std_id = 3;

update students set city = 'hyd' where std_id = 6;

update students set city = 'blr' where course_id = 101 and city = 'vizag';


delete from students where std_id = 4;

delete from students where course_id = 105;

#remove students who are from blr
delete from students where city = 'blr';

delete from students;

#drop table table_name
#drop database database_name
drop table students;



#---------sept 2nd------------
use sql_day_01;
#get unique values from segment column
select distinct segment from superstore;
select distinct country from superstore order by country asc;
#get the country column in asc and segment in desc
select distinct country, segment from superstore
order by country asc, segment desc;
select distinct country, sales from superstore
order by country asc, sales desc;
select distinct country, sales from superstore
order by country, sales desc;
select distinct country from superstore where country = 'Germany';
select * from superstore where country ='germany' and category = 'Technology';
#country should be italy and sales should be above 500
select * from superstore where country = 'italy' and sales > 500;
select country, sales from superstore where country = 'italy' and sales > 500;
#select country from superstore where we want data from both countries
select distinct country from superstore where country = 'italy' or country = 'germany';
#get all the data from superstore for countries
	#'germany',italy','spain','united kingdom','austria'
select * from superstore where country = 'Germany' or country = 'italy' or country = 'spain' or country = 'united kingdom' or country = 'austria';
select * from superstore where country in ('Germany','Italy','Spain','united kingdom','austria');
#except those countries data
select * from superstore where country not in ('Germany','italy','spain','united kingdom','austria');
#get the sales which are below and sort thenm in desc order
select distinct sales from superstore where sales <1000 order by sales desc;
#get sales between the amount
select distinct sales from superstore where sales between 500 and 2000
order by sales;

#get the countries between 'france and 'spain'
select distinct country from superstore where country between 'france' and 'spain'
order by country;
select distinct sales from superstore where sales >=500 and sales <=2000
order by sales;

select distinct country from superstore where country != 'germany';
select distinct country from superstore where country not in ('germany');



#-----------PATTERN MATCHING-------------Like, Not Like
select distinct country from superstore where country like 'i%';	#starts with
select distinct country from superstore where country like '%a';	#ends with

#countries ends with 'ia'
select distinct country from superstore where country like '%ia';

#countries which are not starting with 'S'
select distinct country from superstore where country Not Like 'S%';
select distinct country from superstore where country Not Like '%S';

#countries with contain 'ia'
select distinct country from superstore where country like '%al%';	#contains either starting or middle or ending....

#countries which contains 'king'
select distinct country from superstore where country like '%king%';

#countries ending with 'land'
select distinct country from superstore where country like '%land';


select distinct country from superstore where country like '___i%';

select distinct country from superstore where country like '_____';
select distinct country from superstore where country like '_____%';

#countries with 6 letters and 7 letters
select distinct country from superstore where country like '______' or country like '_______';	 #6 and 7 letters
select distinct country from superstore where country like '______%';	#6 or more than 6 letters
select distinct country from superstore where country Not like '_______%'; 	#below 7 letters
#list he countries which has 'a' and 's' letters and sales should be above 500
select distinct country, sales from superstore where country like '%a%' and country like '%s%' and sales >=500;


------------------------#Aggregate functions -- sum, count, avg, min,max-------------------------------

use sql_day_01;

select distinct sales from superstore;
select sum(sales) from superstore;
select count(sales) from superstore;
select avg(sales) from superstore;
select min(sales) from superstore;
select max(sales) from superstore;
select sum(profit) from superstore;


#get country wise total sale
select country, sum(sales) from superstore group by country;
#group by-- is a clause used to group the rows.
#category wise sales fetch
select category, sum(sales) from superstore group by category
order by sum(sales) desc;
select category, sum(sales) as total_sales from superstore group by category
order by sum(sales) desc;
select country, category, sum(sales) from superstore group by country, category;


#get country and segment wise average sales
select country, segment, avg(sales) as avg_sales from superstore group by country, segment;

#get country and segment wise avg sale for the countries france, germany, italy, spain
select country, segment, avg(sales) as avg_sale from superstore
where country in ('france','germany','italy','spain')
group by country, segment order by avg_sale;

#using having clause
select country, segment, avg(sales) as avg_sale from superstore
where country in ('france','germany','italy','spain')
group by country, segment having avg_sale > 300 order by avg_sale;



#from -- chooses the table from the database
#where --filters the data
#group by -- groups the rows
#having -- filters the groups
#select -- selects the list of columns from the table
#distinct -- removes duplicates, returns unique records
#order by -- sorts the results
#limit/offset -- restricts & skips the particular no.of records

#get maximum sales for the countries germany, seden, uk, austria, and 
#the max_sale should be above 2000
select country, max(sales) as maximum_sale from superstore where country in ('germany', 'seden', 'united kingdom', 'austria')
group by country having maximum_sale > 4000;

#find country, category and segment wise total and avg_sales
select country, category, segment, sum(sales) as total_sales, avg(sales) as average_sales from superstore
group by country, category, segment;

#---------------------Excel data table dump method ---------------------------
#right click
#select table data import wizard
#asking path
#select path and dump the table data to the sql from different data file other than sql


select * from my_employee;
#dept wise total and avg salary
#dept wise highest and lowest salary
#dept wise total salary for the dept_id 20,30,40
#find no.of empls in each dept
#find no.of employees assigned to each manager
#find the dept with highest total salary


#-----------------task starts here----------------
#dept wise total and avg salary
select DEP_ID, sum(SALARY) As Total_Salary, avg(Salary) As Avg_Salary From my_employee
group by DEP_ID;

#dept wise highest and lowest salary
select DEP_ID, max(SALARY) As highest_salary, min(salary) as lowest_salary from my_employee
group by DEP_ID;

#dept wise total salary for dept_id 20,30,40
select DEP_ID, sum(salary) as total_salary from my_employee where DEP_ID in (20, 30, 40)
group by DEP_ID;


#find no.of empls in each department
select DEP_ID, count(Emp_ID) as Total_employees from my_employee
group by DEP_ID;


#find no.of empls assigned to each manager
select MGR_ID, count(emp_ID) as no_of_employees from my_employee
group by MGR_ID;


#find the dept with highest total salary
select DEP_ID, sum(salary) as total_salary from my_employee
group by DEP_ID order by total_salary desc limit 1;

use sql_day_01;
#Arthematic operators
select 3+2;
select * from my_employee;


#to decrease the salary in the table at sepcific employee



#division operation on arthematic operations
select * from superstore;
select profit, quantity,  profit/quantity as per_item_profit from superstore;


#multiplication operation on arthematic operations
#inc salary by 10% for the emps who are working in 102 dept
select * from my_employee;
update my_employee set salary = salary*1.10 where DEP_ID = 90;
SET SQL_SAFE_UPDATES = 0;


#Assignment operators =,:= -- To assign a value and its used in dml commands, 
set @min_salary = 15000;
select @min_salary;
select * from my_employee where salary < @min_salary;
#:= can be used on set or select command also to assign
select @max_salary := 18700;
select * from my_employee where salary >@max_salary;
select @min_sales := 2000;
select * from superstore where sales >@min_sales;


#Bitwise Operators
select 2&3;
select 2|3;
select 2^3;
select 2<<3;	#x*2 power n -- 2*2 power 3 == 2*8 == 16
select 24>>3;	#x/2 power n -- 24/2 power 3 ==24/8 == 3


#std_id
	#1
    #2
    #3
    #4	select Std_id from students 
    #5	where (std_id & 2) = 2
    #6	where (std_id & 4) = 4
    
    
#std_id, std_name, course-id, email, phn_no, city
create table students(std_id tinyint, std_name varchar(30), course_id int, email varchar(30), ph_no int, city char(29));
INSERT INTO students
VALUES
(1, 'shyam', 101, NULL, 67869859, 'vjw'),
(2, NULL, NULL, 'abc@gmail.com', NULL, 'vskp'),
(3, 'sunder', 102, NULL, 6859685, 'Hyd'),
(4, 'srinu', NULL, 'srinu@gmail.com', 98486176, NULL),
(5, 'janardhan', 101, NULL, 78955820, 'BLR');
select * from students;
insert into students values(6, 'praveen', 102, null, null, 'hyd');



#null handling -- isnull(), ifnull(), coalesce()
select city, isnull(city) from students;
select email, isnull(email)n from students;
select std_name, ifnull(std_name, 'not provided') from students;
select phn_no, ifnull(phn_no, 'not provided') from students;

#find the first_contact of every student
select std_name, email, phn_no, coalesce(phn_no, email, 'not provided') as first_contact
from students;



