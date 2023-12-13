/*Procedura*/

CREATE OR ALTER PROCEDURE dbo.PrintFibbonacciSeq (@n INT)
AS
BEGIN

    DECLARE @FibTable TABLE (nFib INT)

    INSERT INTO @FibTable
    SELECT nFib FROM dbo.FibbonacciSeq(@n);

    DECLARE @nFib INT;


    DECLARE FibCursor CURSOR FOR
    SELECT nFib FROM @FibTable;

    OPEN FibCursor;
	 i
    FETCH NEXT FROM FibCursor INTO @nFib;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @nFib;
        FETCH NEXT FROM FibCursor INTO @nFib;
    END

    CLOSE FibCursor;
    DEALLOCATE FibCursor;
END;

/*Funkcja*/
CREATE OR ALTER FUNCTION dbo.FibbonacciSeq (@n INT )
RETURNS @FibTable TABLE (nFib INT)
AS
BEGIN
	DECLARE @f1 INT = 0, @f2 INT = 1, @i INT = 1;

	WHILE @i <  @n
	BEGIN
		INSERT INTO @FibTable (nFib) VALUES (@f1);
		SET @f1 = @f1 + @f2;
		SET @f2 = @f1 - @f2;
		SET @i = @i + 1;
	END

	RETURN;
END;

/*trigger DML*/

CREATE OR ALTER TRIGGER TriggerUpperLastName
ON Person.Person /*Nie wiem dlaczego nie widzi tej tabeli*/
AFTER INSERT 
AS
BEGIN
	UPDATE Person.Person
		SET LastName = UPPER(Person.LastName)
		FROM inserted
		WHERE Person.BusinessEntityID = inserted.BusinessEntityID
END;

/*trigger wyswietlajacy blad*/
CREATE OR ALTER TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate /*Tu tez mam problem z odwolaniem*/
AFTER UPDATE 
AS
BEGIN
	IF UPDATE(TaxRate)
	BEGIN 
		DECLARE @OldTaxRate SMALLMONEY;
		DECLARE @NewTaxRate SMALLMONEY;

		SELECT @OldTaxRate = TaxRate FROM deleted;
		SELECT @NewTaxRate = TaxRate FROM inserted;

		IF @NewTaxRate > @OldTaxRate*1.3
		BEGIN
			RAISERROR('Tax rate cannot exceed 30%. Update rolled back.', 16, 1);
			ROLLBACK;
			RETURN;
		END;
	END;
END;