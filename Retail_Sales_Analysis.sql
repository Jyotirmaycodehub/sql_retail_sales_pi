-- SQL Retail Sales Analysis
create database sql_project_p1;
use sql_project_p1
create table retail_sales 
(
                transactions_id int primary key,
                sale_date date,
                sale_time time,
				customer_id	int,
				gender varchar(50),
				age	int,
                category varchar(50),	
                quantiy	int,
                price_per_unit float,	
                cogs  int,
                total_sale float
                );
-- see the first 10 rows                
select* from retail_sales
limit 10;

-- count the data
select 
count(*) 
from retail_sales;

-- Data cleaning
-- find the null values and delete it
select* from retail_sales
where 
transactions_id is null
or
sale_date is null
or 
sale_time is null
or 
customer_id is null
or 
gender is null
or 
age is null
or 
category is null
or 
quantiy is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

delete from retail_sales
WHERE
transactions_id is null
or
sale_date is null
or 
sale_time is null
or 
customer_id is null
or 
gender is null
or 
age is null
or 
category is null
or 
quantiy is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

-- Data Exploration
-- how many sales we have
select count(*) as total_sale from retail_sales

-- How many Unick costomer we have?

select count(distinct customer_id) as total_sale from retail_sales;

select count(distinct category) as total_sale from retail_sales; -- for number

select distinct category from retail_sales; -- Show the name

-- Data Analysis & Business Key problems

-- 1. Write a sql query to retrieve all colummes form sales made on 2022-11-05
select *
from retail_sales
where sale_date='2022-11-05';

-- 2.Write a sql query to retrieve all transactions where the catagory is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select *
from retail_sales
where category = 'Clothing'
and quantiy >= 4
and 
sale_date  >= '2022-11-01'
and sale_date < '2022-12-01'

-- Q.3.Write a sql query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale) as net_sale,count(*) as total_orders
from retail_sales
group by 1

-- Q.4.Write a sql quary to find the avarage age of customers who purchesed itams from the "Beauty" category ?
select category, round(avg(age),2) as avg_age
from retail_sales
where category = 'Beauty'

-- 5.Write a sql quary to find all transaction where the total_sale is greater then 1000 ?
select * from retail_sales
where total_sale > 1000

-- 6.Write a sql quary to find the total number of transaction ( transaction_id) made by each gender in each category.
select category, gender,count(*) as total_trans
from retail_sales
group by category,gender
order by 1

-- 7.Write a sql quary to calculate the average sale for each month. Find out best selling month in each year

select 
  year(sale_date),
  month(sale_date),
  avg(total_sale) as avg_sale
from retail_sales
group by 1,2 
order by 1,3 desc

-- 8.Write a sql query to find the top 5 customers based on the highest total sales
select customer_id,sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 desc
limit 5

-- 9.Write a sql quary to find the number of unique customers who purchased items from each category.
select category, count(distinct customer_id) as unique_customers
from retail_sales
group by category

-- 10.Write a sql query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17
select
  case
    when hour(sale_time) <= 12 then'Morning'
    when hour(sale_time)> 12 and hour (sale_time)<=17 then 'Afternoon'
    else 'Evening'
  end as shift,
  count(*) as number_0f_orders
from retail_sales
group by shift;
