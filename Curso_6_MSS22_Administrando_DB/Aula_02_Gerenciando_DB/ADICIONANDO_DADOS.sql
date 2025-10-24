-- Objetivo geral: popular o banco `dbVendas` com novas notas fiscais usando procedures de carga diaria e mensal,
-- finalizando com uma validacao rapida do volume inserido em `tb_nota`.

-- Seção 1 - Carga diaria: executa a procedure `IncluiNotasDia` para tres datas consecutivas.
EXEC IncluiNotasDia '2022-01-01';
EXEC IncluiNotasDia '2022-01-02';
EXEC IncluiNotasDia '2022-01-03';

-- Seção 2 - Carga por intervalo: `cargaBase` recebe ano/mês inicial e final,
-- permitindo inserir notas de um periodo maior em uma unica chamada.
EXEC cargaBase 2022, 1, 2022, 2;

-- Seção 3 - Validação: confirma o total de registros presentes na tabela de notas.
SELECT COUNT(*) AS TOTAL_NOTAS
FROM tb_nota;
