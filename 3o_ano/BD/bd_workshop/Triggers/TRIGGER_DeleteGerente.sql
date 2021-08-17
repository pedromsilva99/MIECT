CREATE TRIGGER TRIGGER_DeleteGerente ON Oficina_DB.Gerente 
INSTEAD OF DELETE
AS


SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

        DECLARE @nif INT = (
            SELECT nif 
            FROM deleted
            );

        UPDATE Oficina_DB.Oficina SET
            gerente = NULL
        WHERE gerente = @nif;

        UPDATE Oficina_DB.Funcionario SET 
            n_oficina = NULL
        WHERE nif = @nif;

        DELETE FROM Oficina_DB.Veiculo WHERE dono = @nif;

        DELETE FROM Oficina_DB.Gerente WHERE nif = @nif;

    COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;


GO