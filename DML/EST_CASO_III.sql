use ec3_cc1m;

INSERT INTO clientes (cli_cod, cli_cnpj, cli_razaosocial, cli_ramoatv, cli_datacadastro, cli_peessoacont) VALUES
(1, '12345678901234', 'Empresa A', 'Tecnologia', '2024-01-01', 'João Silva'),
(2, '23456789012345', 'Empresa B', 'Construção', '2024-01-02', 'Maria Oliveira'),
(3, '34567890123456', 'Empresa C', 'Educação', '2024-01-03', 'Carlos Mendes'),
(4, '45678901234567', 'Empresa D', 'Saúde', '2024-01-04', 'Ana Paula'),
(5, '56789012345678', 'Empresa E', 'Varejo', '2024-01-05', 'José Santos');


UPDATE clientes SET cli_razaosocial = 'Empresa A Atualizada' WHERE cli_cod = 1;
UPDATE clientes SET cli_ramoatv = 'TI' WHERE cli_cod = 2;


DELETE FROM clientes WHERE cli_cod = 5;


INSERT INTO fornecedores (forn_cnpj, forn_razaosocial, forn_peessoacont) VALUES
('12345678901234', 'Fornecedor A', 'Roberto Lima'),
('23456789012345', 'Fornecedor B', 'Fernanda Souza'),
('34567890123456', 'Fornecedor C', 'Marcelo Gomes'),
('45678901234567', 'Fornecedor D', 'Beatriz Ramos'),
('56789012345678', 'Fornecedor E', 'Thiago Costa'),
('67890123456789', 'Fornecedor F', 'Thiago Rico');


UPDATE fornecedores SET forn_razaosocial = 'Fornecedor A Atualizado' WHERE forn_cnpj = '12345678901234';
UPDATE fornecedores SET forn_peessoacont = 'Laura Martins' WHERE forn_cnpj = '23456789012345';


DELETE FROM fornecedores WHERE forn_cnpj = '67890123456789';


INSERT INTO empregados (empreg_matr, empreg_qualificacoes, empreg_datadeadmi, empreg_salario, empreg_cargo, empreg_nome) VALUES
(1, 'Engenheiro de Software', '2020-01-01', 8000.00, 'Engenheiro', 'Gabriel Alves'),
(2, 'Gerente de Projetos', '2019-03-15', 10000.00, 'Gerente', 'Fernanda Lima'),
(3, 'Analista de Dados', '2021-07-20', 6000.00, 'Analista', 'Lucas Vieira'),
(4, 'Desenvolvedor', '2022-10-10', 7500.00, 'Programador', 'Mariana Rocha'),
(5, 'Técnico de Suporte', '2018-05-05', 4000.00, 'Suporte', 'Bruno Almeida');


UPDATE empregados SET empreg_cargo = 'Desenvolvedor Sênior' WHERE empreg_matr = 1;
UPDATE empregados SET empreg_salario = 11000.00 WHERE empreg_matr = 2;


DELETE FROM empregados WHERE empreg_matr = 5;


INSERT INTO tipos_de_componentes (tdc_cod, tdc_nome) VALUES
(1, 'Componente A'),
(2, 'Componente B'),
(3, 'Componente C'),
(4, 'Componente D'),
(5, 'Componente E');


UPDATE tipos_de_componentes SET tdc_nome = 'Componente A Atualizado' WHERE tdc_cod = 1;
UPDATE tipos_de_componentes SET tdc_nome = 'Componente B Atualizado' WHERE tdc_cod = 2;


DELETE FROM tipos_de_componentes WHERE tdc_cod = 5;


INSERT INTO maquinas (maquinas_cod, maquinas_fimdegarantia, maquinas_datacompra, maquinas_tempodevida) VALUES
(1, '2026-01-01', '2023-01-01', 5),
(2, '2027-05-15', '2024-05-15', 6),
(3, '2028-09-10', '2025-09-10', 7),
(4, '2029-12-20', '2026-12-20', 8),
(5, '2030-03-30', '2027-03-30', 10);


UPDATE maquinas SET maquinas_tempodevida = 12 WHERE maquinas_cod = 1;
UPDATE maquinas SET maquinas_fimdegarantia = '2026-12-31' WHERE maquinas_cod = 2;


DELETE FROM maquinas WHERE maquinas_cod = 5;


INSERT INTO pagamentos (pagam_id, pagam_total, pagam_desconto, pagam_liquido, pagam_formpagam, pagam_quantparcelas) VALUES
(1, 1000.00, 50.00, 950.00, 'Cartão', 10),
(2, 500.00, 0.00, 500.00, 'Dinheiro', 1),
(3, 1500.00, 100.00, 1400.00, 'Transferência', 5),
(4, 2000.00, 200.00, 1800.00, 'Pix', 12),
(5, 800.00, 20.00, 780.00, 'Cheque', 3);


UPDATE pagamentos SET pagam_total = 1200.00 WHERE pagam_id = 1;
UPDATE pagamentos SET pagam_desconto = 150.00 WHERE pagam_id = 3;


DELETE FROM pagamentos WHERE pagam_id = 5;


INSERT INTO tipos_de_endereço (tde_cod, tde_nome, tde_cli_cod, tde_empreg_matr, tde_forn_cnpj) VALUES
(1, 'Comercial', 1, 1, '12345678901234'),
(2, 'Residencial', 2, 2, '23456789012345'),
(3, 'Entrega', 3, 3, '34567890123456'),
(4, 'Cobrança', 4, 4, '45678901234567'),
(5, 'Principal', 4, 4, '45678901234567'); 


UPDATE tipos_de_endereço SET tde_nome = 'Endereço Comercial' WHERE tde_cod = 1;
UPDATE tipos_de_endereço SET tde_nome = 'Endereço Residencial' WHERE tde_cod = 2;


DELETE FROM tipos_de_endereço WHERE tde_cod = 5;

SET SQL_SAFE_UPDATES = 0;


INSERT INTO endereços (ender_num, ender_logradouro, ender_complemento, ender_cep, ender_bairro, ender_cidade, ender_estado, ender_tde_cli_cod, ender_tde_empreg_matr, ender_tde_forn_cnpj) VALUES
(1, 'Rua A', 'Apto 101', '12345-000', 'Centro', 'São Paulo', 'SP', 1, 1, '12345678901234'),
(2, 'Avenida B', 'Bloco 2', '23456-111', 'Jardim', 'Rio de Janeiro', 'RJ', 2, 2, '23456789012345'),
(3, 'Rua C', 'Casa', '34567-222', 'Bela Vista', 'Curitiba', 'PR', 3, 3, '34567890123456'),
(4, 'Avenida D', 'Sala 501', '45678-333', 'Paulista', 'São Paulo', 'SP', 4, 4, '45678901234567'),
(5, 'Rua E', 'Cobertura', '56789-444', 'Liberdade', 'Salvador', 'BA', 4, 4, '45678901234567'); 


UPDATE endereços SET ender_logradouro = 'Avenida Principal' WHERE ender_num = 1;
UPDATE endereços SET ender_bairro = 'Zona Sul' WHERE ender_num = 3;


DELETE FROM endereços WHERE ender_num = 5;


INSERT INTO telefones (telef_ddi, telef_ddd, telef_num, telef_cli_cod, telef_empreg_matr, telef_forn_cnpj) VALUES
('+55', '11', '987654321', 1, 1, '12345678901234'),
('+55', '21', '912345678', 2, 2, '23456789012345'),
('+55', '41', '999876543', 3, 3, '34567890123456'),
('+55', '51', '998765432', 4, 4, '45678901234567'),
('+55', '71', '987654321', 4, 4, '45678901234567');


UPDATE telefones SET telef_num = '998877665' WHERE telef_ddd = '11';
UPDATE telefones SET telef_ddd = '12' WHERE telef_num = '912345678';


DELETE FROM telefones WHERE telef_ddd = '71';


INSERT INTO encomendas (enc_num, enc_datainclus, enc_cli_cod, enc_pagam_id) VALUES
(1, '2024-11-01', 1, 1),
(2, '2024-11-02', 2, 2),
(3, '2024-11-03', 3, 3),
(4, '2024-11-04', 4, 4),
(5, '2024-11-05', 4, 4); 


UPDATE encomendas SET enc_datainclus = '2024-11-10' WHERE enc_num = 1;
UPDATE encomendas SET enc_cli_cod = 2 WHERE enc_num = 2;


DELETE FROM encomendas WHERE enc_num = 5;


INSERT INTO componentes (comp_cod, comp_und, comp_preçounit, comp_quantestoque, comp_nome, comp_tdc_cod) VALUES
(1, 'kg', 5.50, 100, 'Ferro', 1),
(2, 'L', 8.75, 50, 'Óleo', 2),
(3, 'm', 3.20, 200, 'Cabo', 3),
(4, 'un', 15.00, 30, 'Parafuso', 4),
(5, 'cm', 2.10, 500, 'Plástico', 4), 
(6, 'cm', 2.40, 550, 'Carbono', 4); 


UPDATE componentes SET comp_preçounit = 6.00 WHERE comp_cod = 1;
UPDATE componentes SET comp_quantestoque = 60 WHERE comp_cod = 2;


DELETE FROM componentes WHERE comp_cod = 6;


INSERT INTO registro_de_suprimentos (rs_quantidade, rs_datanecessidade, rs_maquinas_cod, rs_comp_cod) VALUES
(50, '2024-12-01', 1, 1),
(30, '2024-12-02', 2, 2),
(70, '2024-12-03', 3, 3),
(100, '2024-12-04', 4, 4),
(20, '2024-12-05', 1, 4); 


UPDATE registro_de_suprimentos SET rs_quantidade = 80 WHERE rs_maquinas_cod = 1 AND rs_comp_cod = 1;
UPDATE registro_de_suprimentos SET rs_datanecessidade = '2024-12-10' WHERE rs_maquinas_cod = 2 AND rs_comp_cod = 2;


DELETE FROM registro_de_suprimentos WHERE rs_maquinas_cod = 1 AND rs_comp_cod = 4;


INSERT INTO produtos (prod_cod, prod_nome, prod_cor, prod_dimensão, prod_peso, prod_tempodefabr, prod_horaobra, prod_empreg_matr, prod_enc_num, prod_rs_maquinas_cod, prod_rs_comp_cod) VALUES
(1, 'Produto A', 'Vermelho', '10x10x10', 2.50, '01:00:00', '02:00:00', 1, 1, 1, 1),
(2, 'Produto B', 'Azul', '15x15x15', 3.75, '02:00:00', '03:00:00', 2, 2, 2, 2),
(3, 'Produto C', 'Verde', '20x20x20', 5.00, '03:00:00', '04:00:00', 3, 3, 3, 3),
(4, 'Produto D', 'Amarelo', '25x25x25', 1.25, '04:00:00', '05:00:00', 4, 4, 4, 4),
(5, 'Produto E', 'Preto', '30x30x30', 2.00, '05:00:00', '06:00:00', 4, 4, 4, 4); -- Corrigido: Correspondência correta com `empregados`, `encomendas`, `registro_de_suprimentos`


UPDATE produtos SET prod_nome = 'Produto A Premium' WHERE prod_cod = 1;
UPDATE produtos SET prod_peso = 4.00 WHERE prod_cod = 2;


DELETE FROM produtos WHERE prod_cod = 5;


INSERT INTO recursos_especificos (re_horasobra, re_tempouso, re_und, re_quantnecessaria, re_prod_cod) VALUES
('02:00:00', '2024-12-01', 'kg', 100, 1),
('03:00:00', '2024-12-02', 'L', 50, 2),
('04:00:00', '2024-12-03', 'm', 70, 3),
('05:00:00', '2024-12-04', 'un', 30, 4),
('06:00:00', '2024-12-05', 'cm', 20, 4); 

UPDATE recursos_especificos SET re_horasobra = '01:30:00' WHERE re_prod_cod = 1;
UPDATE recursos_especificos SET re_quantnecessaria = 120 WHERE re_prod_cod = 2;

DELETE FROM recursos_especificos WHERE re_prod_cod = 4;


INSERT INTO componentes_fornecedores (cmfr_comp_cod, cmfr_forn_cnpj) VALUES
(1, '12345678901234'),
(2, '23456789012345'),
(3, '34567890123456'),
(4, '45678901234567'),
(5, '56789012345678');  


UPDATE componentes_fornecedores SET cmfr_forn_cnpj = '23456789012345' WHERE cmfr_comp_cod = 1;
UPDATE componentes_fornecedores SET cmfr_forn_cnpj = '12345678901234' WHERE cmfr_comp_cod = 1;


DELETE FROM componentes_fornecedores WHERE cmfr_comp_cod = 5 AND cmfr_forn_cnpj = '56789012345678';


INSERT INTO registros_de_manutenção (rm_data, rm_descrição, rm_maquinas_cod) VALUES
('2024-12-01', 'Troca de óleo', 1),
('2024-12-02', 'Revisão geral', 2),
('2024-12-03', 'Substituição de peças', 3),
('2024-12-04', 'Ajuste de componentes', 4),
('2024-12-05', 'Manutenção preventiva', 4); 


UPDATE registros_de_manutenção SET rm_descrição = 'Troca de filtros' WHERE rm_maquinas_cod = 1;
UPDATE registros_de_manutenção SET rm_data = '2024-12-06' WHERE rm_maquinas_cod = 2;


DELETE FROM registros_de_manutenção WHERE rm_maquinas_cod = 4;


