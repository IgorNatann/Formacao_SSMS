# Formacao Microsoft SQL Server (Alura)

Repositorio com os scripts e materiais de apoio da trilha Microsoft SQL Server (MSS22) da Alura. Os arquivos estao organizados por curso e aula, cobrindo desde comandos basicos da linguagem SQL ate desenvolvimento de funcoes, stored procedures e cursores em T-SQL.

## Estrutura do repositorio
- `Curso_1_MSS22_conhecendo_SQL/`: fundamentos de modelagem, DDL, DML e consultas simples.
- `Curso_2_MSS22_consultas_avancadas_SQL/`: filtros avancados, funcoes internas e consultas analiticas.
- `Curso_3_MSS22_manipulando_dados_SQL/`: cargas de dados, transacoes, MERGE, constraints e gatilhos.
- `Curso_4_MSS22_conhecendo_TSQL/`: variaveis, funcoes escalares, controle de fluxo, lacos e tabelas temporarias.
- `Curso_5_MSS22_Procedures_Funcoes/`: funcoes definidas pelo usuario, stored procedures, cursores e relatorios dinamicos.

O banco de exemplo `SUCOS_VENDAS` (arquivos `.BAK`, scripts de carga e planilhas) esta replicado nas pastas `Database` ou `Data` de cada curso, facilitando o restauro rapido no SQL Server.

## Guia rapido por curso

### Curso 1 - Conhecendo SQL
- **Aula 01**: criacao do banco e tabelas, tipos de dados, `PRIMARY KEY`, insercoes ordenadas e fora de ordem.
- **Aula 02**: comandos `SELECT`, uso de `DISTINCT`, alias de colunas e selecao de colunas especificas.
- **Aula 03**: filtros com `WHERE`, operadores logicos, manipulacao de datas, `UPDATE`, `DELETE` e revisao de integridade.

### Curso 2 - Consultas Avancadas SQL
- **Aula 01**: scripts de criacao ou restauro do banco, carga de cadastros, itens e notas fiscais, alem da validacao de dados.
- **Aula 02**: filtros com `LIKE`, operadores relacionais, expressoes logicas e combinacao de multiplas condicoes.
- **Aula 03**: funcoes de data, string e numero (`DATEDIFF`, `SUBSTRING`, `ROUND`), conversoes de tipo, `CASE WHEN`, `GROUP BY` e `HAVING`.
- **Aula 04**: consultas de nivel avancado com funcoes agregadas, ordenacao, combinacao de criterios e desafios de analise.

### Curso 3 - Manipulando Dados SQL
- **Aula 01**: revisao de modelo entidade-relacionamento (MER) e exploracao do dominio de vendas.
- **Aula 02**: scripts para criar ou restaurar banco, `INSERT`, `UPDATE`, `DELETE`, `MERGE`, uso de transacoes e tratamento de erros.
- **Aula 03**: definicao de constraints (`CHECK`, `IDENTITY`), criacao de triggers para auditar alteracoes e desafios praticos.

### Curso 4 - Conhecendo T-SQL
- **Aula 01**: introducao ao ambiente T-SQL e restauro do banco de estudos.
- **Aula 02**: declaracao de variaveis, atribuicao com `SET` ou `SELECT` e desafios de aritmetica.
- **Aula 03**: funcoes de texto (`CHARINDEX`, concatenacao), uso de variaveis em consultas e exibicao de resultados.
- **Aula 04**: controle de fluxo com `IF...ELSE`, `BEGIN...END` e atualizacoes condicionais.
- **Aula 05**: estruturas de repeticao (`WHILE`, `BREAK`, `CONTINUE`) aplicadas a validacao de notas fiscais.
- **Aula 06**: tabelas temporarias, tabelas variaveis, combinacao com lacos e desafios de contagem.
- **Aula 07**: montagem de relatorios com T-SQL, consolidacao de dados e desafios finais.

### Curso 5 - Procedures e Funcoes
- **Aula 01**: criacao de funcoes escalares (`CREATE FUNCTION`), passagem de parametros e reutilizacao em consultas.
- **Aula 02**: alteracao (`ALTER FUNCTION`) e exclusao segura (`DROP FUNCTION` com `OBJECT_ID`), alem de consultas de apoio.
- **Aula 03**: escrita de stored procedures, parametros com valores padrao, parametros `OUTPUT` e rotina de limpeza.
- **Aula 04**: declaracao e uso de cursores (`DECLARE CURSOR`, `FETCH`, `WHILE`, `CLOSE`, `DEALLOCATE`) para percorrer clientes, vendedores e acumuladores mensais.

## Como executar os scripts
1. Restaure o banco `SUCOS_VENDAS` (arquivo `.bak`) ou execute os scripts de criacao e carga localizados nas pastas `Database`, `Data` ou `Scripts`.
2. Abra os arquivos `.sql` no SQL Server Management Studio (SSMS) ou Azure Data Studio.
3. Execute cada bloco de comandos na ordem sugerida pelas pastas (curso > aula), revisando os comentarios incluidos nos arquivos.
4. Utilize os desafios para reforcar os conceitos, adaptando scripts conforme suas necessidades.

## Sugestao de estudo
- Programe a execucao progressiva: conclua um curso por vez, registrando seus aprendizados nos comentarios dos scripts.
- Ajuste e reexecute os desafios com dados proprios ou variacoes de consultas para testar o entendimento.
- Combine scripts de diferentes cursos (por exemplo, usar funcoes do Curso 5 em relatorios do Curso 4) para consolidar o conhecimento de T-SQL.

Contribuicoes com novas anotacoes, correcoes ou desafios sao bem-vindas!
