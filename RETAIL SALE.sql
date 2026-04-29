use don;
#CREATE TABLE
CREATE TABLE RETAIL_SALE
                  ( transactions_id INT primary KEY,
                  sale_date DATE,
                  sale_time TIME,
                  customer_id INT,
                  gender varchar(20),
                  age INT,
                  category VARCHAR(40),
                  quantiy INT,
                  price_per_unit FLOAT,
                  cogs FLOAT,
                  total_sale INT);
 SELECT * FROM RETAIL_SALE;
 
 #LIMIT FUNCTION
 
 SELECT * FROM RETAIL_SALE LIMIT 10;
 
-- HOW MANY
 
 SELECT COUNT(*) FROM RETAIL_SALE;
Select * FROM RETAIL_SALE LIMIT 2;

--- USE THE  IS NULL ROWS

SELECT * FROM RETAIL_SALE
WHERE transactions_id IS NULL;

---- USE THE NULL ROWS

SELECT * FROM RETAIL_SALE
WHERE sale_ti IS NULL;

SELECT * 
FROM RETAIL_SALE
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
 ---- data no have null values
 
 ----- how many sales we have?
 
 select count(*) as total_sale from retail_Sale;
 
 --- how many unique customer we have?
 
 SELECT COUNT(DISTINCT CUSTOMER_ID) AS TOTAL_SALE FROM RETAIL_SALE;
 
 --- how many unique customer we have?
 
 SELECT COUNT(distinct CATEGORY) AS TOTAL_SALE FROM RETAIL_SALE;
 
 SELECT DISTINCT CATEGORY FROM RETAIL_SALE;
 
 --- Data analysis & Business key problem & Answers
--- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT *
FROM retail_sale
WHERE sale_date
='2022-11-05';

-- these are uniqu date

SELECT  sale_date from retail_sale limit 5;


-- How many row this date
SELECT  count(*) FROM retail_sale
where sale_date
=
'2022-11-05';
SELECT * 
from retail_sale 
where sale_date="2022-01-06";


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT *
FROM 
retail_sale 
where category='Clothing';


SELECT SUM(quantiy)
FROM retail_sale
WHERE sale_date = '2022-11-05';

SELECT SUM(quantiy)
FROM retail_sale
WHERE  category = 'Beauty' 
and 
quantiy<10 
and 
sale_date='2022-11-14';
;
 
 -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 
 SELECT 
    category,
    SUM(total_sale) AS NET_SALE,
    COUNT(*) AS TOTAL_ORDERS
FROM retail_sale
GROUP BY category;


select 
category, 
SUM(total_sale) AS NET_SALE, COUNT(*)
 AS TOTAL_ORDERS FROM RETAIL_SALE GROUP BY CATEGORY;
select 
category, 
SUM(total_sale) AS NET_SALE, COUNT(*)
 AS TOTAL_ORDERS FROM RETAIL_SALE GROUP BY CATEGORY;
 
-- ANY OTHER Method
select 
gender, SUM(total_sale) AS NET_SALE, COUNT(*)
 AS TOTAL_ORDERS FROM RETAIL_SALE GROUP BY gender;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- FIRST
select ROUND(avg(AGE), 2) AS AVG_AGE FROM RETAIL_SALE 
WHERE CATEGORY="Beauty";
-- SECOND
SELECT AVG(AGE) FROM RETAIL_SALE  WHERE CATEGORY="Beauty";


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select transactions_id from retail_sale where total_sale >=1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select 
category, gender, count(*) AS total_trans
FROM RETAIL_SALE GROUP BY category , gender;


-- 
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select extract(year from sale_date) as year, 
extract(month from sale_date) as year,
sum(total_sale) as  avg_total_sale from retail_sale group by 1,2
order by 1,2;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select  customer_id,
sum(total_sale) 
as total_sales 
from retail_sale group by 
1 order by
1 asc	
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category,count(distinct customer_id) from retail_sales group by category;