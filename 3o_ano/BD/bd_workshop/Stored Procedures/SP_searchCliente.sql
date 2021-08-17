
ALTER PROC searchCliente(
	@search VARCHAR(30)
	)
AS



SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;
		SELECT C.nif, C.parceiro, P.nome, P.apelido, P.endereco, P.telefone FROM Oficina_DB.Cliente AS C, Oficina_DB.Pessoa AS P WHERE P.nif=C.nif AND (P.nome LIKE '%'+@search+'%' OR P.apelido LIKE '%'+@search+'%')

	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO