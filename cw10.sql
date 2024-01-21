USE AdventureWorks2022

--1)
BEGIN TRANSACTION 
UPDATE Production.Product 
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680
COMMIT;

--2)
BEGIN TRANSACTION
DELETE FROM Production.Product
WHERE ProductID = 707	
ROLLBACK;

--3)
BEGIN TRANSACTION 
INSERT INTO AdventureWorks2022.Production.Product (Name,ProductNumber,SafetyStockLevel,ReorderPoint,StandardCost,
ListPrice,DaysToManufacture,SellStartDate,rowguid,SellEndDate)
VALUES ('RZEZUCHA','RZ-1234',1,1,12.11,11.12,111,'2020-11-11 00:00:00',NEWID(),'2020-11-11 00:00:00')
COMMIT;

--4)
--BEGIN TRANSACTION
--UPDATE Production.Product

--SET @maxCost = 50000
--DECLARE @maxCost INT 
--SELECT @sum = SUM(StandardCost) FROM Production.Product
--IF @maxCost >= ( SELECT StandardCost*1.1 FROM Production.Product )
--BEGIN
	--UPDATE AdventureWorks2022.Production.Product
	--SET StandardCost = StandardCost*1.1
	--COMMIT;
--END 
--ELSE 
--	ROLLBACK

--4)
USE AdventureWorks2022
BEGIN TRANSACTION
UPDATE Production.Product
SET StandardCost = StandardCost * 1.1 
IF((SELECT SUM(StandardCost) FROM Production.Product) <= 5000)
BEGIN
COMMIT;
END 
ELSE 
BEGIN
	ROLLBACK;
END

--5)
USE AdventureWorks2022
BEGIN TRANSACTION 
DROP INDEX Production.Product.AK_Product_ProductNumber 
DROP INDEX Production.Product.AK_Product_Name 
IF (SELECT COUNT(*) FROM Production.Product 
WHERE ( Name = 'MARCHEWKA' AND ProductNumber = 'RZ-1234' AND SafetyStockLevel = 1 AND ReorderPoint = 1 AND StandardCost = 12.11
AND ListPrice = 11.12 AND DaysToManufacture = 111 AND SellStartDate = '2020-11-11 00:00:00' AND rowguid = NEWID() AND SellEndDate = '2020-11-11 00:00:00'))
= 0
BEGIN 
INSERT INTO AdventureWorks2022.Production.Product (Name,ProductNumber,SafetyStockLevel,ReorderPoint,StandardCost,
ListPrice,DaysToManufacture,SellStartDate,rowguid,SellEndDate)
VALUES ('MARCHEWKA','RZ-1234',1,1,12.11,11.12,111,'2020-11-11 00:00:00',NEWID(),'2020-11-11 00:00:00')
COMMIT
END 
ELSE 
BEGIN
ROLLBACK
END

--6)
USE AdventureWorks2022
BEGIN TRANSACTION
ALTER TABLE Sales.SalesOrderDetail
DROP CONSTRAINT CK_SalesOrderDetail_OrderQty
UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 100 WHERE OrderQty > 0
IF EXISTS ( SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
BEGIN
ROLLBACK
END
ELSE
BEGIN
COMMIT
END

--7)
USE AdventureWorks2022
BEGIN TRANSACTION;
SELECT StandardCost FROM Production.Product
DECLARE @ilosc INT
SELECT @ilosc = @@ROWCOUNT FROM Production.Product
DELETE FROM Production.Product
WHERE StandardCost > ( SELECT AVG(Product.StandardCost) FROM Production.Product )

SELECT StandardCost FROM Production.Product
DECLARE @nowailosc INT
SELECT @nowailosc = @@ROWCOUNT FROM Production.Product

IF ( @ilosc - @nowailosc > 10 )
BEGIN 
ROLLBACK TRANSACTION;
END

ELSE
BEGIN
COMMIT TRANSACTION;
END;


























