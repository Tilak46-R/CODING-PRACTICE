create table Sales_datas(
ProductName varchar(20),
Sales int);

create table regionsalesdatas(
ProductName varchar(20),
Region varchar(20),
Sales int);

insert into Sales_datas values('Product A',100),
('Product B',250),
('Product C',100),
('Product D',400),
('Product E',150);


INSERT into regionsalesdatas values('Product A','Region 1',100),
('Product A','Region 2',200),
('Product A','Region 3',150),
('Product B','Region 1',50),
('Product B','Region 2',100),
('Product B','Region 3',75),
('Product C','Region 1',75),
('Product C','Region 2',125),
('Product C','Region 3',100);


select * from sales_datas;
SELECT ProductName, Sales, ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Rank
From Sales_datas;

SELECT  ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Rank,ProductName, Sales
From Sales_datas;

SELECT  RANK() OVER(ORDER BY Sales ASC) AS Rank,ProductName, Sales
From Sales_datas;

SELECT  DENSE_RANK() OVER(ORDER BY Sales ASC) AS Rank,ProductName, Sales
From Sales_datas;

SELECT NTILE(4) OVER (ORDER BY Sales DESC) AS Quartile, ProductName, Sales
FROM Sales_Datas;

SELECT PERCENT_RANK() OVER (ORDER BY Sales DESC) AS PercentRank, ProductName, Sales
FROM Sales_Datas;

select productname, sales, sum(sales) over(partition by region) as regiontotal
from regionsalesdatas;

select avg(sales) over(partition by region) as averagetotal, productname, sales
from regionsalesdatas;

select max(sales) over(partition by region) as averagetotal, productname, sales
from regionsalesdatas;

select min(sales) over(partition by region) as averagetotal, productname, sales
from regionsalesdatas;

select * from regionsalesdatas;

select productname, region,sum(sales) over(partition by region) as regiontotal
from regionsalesdatas;

select productname, region,avg(sales) over(partition by region) as regiontotal
from regionsalesdatas;

select productname, region,max(sales) over(partition by region) as regiontotal
from regionsalesdatas;

select productname, region,min(sales) over(partition by region) as regiontotal
from regionsalesdatas;

select productname, region,count(sales) over(partition by region) as regiontotal
from regionsalesdatas;


SELECT ProductName, Sales,
       ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Sales DESC) AS RowNum
FROM RegionSalesDatas;

select region, year, sales,
sum(sales) over(partition by region order by year) as regionyeartotal
from regionsalesdatas;

select * from
(SELECT ProductName, Sales,
       ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Sales DESC) AS rank
FROM RegionSalesDatas) as sorted_data
where rank = 2;


--complex queries using common table expressions

create table employees_new(
id int,
employee_name varchar(50),
salary int,
department_id int);

insert into employees_new values(1, 'john smith', 50000,1),
(2, 'jane doe ', 60000,2),
(3, 'bob johnson', 55000,1),
(4, 'sarah lee', 65000,3),
(5, 'tom nguyen', 70000,2);

create table departments(
name varchar(50),
department_id int);

insert into departments values('sales',1),
							  ('marketing',2),
							  ('operations',3),
							  ('IT',4),
							  ('accounting',5);
 
select * from employees_new
select * from departments

with dept_total_salary as 
(SELECT department_id, SUM(salary) AS total_salary
FROM employees_new
GROUP BY department_id)
select departments.name, dept_total_salary.total_salary / count(employees_new.id) as avg_salary
from departments
JOIN employees_new ON departments.department_id = employees_new.department_id
JOIN dept_total_salary ON departments.department_id = dept_total_salary.department_id
GROUP BY departments.name,dept_total_salary.total_salary


create table categories(
category_id int,
name varchar(50),
parent_id int);

insert into categories values(1,'Electronics',null),
(2,'Computers',1),
(3,'Laptops',2),
(4,'Desktops',2),
(5,'Mobiles',1),
(6,'Android',5),
(7,'IOS',5);

select * from categories

WITH RECURSIVE category_tree(category_id, name, parent_id, level) AS (
-- Base case: select all root categories
SELECT category_id, name, parent_id, 0 FROM categories WHERE parent_id IS NULL
UNION ALL

	

SELECT c.category_id, c.name, c.parent_id, ct.level + 1
FROM categories as c
JOIN category_tree ct ON c.parent_id = ct.category_id
)
SELECT * FROM category_tree;