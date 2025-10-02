-- =========================================
-- Aula 01 - Controlando a ordem das colunas no INSERT
-- Objetivo geral: entender por que precisamos listar as colunas ao inserir dados fora da ordem padrao.
-- Conceitos principais: INSERT sem lista de colunas, mensagem de erro, solucao com lista explicita.
-- =========================================

-- Bloco 1 | Exemplo que gera erro (mantido comentado).
-- Descomente as linhas abaixo se quiser reproduzir a mensagem de erro na pratica.
/*
INSERT INTO TABELA_PRODUTOS
VALUES
    ('5449310', 'Frescor do Verao - 350 ml - Limao', 'Lata', '350 ml', 2.45, 'Limao'),
    ('1078680', 'Frescor do Verao - 350 ml - Manga', 'Lata', '350 ml', 3.18, 'Manga');
*/

-- Bloco 2 | Solucao usando lista de colunas na ordem desejada.
-- Ao informar os campos explicitamente, cada valor cai na coluna correta mesmo fora da ordem original.
INSERT INTO TABELA_PRODUTOS
    (CODIGO_PRODUTO, NOME_PRODUTO, EMBALAGEM, TAMANHO, PRECO_LISTA, SABOR)
VALUES
    ('5449310', 'Frescor do Verao - 350 ml - Limao', 'Lata', '350 ml', 2.45, 'Limao'),
    ('1078680', 'Frescor do Verao - 350 ml - Manga', 'Lata', '350 ml', 3.18, 'Manga');

SELECT * FROM TABELA_PRODUTOS;     -- Verifique a carga correta
