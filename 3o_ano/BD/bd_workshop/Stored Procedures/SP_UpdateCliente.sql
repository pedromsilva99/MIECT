USE p7g1;

GO

ALTER PROCEDURE UpdateCliente (
    @nif INT,
	@telefone INT,
	@endereco VARCHAR(50),
	@nome VARCHAR(20),
	@apelido VARCHAR(50),
    @parceiro BIT
)
AS 


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		UPDATE Oficina_DB.Pessoa SET 
			telefone = @telefone,
			endereco = @endereco,
			nome = @nome,
			apelido = @apelido
		WHERE nif = @nif

		UPDATE Oficina_DB.Cliente SET   
			parceiro = @parceiro
		WHERE nif = @nif
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;