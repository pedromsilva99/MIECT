ALTER PROCEDURE deleteFuncionario (
	@nif INT
	)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		SET XACT_ABORT OFF
		DELETE Oficina_DB.Efetua FROM Oficina_DB.Efetua JOIN Oficina_DB.Mecanico ON mecanico = nif JOIN Oficina_DB.Funcionario ON Mecanico.nif = Funcionario.nif WHERE Funcionario.nif=@nif;
		DELETE Oficina_DB.Mecanico FROM Oficina_DB.Mecanico JOIN Oficina_DB.Funcionario ON Mecanico.nif = Funcionario.nif WHERE Funcionario.nif = @nif;
		DELETE Oficina_DB.Gerente FROM Oficina_DB.Gerente JOIN Oficina_DB.Funcionario ON Gerente.nif = Funcionario.nif WHERE Funcionario.nif = @nif;
		DELETE Oficina_DB.Funcionario WHERE nif = @nif;

		SELECT * FROM Oficina_DB.Cliente WHERE nif=@nif;

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