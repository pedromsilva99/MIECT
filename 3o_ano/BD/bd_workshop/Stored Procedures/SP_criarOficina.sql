ALTER PROCEDURE newOficina (
	--@numero INT,
	@telefone INT,
	@cidade VARCHAR(10),
	@email VARCHAR(30)
	--@gerente INT
	)
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

	INSERT INTO Oficina_DB.Oficina (telefone, cidade, email) VALUES (@telefone, @cidade, @email)

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO