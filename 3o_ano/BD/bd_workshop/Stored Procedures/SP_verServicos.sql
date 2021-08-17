ALTER PROC seeServicos(
	@nif int
	)
AS



SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SELECT * FROM Oficina_DB.Servico AS S, Oficina_DB.Mecanico AS M, Oficina_DB.Efetua AS E WHERE M.nif=@nif AND E.mecanico = M.nif AND E.servico = S.id;

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	If @@ROWCOUNT = 0
		ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO