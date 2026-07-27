CREATE DATABASE superstore_db;
USE superstore_db;
SHOW TABLES;
SELECT * FROM `sample - superstore`;
ALTER TABLE `sample - superstore`
RENAME  TO superstore;
SELECT * FROM superstore; #view the full database
DESCRIBE superstore; # shows all the column names and data types
SELECT COUNT(*) AS Total_Records #shows the total records from the table
FROM superstore;
SELECT 'Customer Name',Sales,Profit
FROM superstore;
SELECT * 
FROM superstore
WHERE Sales > 500; #shows sales greater than 500
SELECT * #multiple conditions
FROM superstore
WHERE Region = 'West'
AND Profit > 100;
SELECT 'Customer Name',Sales #Using the order by clause
FROM superstore
ORDER BY Sales DESC;
SELECT Category, #Group by
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;
SELECT Region, # Average Profit By Region
AVG(Profit) AS Average_Profit
FROM superstore
GROUP BY Region;
SELECT Segment, #Count Orders By Segment
COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Segment;
SELECT 'Product_Name', #Highest Product Profit
Profit
FROM superstore
ORDER BY Profit DESC
LIMIT 10;
SELECT State, # Stae wise Sales in descending manner
SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC;
SELECT SUM(Sales) AS Total_Sales #aggregate function total sales
FROM superstore;
SELECT AVG(Sales) AS Average_Sales#Avg_sales
FROM superstore;
SELECT max(Profit) AS Maximum_Profit #Maximum Profit
FROM superstore;
SELECT min(Profit) AS Maximum_Profit#Min PROFIT
FROM superstore;
SELECT SUM(Quantity) AS Total_Quantity #Total _Quantity
FROM superstore;
#subqueries
SELECT 'Product Name' ,Sales 
FROM superstore
WHERE Sales > 
(SELECT AVG(Sales)
FROM superstore);
SELECT 'Customer Name', Profit
FROM superstore
WHERE Profit >
(SELECT AVG(Profit)
FROM superstore);
SELECT *
FROM superstore
WHERE Sales=
(
SELECT MAX(Sales)
FROM superstore
);
#creating view
CREATE VIEW profitable_orders AS
SELECT 
'Order_ID',
'Customer_Name',
Sales,
Profit
FROM superstore
WHERE Profit > 100;
SELECT *
FROM profitable_orders;
#cretaing index
CREATE INDEX idx_customer
ON superstore(`Customer Name`);
SHOW INDEX FROM superstore;
#Joins
CREATE TABLE customers AS
SELECT DISTINCT
`Customer ID`,
`Customer Name`,
Segment,
Region
FROM superstore;
CREATE TABLE product AS
SELECT DISTINCT
`Product ID`,
`Product Name`,
Category,
`Sub-Category`
FROM superstore;
SELECT
s.`Order ID`,
c.`Customer Name`,
s.Sales
FROM superstore s
INNER JOIN customers c
ON s.`Customer ID` = c.`Customer ID`;
SELECT
s.`Order ID`,
c.`Customer Name`,
s.Sales
FROM superstore s
INNER JOIN customers c
ON s.`Customer ID` = c.`Customer ID`;
SELECT
c.`Customer Name`,
s.Sales
FROM customers c
LEFT JOIN superstore s
ON c.`Customer ID` = s.`Customer ID`;
SELECT
p.`Product Name`,
s.Sales
FROM products p
RIGHT JOIN superstore s
ON p.`Product ID` = s.`Product ID`;



