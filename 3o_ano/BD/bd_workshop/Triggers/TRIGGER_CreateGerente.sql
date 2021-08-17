CREATE TRIGGER TRIGGER_CreateGerente ON Oficina_DB.Gerente 
AFTER INSERT
AS

SET NOCOUNT ON;
BEGIN TRY;
	BEGIN TRANSACTION;

        DECLARE @nif INT = (
                SELECT nif 
                FROM inserted
            );
            
        UPDATE Oficina_DB.Oficina SET
                gerente = @nif
				WHERE numero = (
					SELECT n_oficina
					FROM Oficina_DB.Gerente AS G JOIN Oficina_DB.Funcionario AS F ON G.nif=F.nif
					WHERE G.nif = @nif
				);

	COMMIT TRANSACTION;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION;
	RAISERROR('Inventory Transaction Error', 16, 1);
END CATCH;

GO