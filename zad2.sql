WITH TempRevTable AS (
SELECT CONCAT( SalesLT.Customer.CompanyName, ' (', Customer.FirstName, ' ', Customer.LastName, ')' )
AS CompanyContact, 
SUM(SalesLT.SalesOrderDetail.UnitPrice * SalesLT.SalesOrderDetail.OrderQty) AS Revenue 
FROM SalesLT.SalesOrderDetail
JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN SalesLT.Customer ON Customer.CustomerID = SalesOrderHeader.CustomerID 
GROUP BY CompanyName,Customer.FirstName,Customer.LastName
) 

Select * FROM TempRevTable


--SELECT CONCAT(Customer.CompanyName, ' (', Customer.FirstName, ' ', Customer.LastName, ') ' ) AS CompanyContact, Revenue 
