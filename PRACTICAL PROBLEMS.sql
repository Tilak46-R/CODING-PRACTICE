
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers (id, name, email, city) VALUES
(1, 'John Smith', 'john.smith@example.com', 'New York'),
(2, 'Jane Doe', 'jane.doe@example.com', 'London'),
(3, 'John Smith', 'john.smith@example.com', 'Los Angeles'),
(4, 'Sarah Johnson', 'sarah.johnson@example.com', 'New York'),
(5, 'Jane Doe', 'jane.doe@example.com', 'New York');

--duplicates and its methods

--1. using count(*) and group by method
select name, email , count(*)
from customers
group by name, email
Having count(*) > 1;

--2. Using distinct method

select distinct name,email from customers;

--3. Using union 

select name from customers
union
select city from customers;




CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  amount DECIMAL(10, 2)
);

CREATE TABLE invoices (
  invoice_id INT PRIMARY KEY,
  customer_id INT,
  invoice_date DATE,
  amount DECIMAL(10, 2)
);




INSERT INTO orders VALUES (1, 1, '2022-01-01', 100.00);
INSERT INTO orders VALUES (2, 1, '2022-02-01', 200.00);
INSERT INTO orders VALUES (3, 2, '2022-03-01', 300.00);
INSERT INTO orders VALUES (4, 3, '2022-04-01', 400.00);

INSERT INTO invoices VALUES (1, 1, '2022-01-15', 50.00);
INSERT INTO invoices VALUES (2, 1, '2022-02-15', 75.00);
INSERT INTO invoices VALUES (3, 2, '2022-03-15', 100.00);
INSERT INTO invoices VALUES (4, 2, '2022-04-15', 125.00);
INSERT INTO invoices VALUES (5, 3, '2022-05-15', 150.00);



select * from customers;

select * from orders;

select * from invoices;

select order_id as transaction_id,customer_id,order_date as transaction_date,amount
from orders
union
SELECT invoice_id AS transaction_id, customer_id, invoice_date AS transaction_date, amount
FROM invoices
order by transaction_date asc;


SELECT order_id, customer_name, order_date, product_name, quantity, price
FROM sales_2019
UNION ALL
SELECT order_id, customer_name, order_date, product_name, quantity, price
FROM sales_2020;

--practical application

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary NUMERIC(8,2),
    manager_id INT
);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO departments (name, manager_id) VALUES
    ('Sales', 1),
    ('Marketing', 2),
    ('Finance', 3),
    ('IT', 4),
    ('Human Resources', 5);

INSERT INTO employees (name, dept_id, salary, manager_id) VALUES
    ('John', 1, 5000.00, 1),
    ('Mary', 1, 6000.00, 1),
    ('Joe', 2, 5500.00, 2),
    ('Sarah', 2, 6500.00, 2),
    ('Tom', 3, 7000.00, 3),
    ('Bob', 3, 8000.00, 3),
    ('Lisa', 4, 4500.00, 4),
    ('Mike', 4, 5500.00, 4),
    ('Jane', 5, 6000.00, 5),
    ('Alex', 5, 7000.00, 5),
    ('David', 1, 5000.00, 1),
    ('James', 1, 6000.00, 1),
    ('Karen', 2, 5500.00, 2),
    ('Rachel', 2, 6500.00, 2),
    ('Tim', 3, 7000.00, 3),
    ('Alice', 3, 8000.00, 3),
    ('Julie', 4, 4500.00, 4),
    ('Peter', 4, 5500.00, 4),
    ('Mark', 5, 6000.00, 5),
    ('Michelle', 5, 7000.00, 5);

select count(name) from employees

select max(salary) from employees

select min(salary) from employees

select avg(salary) from employees

select manager_id,count(*)
from employees
group by manager_id
order by manager_id desc;


select count(name),sum(salary) as total_salary
from employees
where manager_id = 5;

Questions: 
1.How many employees are working in each department?
2.Who are the managers of each department?
3.Who are the employees who are reporting to a specific manager?
4.Which department has the highest-paid employees?
5.1. What is the average salary of employees in each department?
5.2 Which employees are reporting to themselves (self-join)?





--1 Answer
SELECT dept_id, COUNT(*) as num_employees
FROM employees
GROUP BY dept_id;

--2.Answer
select d.name as department_name, e.name as manager
from departments as d
join employees as e
on d.manager_id=e.id;

--3.Answer

select e.name as employee_name, m.name as manager_name
from employees as e
join employees as m
on m.id=e.manager_id
where m.name = 'John';


--4.Answer

select d.name as department_name, max(salary) as maxium_salary
from employees as e
join departments as d
on d.id=e.dept_id
group by d.name;

