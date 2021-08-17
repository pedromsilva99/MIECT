ALTER PROCEDURE deleteOficina (
    @oficina INT
)
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

		SET XACT_ABORT ON

        UPDATE Oficina_DB.Funcionario 
            SET n_oficina = NULL
        WHERE n_oficina = @oficina;

        DECLARE C CURSOR FAST_FORWARD
        FOR SELECT matricula
        FROM Oficina_DB.Veiculo 
        ORDER BY oficina;

        OPEN C;
        DECLARE @matricula CHAR(6);

        FETCH C INTO @matricula;
        EXEC deleteVeiculo @matricula;

		DELETE Oficina_DB.Efetua FROM Oficina_DB.Efetua JOIN Oficina_DB.Servico ON servico = id JOIN Oficina_DB.Oficina ON oficina=numero WHERE numero=@oficina;
		DELETE Oficina_DB.Revisao FROM Oficina_DB.Revisao JOIN Oficina_DB.Servico ON Revisao.id=Servico.id JOIN Oficina_DB.Oficina ON oficina=numero WHERE numero=@oficina;
		DELETE Oficina_DB.Reparacao FROM Oficina_DB.Reparacao JOIN Oficina_DB.Servico ON Reparacao.id=Servico.id JOIN Oficina_DB.Oficina ON oficina=numero WHERE numero=@oficina;
		DELETE Oficina_DB.Servico FROM Oficina_DB.Servico JOIN Oficina_DB.Oficina ON oficina=numero WHERE numero=@oficina;

		DELETE Oficina_DB.Veiculo FROM Oficina_DB.Veiculo JOIN Oficina_DB.Oficina ON  oficina=numero WHERE numero=@oficina

        DELETE Oficina_DB.Oficina 
        WHERE numero = @oficina;


	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO