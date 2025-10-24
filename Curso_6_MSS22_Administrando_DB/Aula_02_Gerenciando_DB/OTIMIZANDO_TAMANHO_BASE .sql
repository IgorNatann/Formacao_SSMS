-- Objetivo geral: demonstrar como liberar espaco nao utilizado do banco `dbVendas`
-- usando DBCC SHRINKDATABASE e validar rapidamente a quantidade de registros em `tb_nota`.

-- Seção 1 - Redução de arquivos: TRUNCATEONLY remove páginas livres do final dos arquivos,
-- sem mover dados, agilizando a operação (use com cautela em ambiente de produção).
DBCC SHRINKDATABASE ('dbVendas', TRUNCATEONLY);

-- Seção 2 - Consulta de verificação: garante que a operação não afetou o volume de dados esperado.
SELECT COUNT(*) AS TOTAL_NOTAS
FROM tb_nota;
