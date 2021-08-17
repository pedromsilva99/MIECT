ALTER PROCEDURE newGerentePerson (
	@nif INT,
	@telefone INT,
	@endereco VARCHAR(50),
	@nome VARCHAR(20),
	@apelido VARCHAR(50),
	@salario MONEY,
	@noficina INT,
	@bonus MONEY
	)
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		--SELECT * FROM Oficina_DB.Pessoa WHERE nif=@nif

		IF @@ROWCOUNT = 0
		BEGIN
			INSERT INTO Oficina_DB.Pessoa (nif, telefone, endereco, nome, apelido) values (@nif, @telefone, @endereco, @nome, @apelido)
		END; 

		INSERT INTO Oficina_DB.Funcionario(nif, salario, n_oficina) VALUES (@nif, @salario, @noficina)
		INSERT INTO Oficina_DB.Gerente(nif, bonus) VALUES (@nif, @bonus)

	COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO
