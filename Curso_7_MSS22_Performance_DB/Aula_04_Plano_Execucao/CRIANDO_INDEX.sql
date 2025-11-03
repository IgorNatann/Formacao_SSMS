CREATE NONCLUSTERED INDEX idx_tb_cliente_cidade ON tb_cliente (cidade) 
INCLUDE (cpf, nome, sobrenome, email, telefone, numero, rua, complemento);