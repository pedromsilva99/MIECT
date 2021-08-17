ALTER PROCEDURE updateVeiculo (
	@matricula CHAR(6),
	@marca VARCHAR(20),
	@dono INT,
	@oficina INT,
	@data_in DATETIME,
	@data_out DATETIME
	)
AS



SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		UPDATE Oficina_DB.Veiculo 
		set matricula = matricula, marca = @marca, dono = @dono, oficina = @oficina, data_in = @data_in, data_out = @data_out 
		where matricula = @matricula

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO