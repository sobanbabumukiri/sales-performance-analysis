-- MINI PROJECT TITLE: SALES PERFORMANCE ANALYSIS USING SQL
-- Objective: Analyze sales data to identify top regions, profitable categories, trends, and products.

-- STEP 0: Create SQL Table

CREATE DATABASE analyst_practice;
USE analyst_practice;

CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    region VARCHAR(20),
    city VARCHAR(30),
    category VARCHAR(30),
    product VARCHAR(30),
    sales INT,
    quantity INT,
    profit INT
);
INSERT INTO sales VALUES
(1001, '2023-01-05', 'South', 'Hyderabad', 'Electronics', 'Laptop', 55000, 1, 8000),
(1002, '2023-01-07', 'South', 'Bangalore', 'Furniture', 'Chair', 8000, 4, 1200),
(1003, '2023-01-10', 'West', 'Mumbai', 'Electronics', 'Mobile', 30000, 2, 5000),
(1004, '2023-01-12', 'North', 'Delhi', 'Office Supplies', 'Paper', 2000, 10, 300),
(1005, '2023-01-15', 'South', 'Chennai', 'Electronics', 'Tablet', 25000, 1, 4000),
(1006, '2023-01-18', 'West', 'Pune', 'Furniture', 'Table', 18000, 1, 2500),
(1007, '2023-01-20', 'East', 'Kolkata', 'Office Supplies', 'Pen', 1500, 20, 200),
(1008, '2023-01-22', 'North', 'Jaipur', 'Electronics', 'Headphones', 6000, 3, 900),
(1009, '2023-01-25', 'South', 'Hyderabad', 'Furniture', 'Sofa', 42000, 1, 6000),
(1010, '2023-01-28', 'West', 'Mumbai', 'Electronics', 'Laptop', 58000, 1, 8500),
(1011, '2023-02-02', 'East', 'Bhubaneswar', 'Office Supplies', 'File', 3000, 6, 500),
(1012, '2023-02-05', 'North', 'Delhi', 'Furniture', 'Desk', 22000, 1, 3200),
(1013, '2023-02-08', 'South', 'Bangalore', 'Electronics', 'Mobile', 28000, 2, 4500),
(1014, '2023-02-12', 'West', 'Pune', 'Office Supplies', 'Marker', 1800, 12, 250),
(1015, '2023-02-15', 'South', 'Chennai', 'Furniture', 'Bed', 50000, 1, 7000);

SELECT count(*) FROM sales;
SELECT * FROM sales; 

-- STEP 1: Business Question 1: Which region has the highest total sales?

SELECT region, SUM(sales) AS total_sales
FROM sales	
GROUP BY region
ORDER BY total_sales DESC;

-- Insight: South region has the highest total sales contribution.

-- STEP 2: Bussiness Question 2: Which category most profitable?

SELECT category, SUM(profit) as total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- Insight: Electronics category is the most profitable.

-- STEP 3: Bussiness Question 3: Monthly sales trend

SELECT 
	MONTH(order_date) AS month,
	SUM(sales) AS monthly_sales
    FROM sales
    GROUP BY MONTH(order_date)
    ORDER BY month;

-- -- Insight: Sales show steady growth across months.

-- STEP 4: Bussiness Question 4:  Top 5 Products by Sales

SELECT product, SUM(sales) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC
LIMIT 5;

-- Insight: Laptops and Mobiles contribute the most to revenue.

-- STEP 5: Bussiness question 5: Region-wise Profit

SELECT region, SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

-- Insight: South and West regions generate the highest profit.








