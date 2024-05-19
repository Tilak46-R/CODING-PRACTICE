--Aggregate functions using windows (e.g. SUM, AVG, MAX, MIN, etc.)

select sum(sales) over(partition by region) as regiontotal,productname,sales
from regionsalesdata;

select avg(sales) over(partition by region) as regionavg,productname,sales
from regionsalesdata;

select max(sales) over(partition by region) as regionmax,productname,sales
from regionsalesdata;

SELECT COUNT(*) OVER (PARTITION BY Region) AS RegionCount, ProductName, Sales
FROM RegionSalesData;

--Partitioning data for window functions

select productname,sales,
sum(sales) over(partition by region) as regiontotal
from regionsalesdata;

select productname,sales,
sum(sales) over(partition by region, year) as regionyeartotal
from regionsalesdata;


SELECT ProductName, Sales,
       SUM(Sales) OVER (PARTITION BY Region ORDER BY Year) AS RegionTotalByYear
FROM RegionSalesData;

