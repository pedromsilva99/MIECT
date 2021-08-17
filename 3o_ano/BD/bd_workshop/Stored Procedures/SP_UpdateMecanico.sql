USE p7g1;

GO

ALTER PROCEDURE UpdateMecanico (
    @nif INT,
	@telefone INT,
	@endereco VARCHAR(50),
	@nome VARCHAR(20),
	@apelido VARCHAR(50),
    @oficina INT,
    @salario MONEY,
    @especialidade VARCHAR(20)
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

		IF @salario<100000
		BEGIN
			UPDATE Oficina_DB.Funcionario SET
				n_oficina = @oficina,
				salario = @salario
		WHERE nif = @nif
		END
		ELSE
		BEGIN 
			UPDATE Oficina_DB.Funcionario SET
				n_oficina = @oficina
		END
		UPDATE Oficina_DB.Mecanico SET
			especialidade = @especialidade
		WHERE nif = @nif
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;