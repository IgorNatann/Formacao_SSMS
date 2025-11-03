-- Tempo de execução atual da consulta (02:49 minutos) 
-- Custo Estimado de (1670,92)

DECLARE @ESTE_MES INT DECLARE @ESTADO VARCHAR(2)
SET @ESTE_MES = 3
SET @ESTADO = 'RJ'
SELECT VENDAS.classificacao AS CLASSIFICACAO,
       ROUND(VENDAS.VALOR_MES, 2) AS VALOR,
       ROUND((VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100, 2) AS PERCENTUAL
FROM
  (SELECT SUM(tb_item.quantidade * tb_item.preco) AS VALOR_TOTAL
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO) TOTAL,

  (SELECT tb_classificacao.classificacao AS CLASSIFICACAO,
          SUM(tb_item.quantidade * tb_item.preco) AS VALOR_MES
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_produto ON tb_item.codigo_produto = tb_produto.codigo_produto
   INNER JOIN tb_classificacao ON tb_produto.codigo_classificacao = tb_classificacao.codigo_classificacao
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO
   GROUP BY tb_classificacao.classificacao) VENDAS
ORDER BY (VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100 DESC

-- Criando Primeiro Index para otimização de busca.
CREATE NONCLUSTERED  INDEX idx_tb_item_codigo_produto ON tb_item (codigo_produto) INCLUDE (numero, quantidade, preco);

-- Validação de Consulta após, criação do Index.

-- Após criação dos primeiros INDEX, o tempo de resposta da consulta e o custo permaneceram praticamente iguais.
-- Tempo de execução atual da consulta (02:48 minutos) 
-- Custo Estimado de (1670,92)

DECLARE @ESTE_MES INT DECLARE @ESTADO VARCHAR(2)
SET @ESTE_MES = 3
SET @ESTADO = 'RJ'
SELECT VENDAS.classificacao AS CLASSIFICACAO,
       ROUND(VENDAS.VALOR_MES, 2) AS VALOR,
       ROUND((VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100, 2) AS PERCENTUAL
FROM
  (SELECT SUM(tb_item.quantidade * tb_item.preco) AS VALOR_TOTAL
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO) TOTAL,

  (SELECT tb_classificacao.classificacao AS CLASSIFICACAO,
          SUM(tb_item.quantidade * tb_item.preco) AS VALOR_MES
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_produto ON tb_item.codigo_produto = tb_produto.codigo_produto
   INNER JOIN tb_classificacao ON tb_produto.codigo_classificacao = tb_classificacao.codigo_classificacao
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO
   GROUP BY tb_classificacao.classificacao) VENDAS
ORDER BY (VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100 DESC

-- Criando Segundo Index para otimização de busca.
CREATE NONCLUSTERED INDEX idx_tb_item_numero ON tb_item (numero) INCLUDE (quantidade, preco);


-- Após criação do segundo INDEX, o tempo de resposta da consulta e o custo melhoraram significativamente.
-- Tempo de execução atual da consulta (00:06 segundos) 
-- Custo Estimado de (640,774)

DECLARE @ESTE_MES INT DECLARE @ESTADO VARCHAR(2)
SET @ESTE_MES = 3
SET @ESTADO = 'RJ'
SELECT VENDAS.classificacao AS CLASSIFICACAO,
       ROUND(VENDAS.VALOR_MES, 2) AS VALOR,
       ROUND((VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100, 2) AS PERCENTUAL
FROM
  (SELECT SUM(tb_item.quantidade * tb_item.preco) AS VALOR_TOTAL
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO) TOTAL,

  (SELECT tb_classificacao.classificacao AS CLASSIFICACAO,
          SUM(tb_item.quantidade * tb_item.preco) AS VALOR_MES
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_produto ON tb_item.codigo_produto = tb_produto.codigo_produto
   INNER JOIN tb_classificacao ON tb_produto.codigo_classificacao = tb_classificacao.codigo_classificacao
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO
   GROUP BY tb_classificacao.classificacao) VENDAS
ORDER BY (VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100 DESC


-- Criando PK para melhorar ainda mais desempenho da consulta
ALTER TABLE tb_cidade ADD CONSTRAINT pk_tb_cidade PRIMARY KEY (cidade);
ALTER TABLE tb_classificacao ADD CONSTRAINT pk_tb_classificacao  PRIMARY KEY (codigo_classificacao);
ALTER TABLE tb_cliente ADD CONSTRAINT pk_tb_cliente  PRIMARY KEY (cpf);
ALTER TABLE tb_estado ADD CONSTRAINT pk_tb_estado  PRIMARY KEY (sigla_estado);
ALTER TABLE tb_loja ADD CONSTRAINT pk_tb_loja  PRIMARY KEY (codigo_loja);
ALTER TABLE tb_produto ADD CONSTRAINT pk_tb_produto  PRIMARY KEY (codigo_produto);
ALTER TABLE tb_nota ADD CONSTRAINT pk_tb_nota PRIMARY KEY (numero);
ALTER TABLE tb_item ADD CONSTRAINT pk_tb_item PRIMARY KEY (numero, codigo_produto);

-- Após criação do segundo INDEX, Criação de PK's, o tempo de resposta da consulta e o custo melhoraram significativamente.
-- Tempo de execução atual da consulta (00:03 segundos) 
-- Custo Estimado de (641,774)

DECLARE @ESTE_MES INT DECLARE @ESTADO VARCHAR(2)
SET @ESTE_MES = 3
SET @ESTADO = 'RJ'
SELECT VENDAS.classificacao AS CLASSIFICACAO,
       ROUND(VENDAS.VALOR_MES, 2) AS VALOR,
       ROUND((VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100, 2) AS PERCENTUAL
FROM
  (SELECT SUM(tb_item.quantidade * tb_item.preco) AS VALOR_TOTAL
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO) TOTAL,

  (SELECT tb_classificacao.classificacao AS CLASSIFICACAO,
          SUM(tb_item.quantidade * tb_item.preco) AS VALOR_MES
   FROM tb_item
   INNER JOIN tb_nota ON tb_item.numero = tb_nota.numero
   INNER JOIN tb_produto ON tb_item.codigo_produto = tb_produto.codigo_produto
   INNER JOIN tb_classificacao ON tb_produto.codigo_classificacao = tb_classificacao.codigo_classificacao
   INNER JOIN tb_cliente ON tb_nota.cpf = tb_cliente.cpf
   INNER JOIN tb_cidade ON tb_cliente.cidade = tb_cidade.cidade
   INNER JOIN tb_estado ON tb_cidade.sigla_estado = tb_estado.sigla_estado
   WHERE YEAR(tb_nota.data) = 2020
     AND MONTH(tb_nota.data) = @ESTE_MES
     AND tb_estado.sigla_estado = @ESTADO
   GROUP BY tb_classificacao.classificacao) VENDAS
ORDER BY (VENDAS.VALOR_MES/ TOTAL.VALOR_TOTAL) * 100 DESC