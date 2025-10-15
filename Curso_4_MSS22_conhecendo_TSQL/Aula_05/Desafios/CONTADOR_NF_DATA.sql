-- 📋 1. Cabecalho
-- 🧾 | Contador Diario de Notas Fiscais
-- Proposito: Registrar, em tabela auxiliar, quantas notas fiscais existem por dia dentro de um intervalo configurado.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 05 - Atividade 08 - Desafio 

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Recria TABELANOTAS e popula com o total de notas por data no intervalo definido.
-- Como funciona:
-- 1. Verifica e recria TABELANOTAS limpa.
-- 2. Define datas inicial e final do periodo analisado.
-- 3. Loop WHILE calcula o total diario na tabela NOTAS FISCAIS.
-- 4. Insere cada data e respectiva contagem em TABELANOTAS.
-- 5. Seleciona o resultado consolidado para revisao.
-- Entrada -> Saida: Datas em @DATAINICIAL/@DATAFINAL -> tabela TABELANOTAS com colunas DATA e NUMNOTAS.

-- 🔧 3. Componentes Principais
-- DDL condicional TABELANOTAS: garante recriacao idempotente antes da carga.
-- Variaveis de periodo: @DATAINICIAL e @DATAFINAL determinam o intervalo de analise.
-- Variavel acumuladora: @NUMNOTAS recebe a contagem diaria de notas fiscais.
-- Loop WHILE: percorre cada dia do intervalo, conta notas e insere o resultado.
-- Consulta final: retorna a tabela TABELANOTAS para analise ou exportacao.

-- 📦 4. Dependencias
-- Tabela [NOTAS FISCAIS]: origem dos registros contados por data.
-- Permissoes: DDL/DML para TABELANOTAS e SELECT em [NOTAS FISCAIS].
-- Configuracao manual: ajuste das variaveis de data conforme o periodo desejado.

-- ▶️ 5. Como Usar
-- Pre-requisitos: acesso a SQL Server com a tabela [NOTAS FISCAIS] e permissoes de escrita.
-- Execucao: ajuste @DATAINICIAL/@DATAFINAL e execute o script completo.
-- Exemplo pratico: defina um intervalo mensal para identificar dias sem emissao de notas.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: IF OBJECT_ID evita recriacao duplicada; fluxo WHILE mantem logica simples e legivel.
-- Performance: processamento linear por dia; considere tabela de calendario para periodos extensos.
-- Melhorias possiveis: transformar em stored procedure parametrizada; inserir indice em DATA se a tabela for reutilizada; substituir o loop por agrupamento direto quando suportado.

-- Vamos continuar evoluindo o script da resposta do primeiro exercicio desta aula? Para isso, inclua o dia e o numero de notas em uma tabela.
-- Segue o script do exercicio anterior:

IF OBJECT_ID('TABELANOTAS','U') IS NOT NULL
    DROP TABLE [TABELANOTAS];
CREATE TABLE TABELANOTAS
(
    DATA DATE,
    NUMNOTAS INT
);

DECLARE @DATAINICIAL DATE;
DECLARE @DATAFINAL DATE;
DECLARE @NUMNOTAS INT;

SET @DATAINICIAL = '20170101';
SET @DATAFINAL = '20170110';

WHILE @DATAINICIAL <= @DATAFINAL
BEGIN
    SELECT @NUMNOTAS = COUNT(*)
    FROM [NOTAS FISCAIS]
    WHERE DATA = @DATAINICIAL;

    INSERT INTO TABELANOTAS (DATA, NUMNOTAS)
    VALUES (@DATAINICIAL, @NUMNOTAS);

    SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL);
END;

SELECT *
FROM TABELANOTAS;
