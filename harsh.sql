--sql Retail sales Analysis -P1 
--data insertion
create table retail_sales
(
	transactions_id INT Primary key,
	sale_date Date,
	sale_time time,
	customer_id	INT,
	gender	Varchar(15),
	age INT, 
	category VARCHAR(15),	
	quantity INT,	
	price_per_unit INT,	
	cogs FLOAT,	
	total_sale FLOAT
);


--data cleaning
--
select * from retail_sales where 
transactions_id is null
or sale_date is null 
or sale_time is null or 
gender is null 
or age is null 
or category is null 
or quantity is null 
or price_per_unit is null 
or cogs is null 
or total_sale is null;

delete from retail_sales where
transactions_id is null
or sale_date is null 
or sale_time is null or 
gender is null 
or age is null 
or category is null 
or quantity is null 
or price_per_unit is null 
or cogs is null 
or total_sale is null;
--
--data exploration

--numder of sales
select count(*) as total_sales from retail_sales;
--number of customers
select count(customer_id) from retail_sales;
--number od distinct customers
select count(distinct customer_id)as total_customers from retail_sales;
--unique categories
select distinct category  from retail_sales;


--Data Analysis

-- Write an sql query to retrieve all columns for sales made on '2022-11-05'
select * 
from retail_sales 
where sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select *
from retail_sales
where category='Clothing'
and quantity>=4
and sale_date>='2022-11-01'
and sale_date<'2022-12-01';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select 
	category,
	sum(total_sale) as total_saless 
from retail_sales 
group by category ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
	avg(age) as average_age 
from retail_sales 
group by category 
having category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select 
	transactions_id 
from retail_sales 
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
	gender,
	category,
	count(transactions_id) as transactions 
from retail_sales 
group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month.
SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY
    EXTRACT(YEAR FROM sale_date),
    EXTRACT(MONTH FROM sale_date)
ORDER BY year, month;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select 
	customer_id,
	sum(total_sale) as total_sales 
from retail_sales 
group by customer_id 
order by total_sales desc 
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select 
	category,	
	count(distinct customer_id) as unique_customer 
from retail_sales 
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with shift_order as (
	select *,
		Case
			when extract(hour from sale_time)<12 THEN 'morning'
			when extract(hour from sale_time)between 12 and 17 then 'afternoon'
			else 'evening'
		end as shift
	from retail_sales
	)
select 
	shift,
	count(*) as number_orders 
from shift_order
group by shift
order by shift

