USE p7g1;

GO

ALTER VIEW LucroOficina(oficina, n_servicos, lucro) AS
    SELECT O.numero, Count(*), Sum(preco)
    FROM Oficina_DB.Oficina AS O JOIN Oficina_DB.Servico AS S ON O.numero=S.oficina
    GROUP BY O.numero

GO

SELECT * FROM LucroOficina;