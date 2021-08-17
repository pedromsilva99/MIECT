ALTER PROCEDURE newReparacao(
	--@id INT,
	@preco MONEY,
	@oficina INT,
	@veiculo CHAR(6),
	@datain DATETIME,
	@dataco DATETIME,
	@peca VARCHAR(10),
	@numpecas INT,
	@mecanico INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;	

		DECLARE @precofinal MONEY
		IF @peca <> '' OR @peca <> NULL
		BEGIN
			SET @precofinal = @preco*1.23 + (SELECT preco FROM Oficina_DB.Peca WHERE referencia = @peca) * @numpecas
		END
		ELSE 
			SET @precofinal = @preco*1.23


		SELECT * FROM Oficina_DB.Veiculo AS V, Oficina_DB.Cliente AS C WHERE matricula=@veiculo AND dono=nif AND parceiro = 'True';
		IF @@ROWCOUNT = 1
		BEGIN
			SET @precofinal = @precofinal * 0.9
		END;
		INSERT INTO Oficina_DB.Servico(preco, oficina, veiculo, preco_final, data_inic, data_conc) 
			VALUES (@preco, @oficina, @veiculo, @precofinal, @datain, @dataco)

		DECLARE @id INT = (
			SELECT MAX(id) FROM Oficina_DB.Servico
		);


		
		INSERT INTO Oficina_DB.Reparacao(id,peca, n_pecas) VALUES (@id, @peca, @numpecas)

		EXEC subtrairPeca @peca, @numpecas

		IF (@mecanico > 9999999) AND (@mecanico < 1000000000)
		BEGIN
			INSERT INTO Oficina_DB.Efetua(servico, mecanico) 
				VALUES (@id, @mecanico)
		END

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO