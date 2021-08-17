USE p7g1;

GO

ALTER VIEW TotalOrdenados(oficina, ordenados) AS
    SELECT O.numero, Sum(F.salario)
    FROM Oficina_DB.Oficina AS O JOIN Oficina_DB.Funcionario AS F ON O.numero=F.n_oficina
    GROUP BY O.numero

GO 

SELECT * FROM TotalOrdenados;