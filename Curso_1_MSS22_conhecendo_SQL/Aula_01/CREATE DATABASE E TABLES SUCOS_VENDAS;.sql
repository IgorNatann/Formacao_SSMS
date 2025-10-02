-- =========================================
-- Aula 01 - Criacao do banco e tabelas bases
-- Objetivo geral: montar o ambiente SUCOS_VENDAS com as principais entidades de cadastro.
-- Conceitos principais: CREATE DATABASE, CREATE TABLE, tipos de dados, restricoes NOT NULL e PRIMARY KEY.
-- Dica de estudo: execute cada bloco separadamente para ver mensagens do SQL Server e validar a estrutura.
-- =========================================

-- Bloco 1 | Criar e usar o banco de estudos.
-- Depois de executar, o SSMS aponta os comandos seguintes para o banco SUCOS_VENDAS.
CREATE DATABASE SUCOS_VENDAS;
USE SUCOS_VENDAS;

-- Bloco 2 | Definir estrutura da tabela de clientes.
-- Traz informacoes cadastrais completas para futuras analises de consumo.
CREATE TABLE TABELA_CLIENTES (
    CPF CHAR(14) NOT NULL,            -- Identificador principal (chave sera adicionada depois)
    NOME VARCHAR(150) NOT NULL,       -- Nome completo do cliente
    RUA VARCHAR(150) NOT NULL,        -- Logradouro
    COMPLEMENTO VARCHAR(150) NULL,    -- Informacao opcional sobre o endereco
    BAIRRO VARCHAR(150) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    CEP CHAR(9) NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL,
    IDADE SMALLINT NOT NULL,
    SEXO CHAR(1) NOT NULL,
    LIMITE_CREDITO MONEY NOT NULL,
    VOLUME_MINIMO_COMPRA FLOAT NOT NULL,
    PRIMEIRA_COMPRA BIT NOT NULL
);

-- Bloco 3 | Definir estrutura da tabela de produtos.
-- Armazena itens que serao vendidos e respectivos precos.
CREATE TABLE TABELA_PRODUTOS (
    CODIGO_PRODUTO VARCHAR(20) NOT NULL PRIMARY KEY,
    NOME_PRODUTO VARCHAR(50) NOT NULL,
    EMBALAGEM VARCHAR(50) NOT NULL,
    TAMANHO VARCHAR(50) NOT NULL,
    SABOR VARCHAR(50) NOT NULL,
    PRECO_LISTA SMALLMONEY NOT NULL
);

-- Bloco 4 | Definir estrutura da tabela de vendedores.
-- Necessario para associar notas fiscais a quem realizou a venda.
CREATE TABLE TABELA_VENDEDORES (
    MATRICULA INT NOT NULL PRIMARY KEY,
    NOME_VENDEDOR VARCHAR(100) NOT NULL,
    PERCENTUAL_COMISSAO FLOAT NOT NULL
);
