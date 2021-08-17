
ALTER PROCEDURE deleteServico (
	@id INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SET XACT_ABORT OFF
		
		DELETE Oficina_DB.Efetua FROM Oficina_DB.Efetua JOIN Oficina_DB.Servico ON servico = id WHERE id=@id;
		DELETE Oficina_DB.Revisao FROM Oficina_DB.Revisao JOIN Oficina_DB.Servico ON Revisao.id=Servico.id WHERE Servico.id=@id;
		DELETE Oficina_DB.Reparacao FROM Oficina_DB.Reparacao JOIN Oficina_DB.Servico ON Reparacao.id=Servico.id WHERE Servico.id=@id;
		DELETE Oficina_DB.Servico WHERE id=@id;
	
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO