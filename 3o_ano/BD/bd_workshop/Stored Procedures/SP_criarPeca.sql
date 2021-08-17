ALTER PROCEDURE newPeca (
	@referencia VARCHAR(10),
	@nome VARCHAR(30),
	@preco MONEY,
	@num_stock INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		INSERT INTO Oficina_DB.Peca (referencia, nome, preco, num_stock) VALUES (@referencia, @nome, @preco, @num_stock)
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO