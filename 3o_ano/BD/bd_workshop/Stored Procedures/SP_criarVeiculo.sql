ALTER PROCEDURE newVeiculo (
	@matricula CHAR(6),
	@marca VARCHAR(20),
	@tipo INT,
	@dono INT,
	@oficina INT,
	@data_in DATETIME,
	@data_out DATETIME
	)
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		SET @data_in = convert(datetime, @data_in, 103)
		SET @data_out = convert(datetime, @data_out, 103)

		INSERT INTO Oficina_DB.Veiculo (matricula, marca, tipo, dono, oficina, data_in, data_out) 
			values (@matricula, @marca, @tipo, @dono, @oficina, @data_in, @data_out)

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO