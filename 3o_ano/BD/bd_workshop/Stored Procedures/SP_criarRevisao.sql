ALTER PROCEDURE newRevisao(
	--@id INT,
	@preco MONEY,
	@oficina INT,
	@veiculo CHAR(6),
	@data_in DATETIME,
	@data_out DATETIME,
	@tipo VARCHAR(50), 
	@mecanico INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		DECLARE @precofinal MONEY
		SET @precofinal = @preco*1.23

		SELECT * FROM Oficina_DB.Veiculo AS V, Oficina_DB.Cliente AS C WHERE matricula=@veiculo AND dono=nif AND parceiro = 'True';
		IF @@ROWCOUNT = 1
		BEGIN
			SET @precofinal = @precofinal * 0.9
		END;
		INSERT INTO Oficina_DB.Servico(preco, oficina, veiculo, preco_final, data_inic, data_conc) 
			VALUES (@preco, @oficina, @veiculo, @precofinal, @data_in, @data_out)

		DECLARE @id INT = (
			SELECT MAX(id) FROM Oficina_DB.Servico
		);

		INSERT INTO Oficina_DB.Revisao(id,tipo) VALUES (@id, @tipo)

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