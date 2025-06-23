show databases;
use project;
show tables;
select * from pizza_sales;

# Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales;
# 817860.04999993

# Avg. Order value
Select (sum(total_price)/ (count(distinct(order_id)))) as avg_value from pizza_sales;
# 38.30

# Total pizzas sold
select sum(quantity) as Total_pizzas_sold from pizza_sales;
# 49574

# Total Orders
select count(distinct(order_id)) as Total_Orders from pizza_sales;
# 21350

# Avg pizzas per order
Select sum(quantity) / count(distinct(order_id)) as Avg_pizzas_ordered from pizza_sales;
# 2

# Daily trend for orders
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date), DAYOFWEEK(order_date)
ORDER BY DAYOFWEEK(order_date);


# Monthly Trend for orders
SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date);

# Percentage of sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_revenue DESC;

# Percentage of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage DESC;

# Top 5 Best Sellers by Revenue
Select pizza_name, sum(total_price) as Total_Sales from pizza_sales
group by pizza_name 
order by Total_Sales desc limit 5;

# Top 5 worst sellers by Revenue
Select pizza_name, sum(total_price) as Total_Sales from pizza_sales
group by pizza_name 
order by Total_Sales asc limit 5;

# Top 5 Best Sellers by quantity
Select pizza_name, sum(quantity) as Total_Quantity_Sold from pizza_sales
group by pizza_name 
order by Total_Quantity_Sold desc limit 5;

# Top 5 worst Sellers by quantity
Select pizza_name, sum(quantity) as Total_Quantity_Sold from pizza_sales
group by pizza_name 
order by Total_Quantity_Sold asc limit 5;


# Top 5 Best Sellers by total orders
Select pizza_name, count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders desc limit 5;

# Top 5 worst Sellers by quantity
Select pizza_name, count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders asc limit 5;