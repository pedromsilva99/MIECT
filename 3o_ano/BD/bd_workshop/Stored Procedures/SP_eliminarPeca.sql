ALTER PROCEDURE deletePeca (
	@ref VARCHAR(10)
	)
AS

--DECLARE @intservico TABLE (coluna INT);
--Declare @id INT; 

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		--SET XACT_ABORT OFF
		--SELECT @intservico = id FROM Oficina_DB.Reparacao WHERE pecas LIKE '%@ref%';
		--EXEC deleteServico @intservico;

		UPDATE Oficina_DB.Reparacao SET
			peca = NULL
		WHERE peca = @ref;

		DELETE Oficina_DB.Peca WHERE referencia=@ref;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO