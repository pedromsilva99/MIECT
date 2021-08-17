ALTER PROCEDURE ComprarPeca (
	@ID VARCHAR(10),
	@npecas INT
	)
AS
SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		UPDATE Oficina_DB.Peca SET referencia = referencia, nome = nome, preco = preco , num_stock = num_stock + @npecas WHERE referencia = @ID;
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;
GO

