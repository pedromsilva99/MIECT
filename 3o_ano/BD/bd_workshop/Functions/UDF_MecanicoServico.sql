CREATE FUNCTION Oficina_DB.MecanicoServico (@id INT) RETURNS INT
AS
BEGIN

DECLARE @nif INT;

SET @nif = (
    SELECT mecanico
    FROM Oficina_DB.Efetua
    WHERE servico = @id
)

RETURN @nif

END

GO