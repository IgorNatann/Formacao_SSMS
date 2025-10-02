-- =========================================
-- Desafio Aula 01 - Carga inicial de vendedores
-- Proposta: praticar INSERT com multiplas linhas em uma tabela de apoio.
-- Conceitos reforcados: lista de valores, tipos numericos, uso de SELECT final para validacao.
-- =========================================

INSERT INTO TABELA_VENDEDORES (MATRICULA, NOME_VENDEDOR, PERCENTUAL_COMISSAO)
VALUES
    ('00236', 'Claudia Morais', 8.3),
    ('00237', 'Marcela Ferreira', 9.1),
    ('00238', 'Marcio Almeida', 8.5),
    ('00239', 'Igor Natan', 10.9),
    ('00240', 'Ana Beatriz', 7.1);

SELECT * FROM TABELA_VENDEDORES;     -- Confirma se as novas matriculas foram gravadas
