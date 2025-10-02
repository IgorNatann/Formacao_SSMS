-- =========================================
-- Aula 01 - Inserindo registros de exemplo
-- Objetivo geral: praticar INSERT e observar diferencas entre cargas simples e multiplas.
-- Conceitos principais: INSERT INTO, multiplas linhas, caracteres especiais, conferencia com SELECT.
-- Sugestao: execute cada bloco e observe o resultado com o SELECT logo abaixo.
-- =========================================

USE SUCOS_VENDAS;

-- Bloco 1 | Inserir um unico produto.
-- Ideal para testar sintaxe e validar tipos de dados antes de uma carga maior.
INSERT INTO TABELA_PRODUTOS
VALUES ('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.99);

SELECT * FROM TABELA_PRODUTOS;     -- Visualiza o efeito do primeiro insert

-- Bloco 2 | Inserir varios produtos de uma vez.
-- Demonstra como enviar uma lista de registros usando a mesma estrutura de colunas.
INSERT INTO TABELA_PRODUTOS
VALUES
    ('10837797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
    ('1000889', 'Sabor da Montanha 700 ml Uva', 'Garrafa', '700 ml', 'Uva', 6.31),
    ('1004327', 'Videira do Campo 1,5 Litros Melancia', 'PET', '1,5 Litros', 'Melancia', 19.51),
    ('1088126', 'Linha Citrus 1 Litro Limao', 'PET', '1 Litro', 'Limao', 7.00);

SELECT * FROM TABELA_PRODUTOS;     -- Confirma insercoes em lote

-- Bloco 3 | Inserir clientes completas.
-- Mostra como tratar campos numericos, datas e valores booleanos (BIT) na mesma instrucao.
INSERT INTO TABELA_CLIENTES
VALUES
    ('00384393431', 'Joao da Silva', 'Rua Projetada A', 'Numero 233', 'Copacabana', 'RJ', '20000000', '1965-03-21', 57, 'M', 20000000, 3000.30, 1),
    ('00384393555', 'Maria Clara', 'Rua Projetada A', 'Numero 233', 'Copacabana', 'RJ', '20000000', '1975-03-21', 47, 'F', 200000, 3000.30, 0);

SELECT * FROM TABELA_CLIENTES;     -- Garante que os dois clientes foram gravados
