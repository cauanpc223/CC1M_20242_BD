use ec1_cc1m;

INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_PAIS, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_CONTATO) VALUES
(1, 'Fornecedor A', 'Rua Alpha', 10, 'Bairro A', 'Cidade A', 'Estado A', 'País A', '12345-000', '1111111111', 'Contato A'),
(2, 'Fornecedor B', 'Rua Beta', 20, 'Bairro B', 'Cidade B', 'Estado B', 'País B', '23456-000', '2222222222', 'Contato B'),
(3, 'Fornecedor C', 'Rua Gamma', 30, 'Bairro C', 'Cidade C', 'Estado C', 'País C', '34567-000', '3333333333', 'Contato C'),
(4, 'Fornecedor D', 'Rua Delta', 40, 'Bairro D', 'Cidade D', 'Estado D', 'País D', '45678-000', '4444444444', 'Contato D'),
(5, 'Fornecedor E', 'Rua Epsilon', 50, 'Bairro E', 'Cidade E', 'Estado E', 'País E', '56789-000', '5555555555', 'Contato E'),
(6, 'Fornecedor F', 'Rua Zeta', 60, 'Bairro F', 'Cidade F', 'Estado F', 'País F', '67890-000', '6666666666', 'Contato F');

UPDATE FORNECEDORES SET FORNEC_NOME = 'Fornecedor A Atualizado' WHERE FORNEC_COD = 1;
UPDATE FORNECEDORES SET FORNEC_TELEFONE = '9999999999' WHERE FORNEC_COD = 2;

DELETE FROM FORNECEDORES WHERE FORNEC_COD = 6;


INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE) VALUES
(1, 'Filial A', 'Avenida 1', 101, 'Bairro 1', 'Cidade 1', 'Estado 1', 'País 1', '12345-123', 'Alta'),
(2, 'Filial B', 'Avenida 2', 202, 'Bairro 2', 'Cidade 2', 'Estado 2', 'País 2', '23456-234', 'Média'),
(3, 'Filial C', 'Avenida 3', 303, 'Bairro 3', 'Cidade 3', 'Estado 3', 'País 3', '34567-345', 'Baixa'),
(4, 'Filial D', 'Avenida 4', 404, 'Bairro 4', 'Cidade 4', 'Estado 4', 'País 4', '45678-456', 'Alta'),
(5, 'Filial E', 'Avenida 5', 505, 'Bairro 5', 'Cidade 5', 'Estado 5', 'País 5', '56789-567', 'Média'),
(6, 'Filial F', 'Rua Nova', 606, 'Bairro 6', 'Cidade 6', 'Estado 6', 'País 6', '67890-678', 'Extremamente Alta');


UPDATE FILIAIS SET FILIAL_CAPACIDADE = 'Baixa' WHERE FILIAL_COD = 3;
UPDATE FILIAIS SET FILIAL_RUA = 'Rua Atualizada' WHERE FILIAL_COD = 4;


DELETE FROM FILIAIS WHERE FILIAL_COD = 6;



INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN) VALUES
(1, 'Produto X', 'Descrição Produto X', 'Especificação X', 50.000, 100.50, 'kg', 10.000),
(2, 'Produto Y', 'Descrição Produto Y', 'Especificação Y', 20.000, 50.75, 'L', 5.000),
(3, 'Produto Z', 'Descrição Produto Z', 'Especificação Z', 100.000, 75.00, 'un', 15.000),
(4, 'Produto W', 'Descrição Produto W', 'Especificação W', 10.000, 30.25, 'm', 3.000),
(5, 'Produto V', 'Descrição Produto V', 'Especificação V', 5.000, 10.00, 'kg', 2.000),
(6, 'Produto U', 'Descrição Produto U', 'Especificação U', 60.000, 200.00, 'L', 8.000);


UPDATE PRODUTOS SET PROD_QUANT = 55.000 WHERE PROD_COD = 1;
UPDATE PRODUTOS SET PROD_PRECOUNIT = 110.50 WHERE PROD_COD = 2;


DELETE FROM PRODUTOS WHERE PROD_COD = 6;



INSERT INTO PEDIDOS (PED_CODIGO, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR) VALUES
(1, '2024-11-10', '09:00:00', '2024-11-15', 'PENDENTE', 1),
(2, '2024-11-11', '10:30:00', '2024-11-16', 'CONCLUÍDO', 2),
(3, '2024-11-12', '11:00:00', '2024-11-17', 'EM ESPERA', 3),
(4, '2024-11-13', '12:45:00', '2024-11-18', 'PENDENTE', 4),
(5, '2024-11-14', '14:15:00', '2024-11-19', 'CONCLUÍDO', 5),
(6, '2024-11-15', '15:30:00', '2024-11-20', 'EM ESPERA', 1);

UPDATE PEDIDOS SET PED_STATUS = 'CONCLUÍDO' WHERE PED_CODIGO = 1;
UPDATE PEDIDOS SET PED_HORA = '16:00:00' WHERE PED_CODIGO = 3;

DELETE FROM PEDIDOS WHERE PED_CODIGO = 6;


INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS) VALUES
('2024-11-16', '10:30:00', 25.000, 'Em boas condições', 1),
('2024-11-17', '11:45:00', 30.000, 'Pequenas avarias', 2),
('2024-11-18', '12:15:00', 40.000, 'Sem avarias', 3),
('2024-11-19', '13:00:00', 50.000, 'Avarias graves', 4),
('2024-11-20', '14:30:00', 15.000, 'Condição ruim', 5);

UPDATE RECEBIMENTOS SET RECEB_HORA = '16:30:00' WHERE RECEB_PEDIDOS = 4;
UPDATE RECEBIMENTOS SET RECEB_CONDICAO = 'Ótimas condições' WHERE RECEB_PEDIDOS = 5;

DELETE FROM RECEBIMENTOS WHERE RECEB_PEDIDOS = 5;


INSERT INTO PEDIDOS_PRODUTOS (PDPR_PEDIDOS_COD, PDPR_PRODUTOS_COD, PDPR_QUANT) VALUES
(1, 1, 5.000),
(2, 2, 10.000),
(3, 3, 15.000),
(4, 4, 20.000),
(5, 5, 25.000);

UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 35.000 WHERE PDPR_PEDIDOS_COD = 1 AND PDPR_PRODUTOS_COD = 1;
UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 40.000 WHERE PDPR_PEDIDOS_COD = 2 AND PDPR_PRODUTOS_COD = 2;

DELETE FROM PEDIDOS_PRODUTOS WHERE PDPR_PEDIDOS_COD = 5 AND PDPR_PRODUTOS_COD = 5;


INSERT INTO FILIAIS_PRODUTOS (FLPR_FILIAL_COD, FLPR_PRODUTOS_COD, FLPR_QUANT) VALUES
(1, 1, 100.000),
(2, 2, 200.000),
(3, 3, 300.000),
(4, 4, 400.000),
(5, 5, 500.000);

UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 700.000 WHERE FLPR_FILIAL_COD = 1 AND FLPR_PRODUTOS_COD = 1;
UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 800.000 WHERE FLPR_FILIAL_COD = 2 AND FLPR_PRODUTOS_COD = 2;

DELETE FROM FILIAIS_PRODUTOS WHERE FLPR_FILIAL_COD = 5 AND FLPR_PRODUTOS_COD = 5;


INSERT INTO FORNECEDORES_PRODUTOS (FRPR_FORNECEDOR_COD, FRPR_PRODUTOS_COD) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


UPDATE FORNECEDORES_PRODUTOS SET FRPR_PRODUTOS_COD = 5 WHERE FRPR_FORNECEDOR_COD = 1;
UPDATE FORNECEDORES_PRODUTOS SET FRPR_FORNECEDOR_COD = 3 WHERE FRPR_PRODUTOS_COD = 3;

DELETE FROM FORNECEDORES_PRODUTOS WHERE FRPR_FORNECEDOR_COD = 5 AND FRPR_PRODUTOS_COD = 5;

