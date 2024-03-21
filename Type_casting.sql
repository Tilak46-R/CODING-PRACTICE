--MATHEMATICAL FUNCTIONS

--1.ABSOLUTE FUNCTION

select abs(3.14) as absoulute

select abs(-5) as absoulute

select abs(0) as absoulute


--2.CEILING FUNCTION

SElect ceiling(5.51) as ceiling

SElect ceiling(5.49) as ceiling

select ceiling(5.05) as ceiling

--3.Floor FUNCTION

select floor(5.51) as floor 

select floor(5.49) as floor 

select floor(0.51) as floor 


--4. Round functions

select round(4.54565789,3) as round

select round(4.54565789,4) as round

select round(4.54565789,2) as round

select round(4.54565789,0) as round



--Type casting

select cast('123' as int)

select cast('12-02-24' as date)


select to_char(123,'123')

select TO_DATE('2022-04-01', 'YYYY-MM-DD')


SELECT TO_NUMBER('123.2378','999D999')

--other functions

select char_length('abcdef') as length

select sin(45) as sin_thetha

select power(4,2)

select power(15,3)

select mod(15,10)

select mod(15,5)

select mod(0,10)

select trunc(3.145678,2)


--Using CASE Statements to Perform Conditional Operations


CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE default_result
END


--PRACTICAL APPLICATIONS


CREATE TABLE Products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  product_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE Customers_new (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  customer_email VARCHAR(50),
  customer_phone VARCHAR(20)
);

CREATE TABLE Sales_new (
  sale_id SERIAL PRIMARY KEY,
  sale_date DATE NOT NULL,
  sale_quantity INTEGER NOT NULL,
  sale_price NUMERIC(10,2) NOT NULL,
  customer_id INTEGER REFERENCES Customers_new(customer_id),
  product_id INTEGER REFERENCES Products(product_id)
);

INSERT INTO Products (product_name, product_price) VALUES
  ('Product A',  9.99),
  ('Product B',  14.99),
  ('Product C',  19.99),
  ('Product D',  24.99);

INSERT INTO Customers_new (customer_name, customer_email, customer_phone) VALUES
  ('John Doe', 'johndoe@example.com', '123-456-7890'),
  ('Jane Smith', 'janesmith@example.com', '555-555-5555'),
  ('Bob Johnson', 'bobjohnson@example.com', NULL);

INSERT INTO Sales_new (sale_date, sale_quantity, sale_price, customer_id, product_id) VALUES
  ('2022-01-01', 2, 9.99, 1, 1),
  ('2022-01-02', 1, 14.99, 2, 2),
  ('2022-01-03', 3, 19.99, 3, 3),
  ('2022-01-04', 1, 24.99, 1, 4),
  ('2022-01-05', 2, 14.99, 2, 2),
  ('2022-01-06', 1, 9.99, 3, 1),
  ('2022-01-07', 4, 19.99, 1, 3),
  ('2022-01-08', 2, 24.99, 2, 4),
  ('2022-01-09', 1, 14.99, 3, 2),
  ('2022-01-10', 3, 9.99, 1, 1);



--What is the total revenue generated from sales transactions? 
(Use the ROUND() function to round the total revenue to 2 decimal places.)


select round(sum(s.sale_quantity * p.product_price),2) as total_sales
from sales_new as s
join products as p
on s.product_id=p.product_id


--What is the average price of all products? (Use the CEILING() function to round up the average price to the nearest integer.)

select ceiling(avg(product_price)) as average_price
from products;


--What is the maximum sale price for each product? (Use the MAX() function.)

select product_id,max(sale_price) as maximum_price
from sales_new as s
group by product_id
order by product_id asc;

--What is the total revenue generated from sales transactions for each customer?
(Use GROUP BY and ROUND() function to round the total revenue to 2 decimal places.)

select customer_id, round(sum(sale_quantity * sale_price),2) as total_revenue
from sales_new
group by customer_id;

--5.1. What is the total number of products sold to each customer? (Use GROUP BY and the SUM() function.)

select customer_id ,sum(sale_quantity) as total_quantity
from sales_new
group by customer_id;

--5.2. What is the customer name, email, and phone number for the customer who made the most purchases?
(Use GROUP BY, JOIN,  the MAX(), and Limit functions.)


SELECT
    c.customer_name,
    c.customer_email,
    c.customer_phone,
    MAX(purchase_count) AS "Max Purchases"
FROM
    customers_new c
JOIN (
    SELECT
        customer_id,
        COUNT(*) AS purchase_count
    FROM
        sales_new
    GROUP BY
        customer_id
) p ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id
ORDER BY
    "Max Purchases" DESC
LIMIT 1;


