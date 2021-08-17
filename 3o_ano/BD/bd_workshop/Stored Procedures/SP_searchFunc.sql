ALTER PROC searchFunc(
	@search VARCHAR(30)
	)
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SELECT M.nif, M.especialidade, P.nome, P.apelido, P.endereco, P.telefone, F.salario, F.n_oficina FROM Oficina_DB.Mecanico AS M, Oficina_DB.Pessoa AS P, Oficina_DB.Funcionario AS F WHERE P.nif=M.nif and M.nif=F.nif AND (P.nome LIKE '%'+@search+'%' OR P.apelido LIKE '%'+@search+'%')

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO