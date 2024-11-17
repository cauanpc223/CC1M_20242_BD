use EC2_CC1M;

INSERT INTO passageiros (pass_cpf, pass_nome, pass_telefone, pass_rua, pass_numrua, pass_bairro, pass_cidade, pass_estado, pass_pais, pass_codpostal, pass_email) VALUES
('123.456.789-00', 'Alice Souza', '1234567890', 'Rua das Flores', 10, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-000', 'alice@email.com'),
('234.567.890-11', 'Carlos Silva', '2345678901', 'Avenida Brasil', 20, 'Jardim', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', 'carlos@email.com'),
('345.678.901-22', 'Mariana Oliveira', '3456789012', 'Rua Esperança', 30, 'Liberdade', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', 'mariana@email.com'),
('456.789.012-33', 'Pedro Lima', '4567890123', 'Praça da Sé', 40, 'Sé', 'São Paulo', 'SP', 'Brasil', '01010-000', 'pedro@email.com'),
('567.890.123-44', 'Juliana Costa', '5678901234', 'Alameda Santos', 50, 'Paulista', 'São Paulo', 'SP', 'Brasil', '01310-000', 'juliana@email.com'),
('678.890.321-55', 'Ronaldo Cabarl', '678901234', 'Edenites da Silva', 60, 'Centro', 'São Paulo', 'SP', 'Brasil', '01410-000', 'ronaldo@email.com');

UPDATE passageiros SET pass_nome = 'Alice Souza Silva' WHERE pass_cpf = '123.456.789-00';
UPDATE passageiros SET pass_telefone = '9876543210' WHERE pass_cpf = '234.567.890-11';
DELETE FROM passageiros WHERE pass_cpf = '678.890.321-55';

INSERT INTO aeroportos (aerop_codigo, aerop_longitude, aerop_latitude, aerop_pais, aerop_cidade, aerop_nome) VALUES
('AER001', -46.655781, -23.553118, 'Brasil', 'São Paulo', 'Aeroporto de Congonhas'),
('AER002', -43.250000, -22.910000, 'Brasil', 'Rio de Janeiro', 'Aeroporto do Galeão'),
('AER003', -38.500000, -12.900000, 'Brasil', 'Salvador', 'Aeroporto de Salvador'),
('AER004', -51.171200, -30.000000, 'Brasil', 'Porto Alegre', 'Aeroporto Salgado Filho'),
('AER005', -35.775000, -9.383333, 'Brasil', 'Maceió', 'Aeroporto Zumbi dos Palmares'),
('AER006', -34.775000, -10.383333, 'Brasil', 'Vitória', 'Aeroporto em Vitória');

UPDATE aeroportos SET aerop_nome = 'Aeroporto em Congonhas' WHERE aerop_codigo = 'AER001';
UPDATE aeroportos SET aerop_cidade = 'Rio de Janeiro - RJ' WHERE aerop_codigo = 'AER002';
DELETE FROM aeroportos WHERE aerop_codigo = 'AER006';

INSERT INTO aeronaves (aeron_prefixo, aeron_modelo, aeron_anofabr, aeron_autonomia, aeron_capacidade, aeron_fabricante) VALUES
('PR-XYZ', 'Boeing 737', 2018, 3.50, 180, 'Boeing'),
('PT-ABC', 'Airbus A320', 2020, 4.00, 200, 'Airbus'),
('PP-QRS', 'Embraer 190', 2017, 2.75, 100, 'Embraer'),
('PH-KLM', 'Boeing 777', 2015, 5.50, 300, 'Boeing'),
('PJ-DEF', 'Airbus A330', 2019, 4.50, 250, 'Airbus'),
('PR-XXX', 'Airbus A331', 2009, 4.80, 350, 'Airbus');

UPDATE aeronaves SET aeron_modelo = 'Boeing 737 MAX' WHERE aeron_prefixo = 'PR-XYZ';
UPDATE aeronaves SET aeron_capacidade = 220 WHERE aeron_prefixo = 'PT-ABC';
DELETE FROM aeronaves WHERE aeron_prefixo = 'PJ-DEF';

INSERT INTO funcionarios (func_id, func_nome, func_datanasc, func_rua, func_numrua, func_bairro, func_cidade, func_estado, func_pais, func_codpostal, func_cpf, func_funcao) VALUES
(1, 'João Pereira', '1985-06-15 00:00:00', 'Rua das Acácias', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-000', '123.456.789-01', 'Piloto'),
(2, 'Ana Paula', '1990-11-20 00:00:00', 'Avenida Paulista', 456, 'Paulista', 'São Paulo', 'SP', 'Brasil', '01310-000', '234.567.890-12', 'Co-Piloto'),
(3, 'Carlos Menezes', '1988-09-05 00:00:00', 'Rua da Praia', 789, 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil', '22000-000', '345.678.901-23', 'Comissário'),
(4, 'Sofia Lima', '1995-03-10 00:00:00', 'Avenida Atlântica', 101, 'Centro', 'Florianópolis', 'SC', 'Brasil', '88000-000', '456.789.012-34', 'Comissária'),
(5, 'Lucas Souza', '1993-02-25 00:00:00', 'Rua 24 de Maio', 102, 'Bairro Alto', 'Curitiba', 'PR', 'Brasil', '80000-000', '567.890.123-45', 'Mecânico'),
(6, 'Luan Silva', '1983-09-30 00:00:00', 'Rua 25 de Março', 210, 'Bairro Baixo', 'Rio de Janeiro', 'RJ', 'Brasil', '80000-000', '312.683.812-83', 'Mecânico');

UPDATE funcionarios SET func_nome = 'João Pereira da Silva' WHERE func_id = 1;
UPDATE funcionarios SET func_funcao = 'Chefe de Comissários' WHERE func_id = 3;
DELETE FROM funcionarios WHERE func_id = 6;

INSERT INTO voos (voo_id, voo_data, voo_hora, voo_aerop_origem, voo_aerop_destino, voo_aeronave) VALUES
(1, '2024-12-01', '10:00:00', 'AER001', 'AER002', 'PR-XYZ'),
(2, '2024-12-02', '12:30:00', 'AER003', 'AER004', 'PT-ABC'),
(3, '2024-12-03', '14:45:00', 'AER002', 'AER005', 'PP-QRS'),
(4, '2024-12-04', '16:00:00', 'AER001', 'AER003', 'PH-KLM'),
(5, '2024-12-05', '18:15:00', 'AER004', 'AER001', 'PR-XYZ'),
(6, '2024-12-06', '18:16:00', 'AER005', 'AER001', 'PR-XXX');

UPDATE voos SET voo_hora = '11:00:00' WHERE voo_id = 1;
UPDATE voos SET voo_aerop_destino = 'AER001' WHERE voo_id = 3;
DELETE FROM voos WHERE voo_id = 6;

INSERT INTO reservas (reser_cod, pass_cpf, voo_id) VALUES
(1, '123.456.789-00', 1),
(2, '234.567.890-11', 2),
(3, '345.678.901-22', 3),
(4, '456.789.012-33', 4),
(5, '567.890.123-44', 5);

UPDATE reservas SET pass_cpf = '456.789.012-33' WHERE reser_cod = 1;
UPDATE reservas SET voo_id = 4 WHERE reser_cod = 2;
DELETE FROM reservas WHERE reser_cod = 5;

INSERT INTO funcionarios_voos (fnvs_voo_id, fnvs_func_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE funcionarios_voos SET fnvs_func_id = 2 WHERE fnvs_voo_id = 1;
UPDATE funcionarios_voos SET fnvs_func_id = 4 WHERE fnvs_voo_id = 3;
DELETE FROM funcionarios_voos WHERE fnvs_voo_id = 5 AND fnvs_func_id = 5;

