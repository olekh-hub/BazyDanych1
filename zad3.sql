WITH TempTable AS 
( SELECT Name, ProductCategoryID FROM AdventureWorksLT2022.SalesLT.ProductCategory ) 

SELECT TempTable.Name AS Category,SUM(LineTotal) AS SalesValue FROM TempTable
INNER JOIN SalesLT.Product ON Product.ProductCategoryID = TempTable.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail ON Product.ProductID = SalesLT.SalesOrderDetail.ProductID
GROUP BY TempTable.Name

