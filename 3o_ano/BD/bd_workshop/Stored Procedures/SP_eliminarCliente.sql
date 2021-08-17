use p7g1;
GO

ALTER PROCEDURE deleteCliente (
	@nif INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SET XACT_ABORT OFF
		DELETE Oficina_DB.Efetua FROM Oficina_DB.Efetua JOIN Oficina_DB.Servico ON servico = id JOIN Oficina_DB.Veiculo ON veiculo = matricula JOIN Oficina_DB.Cliente ON dono=nif WHERE nif=@nif;
		DELETE Oficina_DB.Revisao FROM Oficina_DB.Revisao JOIN Oficina_DB.Servico ON Revisao.id=Servico.id JOIN Oficina_DB.Veiculo ON veiculo = matricula JOIN Oficina_DB.Cliente ON dono=nif WHERE nif=@nif;
		DELETE Oficina_DB.Reparacao FROM Oficina_DB.Reparacao JOIN Oficina_DB.Servico ON Reparacao.id=Servico.id JOIN Oficina_DB.Veiculo ON veiculo = matricula JOIN Oficina_DB.Cliente ON dono=nif WHERE nif=@nif;
		DELETE Oficina_DB.Servico FROM Oficina_DB.Servico JOIN Oficina_DB.Veiculo ON veiculo = matricula JOIN Oficina_DB.Cliente ON dono=nif WHERE nif=@nif;
		DELETE Oficina_DB.Veiculo FROM Oficina_DB.Veiculo JOIN Oficina_DB.Cliente ON dono = nif WHERE nif=@nif;
		DELETE Oficina_DB.Cliente WHERE nif = @nif;

		SELECT * FROM Oficina_DB.Funcionario WHERE nif=@nif;

		if @@ROWCOUNT = 0 
		BEGIN
			DELETE Oficina_DB.Pessoa WHERE nif=@nif;
		END;
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO