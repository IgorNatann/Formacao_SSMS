-- Objetivo geral: criar o banco de dados dbVendas com arquivos fisicos separados para dados e log, controlando tamanho inicial, expansao e limite maximo.

-- Secao 1 - Informacoes do arquivo de dados (PRIMARY FILEGROUP).
CREATE DATABASE [dbVendas]
ON  PRIMARY (
    NAME = N'dbVendas',
    -- Caminho fisico do arquivo MDF (dados) apontando para a pasta de estudos do curso.
    FILENAME = N'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\ARQUIVO_DADOS\dbVendas.MDF',
    -- Tamanho inicial do arquivo de dados: 100 MB.
    SIZE = 100MB,
    -- Limite maximo permitido para crescimento automatico: 200 MB.
    MAXSIZE = 200MB,
    -- Incremento de crescimento quando o arquivo atingir a capacidade atual: 50 MB.
    FILEGROWTH = 50MB
)

-- Secao 2 - Informacoes do arquivo de log de transacoes.
LOG ON (
    NAME = N'dbVendasLOG',
    -- Caminho fisico do arquivo LDF (log) separado do MDF.
    FILENAME = N'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\LOG_TRANSACOES\dbVendasLOG.LDF',
    -- Tamanho inicial do log: 100 MB para acomodar o volume de transacoes esperado.
    SIZE = 100MB,
    -- Limite maximo para o crescimento do log: 200 MB.
    MAXSIZE = 200MB,
    -- Passo de expansao do log quando o limite atual for alcancado: 50 MB.
    FILEGROWTH = 50MB
);

-- Resumo: o script configura parametros de administracao (tamanho inicial, maximo e crescimento) alinhados a boas praticas de segregacao de arquivos de dados e log.
