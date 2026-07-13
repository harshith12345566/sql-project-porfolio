# 🛒 Retail Sales Analysis using PostgreSQL

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue?logo=postgresql)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

# 📖 Project Overview

This project demonstrates SQL skills by analyzing a retail sales dataset using PostgreSQL.

The project includes:

- Database Creation
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Business Problem Solving
- Business Insights

---

# 🎯 Objectives

- Create a Retail Sales Database
- Import CSV Data
- Clean Missing Values
- Explore Data
- Answer Business Questions using SQL

---

# 🛠 Tech Stack

- PostgreSQL
- pgAdmin 4
- SQL

---

# 🗃 Database Schema

```sql
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

---

# 📊 Data Exploration

## Total Number of Sales

```sql
SELECT COUNT(*)
FROM retail_sales;
```

---

## Total Customers

```sql
SELECT COUNT(DISTINCT customer_id)
FROM retail_sales;
```

---

## Product Categories

```sql
SELECT DISTINCT category
FROM retail_sales;
```

---

## Null Value Check

```sql
SELECT *
FROM retail_sales
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

# 📈 Business Problems

## Q1 Retrieve all sales made on 5-Nov-2022

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

---

## Q2 Clothing transactions with quantity greater than 10 during Nov-2022

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND quantity > 10
AND sale_date >= '2022-11-01'
AND sale_date < '2022-12-01';
```

---

## Q3 Total Sales for Each Category

```sql
SELECT
    category,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
```

---

## Q4 Average Age of Beauty Customers

```sql
SELECT
    AVG(age) AS average_age
FROM retail_sales
WHERE category='Beauty';
```

---

## Q5 High Value Transactions (>1000)

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

---

## Q6 Transactions by Gender and Category

```sql
SELECT
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
```

---

## Q7 Average Sale Per Month

```sql
SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY
    EXTRACT(YEAR FROM sale_date),
    EXTRACT(MONTH FROM sale_date)
ORDER BY year, month;
```

---

## Q8 Top 5 Customers by Total Sales

```sql
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

---

## Q9 Unique Customers in Each Category

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

---

## Q10 Orders by Shift

```sql
WITH shift_orders AS
(
SELECT *,
CASE
WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift
FROM retail_sales
)

SELECT
shift,
COUNT(*) AS number_of_orders
FROM shift_orders
GROUP BY shift;
```

---

# 💡 Key Insights

- Identified the highest revenue-generating product categories.
- Found the top five customers based on total sales.
- Analyzed customer purchasing patterns across different time shifts.
- Measured monthly sales trends.
- Explored customer demographics.
- Identified high-value transactions.

---

# 📚 SQL Skills Demonstrated

✅ Data Cleaning

✅ Filtering Data

✅ Aggregate Functions

✅ GROUP BY

✅ DISTINCT

✅ CASE Statements

✅ Common Table Expressions (CTEs)

✅ Date Functions

✅ Time Functions

✅ Business Analysis

---

# 📁 Project Structure

```
Retail-Sales-Analysis
│
├── dataset/
│     retail_sales.csv
│
├── queries.sql
│
├── screenshots/
│
└── README.md
```

---

# 🚀 Future Improvements

- SQL Views
- Stored Procedures
- Indexing
- Window Functions
- Power BI Dashboard
- Python + PostgreSQL Integration

---

# 👨‍💻 Author

**Harshith Nambur**

Computer Science (Data Science)

GitHub: https://github.com/harshith12345566
