WITH TempEmployeeInfo AS 
( SELECT [FirstName],[LastName],[BusinessEntityID] FROM AdventureWorks2022.Person.Person )

SELECT FirstName,LastName,TempEmployeeInfo.BusinessEntityID FROM TempEmployeeInfo 
INNER JOIN AdventureWorks2022.HumanResources.EmployeePayHistory ON 
AdventureWorks2022.HumanResources.EmployeePayHistory.BusinessEntityID = TempEmployeeInfo.BusinessEntityID
