
ALTER PROCEDURE deleteVeiculo (
	@matricula CHAR(6)
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SET XACT_ABORT OFF
		
		DELETE Oficina_DB.Efetua FROM Oficina_DB.Efetua JOIN Oficina_DB.Servico ON servico = id JOIN Oficina_DB.Veiculo ON veiculo = matricula WHERE matricula=@matricula;
		--DELETE Oficina_DB.Necessita FROM Oficina_DB.Necessita JOIN Oficina_DB.Reparacao ON reparacao=id JOIN Oficina_DB.Servico ON Reparacao.id=Servico.id JOIN Oficina_DB.Veiculo ON veiculo = matricula WHERE matricula=@matricula;
		DELETE Oficina_DB.Revisao FROM Oficina_DB.Revisao JOIN Oficina_DB.Servico ON Revisao.id=Servico.id JOIN Oficina_DB.Veiculo ON veiculo = matricula WHERE matricula=@matricula;
		DELETE Oficina_DB.Reparacao FROM Oficina_DB.Reparacao JOIN Oficina_DB.Servico ON Reparacao.id=Servico.id JOIN Oficina_DB.Veiculo ON veiculo = matricula WHERE matricula=@matricula;
		DELETE Oficina_DB.Servico FROM Oficina_DB.Servico JOIN Oficina_DB.Veiculo ON veiculo = matricula WHERE matricula=@matricula;
		DELETE Oficina_DB.Veiculo FROM Oficina_DB.Veiculo JOIN Oficina_DB.Cliente ON dono = nif WHERE matricula=@matricula;
		DELETE Oficina_DB.Veiculo FROM Oficina_DB.Veiculo JOIN Oficina_DB.Funcionario ON dono = nif WHERE matricula=@matricula;
	
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO