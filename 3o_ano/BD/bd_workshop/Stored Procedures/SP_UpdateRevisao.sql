USE p7g1;

GO

ALTER PROCEDURE UpdateRevisao(
    @id INT,
    @preco MONEY,
    @oficina INT,
    @veiculo CHAR(6),
    @preco_final MONEY,
    @data_inic DATETIME,
    @data_conc DATETIME,
    @tipo VARCHAR(50),
	@mecanico INT
)
AS 

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		IF @preco<50000
		BEGIN
			UPDATE Oficina_DB.Servico 
			SET preco = @preco,
				oficina = @oficina,
				veiculo = @veiculo,
				preco_final = @preco_final,
				data_inic = @data_inic,
				data_conc = @data_conc
			WHERE id = @id
		END
		ELSE
		BEGIN
			UPDATE Oficina_DB.Servico 
				SET oficina = @oficina,
					veiculo = @veiculo,
					data_inic = @data_inic,
					data_conc = @data_conc
				WHERE id = @id
		END

		UPDATE Oficina_DB.Revisao 
		SET tipo = @tipo
		WHERE id = @id

		DECLARE @existe INT = (
			SELECT mecanico
			FROM Oficina_DB.Efetua 
			WHERE servico = @id
		)
		IF @existe <> NULL 
		BEGIN
			UPDATE Oficina_DB.Efetua 
			SET mecanico = @mecanico
			WHERE servico = @id
		END
		ELSE	
			INSERT INTO Oficina_DB.Efetua (mecanico, servico) VALUES (@mecanico, @id)

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;
