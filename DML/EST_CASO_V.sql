use EST5_CC1M;

insert into fornecedores (forn_cnpj, forn_contato, forn_nome) values
(123456789, 'contato@forn1.com', 'Fornecedor 1'),
(987654321, 'contato@forn2.com', 'Fornecedor 2'),
(456789123, 'contato@forn3.com', 'Fornecedor 3'),
(321987654, 'contato@forn4.com', 'Fornecedor 4'),
(654321789, 'contato@forn5.com', 'Fornecedor 5'),
(765432189, 'contato@forn6.com', 'Fornecedor 6');

update fornecedores set forn_contato = 'contato@atual.com' where forn_cnpj = 123456789;
update fornecedores set forn_nome = 'FornecedorAtual' where forn_cnpj = 987654321;

delete from fornecedores where forn_cnpj = 765432189;


insert into clientes (cli_cpf, cli_nome, cli_datanascimento, cli_rua, cli_numrua, cli_bairro, cli_cidade, cli_estado, cli_pais, cli_codpostal, cli_status) values
(111222333, 'João Silva', '1990-01-01', 'Rua A', 100, 'Centro', 'São Paulo', 'SP', 'Brasil', '12345-678', 'Ativo'),
(444555666, 'Maria Oliveira', '1985-05-15', 'Rua B', 200, 'Jardim', 'Rio de Janeiro', 'RJ', 'Brasil', '23456-789', 'Ativo'),
(777888999, 'Carlos Santos', '1978-10-20', 'Avenida C', 300, 'Zona Sul', 'Belo Horizonte', 'MG', 'Brasil', '34567-890', 'Inativo'),
(333444555, 'Ana Souza', '1995-07-30', 'Rua D', 400, 'Norte', 'Curitiba', 'PR', 'Brasil', '45678-901', 'Ativo'),
(888999777, 'Paulo Lima', '1992-12-25', 'Rua E', 500, 'Centro', 'Salvador', 'BA', 'Brasil', '56789-012', 'Ativo'),
(999111222, 'Fernanda Costa', '1998-03-12', 'Rua F', 600, 'Oeste', 'Fortaleza', 'CE', 'Brasil', '67890-123', 'Ativo'),
(555666777, 'Ricardo Pereira', '1982-08-18', 'Rua G', 700, 'Leste', 'Recife', 'PE', 'Brasil', '78901-234', 'Inativo');

update clientes set cli_nome = 'João Pedro Silva' where cli_cpf = 111222333;
update clientes set cli_status = 'Inativo' where cli_cpf = 444555666;

delete from clientes where cli_cpf = 555666777;


insert into produtos (prod_cod, prod_categoria, prod_preco, prod_quantidade) values
(1, 'Eletrônicos', 1000.00, 50),
(2, 'Móveis', 500.00, 30),
(3, 'Roupas', 80.00, 200),
(4, 'Alimentos', 20.00, 500),
(5, 'Livros', 40.00, 100),
(6, 'Bonecos', 50.00, 300);

update produtos set prod_preco = 1200.00 where prod_cod = 1;
update produtos set prod_quantidade = 250 where prod_cod = 3;

delete from produtos where prod_cod = 6;


insert into vendas (vendas_cod, vendas_cli_cpf) values
(1, 111222333),
(2, 444555666),
(3, 777888999),
(4, 333444555),
(5, 888999777),
(6, 999111222);

update vendas set vendas_cli_cpf = 333444555 where vendas_cod = 1;
update vendas set vendas_cli_cpf = 111222333 where vendas_cod = 2;

delete from vendas where vendas_cod = 6;


insert into pagamentos (pag_cod, pag_data, pag_valor, pag_status, pag_forma, pag_vendas_cod) values
(1, '2024-01-10', 1000.00, 'PAGO', 'Cartão', 1),
(2, '2024-02-15', 500.00, 'PENDENTE', 'Dinheiro', 2),
(3, '2024-03-20', 300.00, 'CANCELADO', 'Transferência', 3),
(4, '2024-04-05', 750.00, 'PENDENTE', 'Pix', 4),
(5, '2024-05-01', 200.00, 'PAGO', 'Cheque', 5);

update pagamentos set pag_status = 'PAGO' where pag_cod = 2;
update pagamentos set pag_valor = 800.00 where pag_cod = 4;

delete from pagamentos where pag_cod = 5;


insert into produtos_vendas (prvn_quantidade, prvn_valorvenda, prvn_prod_cod, prvn_vendas_cod) values
(10, 10000.00, 1, 1),
(5, 2500.00, 2, 2),
(20, 1600.00, 3, 3),
(50, 1000.00, 4, 4),
(15, 600.00, 5, 5);

update produtos_vendas set prvn_quantidade = 15 where prvn_prod_cod = 1 and prvn_vendas_cod = 1;
update produtos_vendas set prvn_valorvenda = 1800.00 where prvn_prod_cod = 3 and prvn_vendas_cod = 3;

delete from produtos_vendas where prvn_prod_cod = 5 and prvn_vendas_cod = 5;


insert into fornecedores_produtos (frpr_forn_cnpj, frpr_prod_cod) values
(123456789, 1),
(987654321, 2),
(456789123, 3),
(321987654, 4),
(654321789, 5);

update fornecedores_produtos set frpr_prod_cod = 4 where frpr_forn_cnpj = 123456789;
update fornecedores_produtos set frpr_forn_cnpj = 987654321 where frpr_prod_cod = 2;

delete from fornecedores_produtos where frpr_forn_cnpj = 654321789 and frpr_prod_cod = 5;

