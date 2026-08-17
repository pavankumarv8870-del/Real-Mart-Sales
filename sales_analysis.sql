CREATE DATABASE Real_Mart;     #Data Base

USE Real_Mart;  #To activate DB

SELECT * FROM sales;    #To Retrieve Data

SHOW TABLES;   #To Find Tables

#Unique cities
SELECT DISTINCT City   
FROM sales;

#Unique Product Lines
SELECT DISTINCT Product_Line
FROM sales;

#Total sales transactions
SELECT COUNT(*) AS Total_Transactions
FROM sales;

#Total revenue by transactions
SELECT SUM(Total) AS Total_Revenue
FROM sales;

#AVG sales by transactions
SELECT AVG(Total) AS AVG_Transactions
FROM sales;

#Total Sales By City 
SELECT City,
SUM(Total)
FROM sales
GROUP BY City;

#Total sales by Gender
SELECT Gender,
SUM(Total)
FROM sales
GROUP BY Gender;

#Total Sales By Branch 
SELECT Branch,
SUM(Total)
FROM sales
GROUP BY Branch;

#Total Sales By Payment 
SELECT Payment,
SUM(Total)
FROM sales
GROUP BY Payment;

#Total AVG Sales By Product Line
SELECT Product_Line,
AVG(Total)
FROM sales
GROUP BY Product_Line
ORDER BY AVG(Total) DESC;

#Total AVG Unit_Price By Product Line
SELECT Product_Line, Unit_Price
FROM sales
WHERE Unit_Price > (SELECT AVG(Unit_Price) FROM sales);

#Highest Total sales By City
SELECT * FROM sales
WHERE City = ( 
SELECT City
FROM sales
GROUP BY City
ORDER BY SUM(Total) DESC
LIMIT 1
);
