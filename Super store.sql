CREATE DATABASE super_store_db;
USE super_store_db;
SHOW TABLES;
DESCRIBE superstore;
SELECT * FROM superstore limit 5;

#1. What are the total sales and total profit of the Super Store?
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;

#2. What is the total sales and profit by product category?
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

#3. Which sub-categories are the most and least profitable? 
SELECT 
    `Sub-Category`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;



#4. How does sales and profit vary across customer segments?

SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;


#5. Which regions generate the highest and lowest profit?
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

#6. What are the top 10 most profitable products? #error
SELECT 
    `Product Name`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;


#7. How do high discounts (greater than 30%) impact profitability?
SELECT 
    Discount,
    SUM(Profit) AS Total_Profit
FROM superstore
WHERE Discount > 0.30
GROUP BY Discount
ORDER BY Discount;

#8. Which products are generating losses 
SELECT 
    `Product Name`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;


#9. What is the impact of returned orders on sales and profit?
SELECT 
    Returned,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Returned;

#10. What are the yearly sales and profit trends? # eror
SELECT 
    YEAR(`Order Date`) AS Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Year;









