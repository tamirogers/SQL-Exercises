--Exercise 1, Return all category names with their descriptions from the Categories table.

SELECT CategoryName, Description FROM Categories


--#2 Return the contact name, customer id, and company name of all Customers in London


SELECT ContactName, CustomerID, CompanyName, City
FROM Customers
WHERE city = 'London'


-- #3Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number


SELECT * FROM [dbo].[Suppliers]
	WHERE  [ContactTitle] IN ('Sales Representative', 'Marketing Manager') and Fax IS NOT NULL



--#4 Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.

SELECT CustomerID, RequiredDate, Freight
 FROM Orders
 WHERE RequiredDate between 'Jan 1 1997' and 'Jan 1 1998' and Freight < 100


 --#5 Return a list of company names and contact names of 
--all the Owners from the Customer table from Mexico, Sweden and Germany.

SELECT [CompanyName], [ContactName], [Country]
FROM [dbo].[Customers]
WHERE [Country] IN ('Mexico', 'Germany', 'Sweden')


--#6 Return a count of the number of discontinued 
--products in the Products table.


SELECT COUNT (Discontinued) FROM [dbo].[Products];


--#7 Return a list of category names and descriptions 
--of all categories beginning with 'Co' from the Categories table.

SELECT [CategoryName], [Description]
FROM [dbo].[Categories]
WHERE  [CategoryName] LIKE 'Co%'



--#8 Return all the company names, city, country and postal code 
--from the Suppliers table with the word 'rue' in their 
--address. The list should ordered alphabetically by company name.

SELECT [CompanyName], [City], [Country], [PostalCode],  [Address]
FROM [dbo].[Suppliers]
WHERE [Address] LIKE '%rue%'
ORDER BY [CompanyName]


--#9 Return the product id and the total quantities ordered 
--for each product id in the Order Details table.

SELECT [ProductID], [Quantity]
FROM [dbo].[Order Details] 


--#10 Return the customer name and customer address of all 
--customers with orders that shipped using Speedy Express.

SELECT o.ContactName, o.Address
FROM Customers o, Shippers s
WHERE s.CompanyName = 'Speedy Express'


--#11 Return a list of Suppliers containing company name, contact name, 
--contact title and region description.

SELECT [CompanyName], [ContactName], [ContactTitle],[Region]
FROM [dbo].[Suppliers]



--#12 Return all product names from the Products table 
--that are condiments.

SELECT g.ProductName, c.CategoryName
FROM Products g, Categories c
WHERE [CategoryName] = 'condiments'




--#13 Return a list of customer names who have no orders 
--in the Orders table.

SELECT n.ContactName
FROM Customers n 
LEFT JOIN Orders o
ON n.CustomerID =  o.CustomerID 
WHERE o.CustomerID IS null


--#14 Add a shipper named 'Amazon' to the 
--Shippers table using SQL.

INSERT INTO [dbo].[Shippers] ([CompanyName])
VALUES ('Amazon');



--#15 Change the company name from 'Amazon' to 'Amazon Prime Shipping' 
--in the Shippers table using SQL.

UPDATE [dbo].[Shippers]
SET [CompanyName]= 'Amazon Prime Shipping'
WHERE  [CompanyName] = 'Amazon'  



--#16 Return a complete list of company names from the Shippers table. 
--Include freight totals rounded to the nearest whole number for each 
--shipper from the Orders table for those shippers with orders.

SELECT c.CompanyName, ROUND(f.Freight,0) AS RoundedPrice, f.ShipVia
FROM Shippers c, Orders f
WHERE c.ShipperID =  f.ShipVia




--#17 Return all employee first and last names from the Employees 
--table by combining the 2 columns aliased as 'DisplayName'. 
--The combined format should be 'LastName, FirstName'.


SELECT concat([LastName], ', ',[FirstName]) AS 'DisplayName'
FROM [dbo].[Employees]




--#18 Add yourself to the Customers table with an order 
--for 'Grandma's Boysenberry Spread'.


INSERT INTO [dbo].[Customers] ([CustomerID],[ContactName],[CompanyName] )
VALUES ('TR16M', 'Tami', 'Disco Dancing');

INSERT INTO [dbo].[Orders] ([CustomerID])
VALUES (@@IDENTITY) 

DECLARE @ProductID int
SELECT @ProductID = ProductID 
from products 
where ProductName = 'Grandma''s Boysenberry Spread'

INSERT INTO [Order Details] (OrderID, ProductID)
VALUES (@@IDENTITY,@ProductID)




--#19 Remove yourself and your order from the database.

DELETE FROM [dbo].[Customers]
WHERE [ContactName]='Tami'AND [CompanyName] = 'Disco Dancing' AND [CustomerID]= 'TR16M'
DELETE FROM [dbo].[Orders]
WHERE [CustomerID]= 'TR16M' 
DELETE FROM [dbo].[Products]
WHERE [ProductName] = 'Grandma''s Boysenberry Spread'
DELETE FROM [dbo].[Order Details]
WHERE [OrderID] = 'TR16M' 



--#20 Return a list of products from the Products table 
--along with the total units in stock for each product. Include only 
--products with TotalUnits greater than 100.

SELECT [ProductName],[UnitsInStock]
FROM [dbo].[Products]
WHERE [UnitsInStock] > 100




