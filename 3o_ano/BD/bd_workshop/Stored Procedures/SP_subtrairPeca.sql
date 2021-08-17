use p7g1;
GO

ALTER PROCEDURE subtrairPeca (
	@ID VARCHAR(10),
	@numpecas INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		--IF Oficina_DB.Peca.num_stock>@numpecas
		--BEGIN
			UPDATE Oficina_DB.Peca 
			SET referencia = referencia, nome = nome, preco = preco , num_stock = num_stock - @numpecas
			WHERE referencia = @ID;
		--END
		SELECT * FROM Oficina_DB.Peca WHERE referencia = @ID;
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;
GO