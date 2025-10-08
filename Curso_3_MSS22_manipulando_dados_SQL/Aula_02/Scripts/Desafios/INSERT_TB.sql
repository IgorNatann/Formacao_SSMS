-- ================================================================
-- Curso 3 | Aula 02 | Desafio de Insercao em TB_CLIENTES
-- Objetivo: registrar tres novos clientes simulando um lote de carga inicial
-- e reforcar atencao a tipos, formatos de data e flags de primeira compra.
-- ================================================================

-- Dados de referencia fornecidos pelo desafio
-- Cliente 1: CPF 1471156710 | Erica Carvalho | Bairro Jardins | Cidade Sao Paulo | Primeira compra = 0
-- Cliente 2: CPF 19290992743 | Fernando Cavalcante | Bairro Agua Santa | Cidade Rio de Janeiro | Primeira compra = 1
-- Cliente 3: CPF 2600586709 | Cesar Teixeira | Bairro Tijuca | Cidade Rio de Janeiro | Primeira compra = 0
-- Observacoes: utilize datas no formato ISO (YYYY-MM-DD) e mantenha limites/volumes como numeros.

INSERT INTO TB_CLIENTES (
    CPF,
    NOME,
    ENDERECO,
    BAIRRO,
    CIDADE,
    ESTADO,
    CEP,
    DATA_NASCIMENTO,
    IDADE,
    GENERO,
    LIMITE_CREDITO,
    VOLUME_COMPRA,
    PRIMEIRA_COMPRA
) VALUES
    -- Cliente 1: Erica Carvalho, sem segunda linha de endereco, limite alto
    ('1471156710', 'Erica Carvalho', 'R. Iriquitia', 'Jardins', 'Sao Paulo', 'SP', '80012212', '1990-09-01', 27, 'F', 170000, 24500, 0),
    -- Cliente 2: Fernando Cavalcante, primeira compra marcada como verdadeira (1)
    ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Agua Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M', 100000, 20000, 1),
    -- Cliente 3: Cesar Teixeira, enderecos no Rio de Janeiro, flag de primeira compra desligada (0)
    ('2600586709', 'Cesar Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '2000-03-12', 18, 'M', 120000, 22000, 0);
