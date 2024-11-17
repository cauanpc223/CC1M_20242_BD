use ec4_cc1m;

insert into modalidades (modal_id, modal_nome) values
(1, 'Yoga'),
(2, 'Pilates'),
(3, 'Musculação'),
(4, 'Boxe'),
(5, 'Crossfit'),
(6, 'Karate'),
(7, 'Jiu Jitsu'),
(8, 'Krav');

update modalidades set modal_nome = 'Yoga Avançado' where modal_id = 1;
update modalidades set modal_nome = 'Pilates Intenso' where modal_id = 2;

delete from modalidades where modal_id = 8;


insert into instrutores (instr_id, instr_nome) values
(1, 'Carlos Silva'),
(2, 'Maria Fernandes'),
(3, 'Ana Lima'),
(4, 'Rafael Costa'),
(5, 'João Souza'),
(6, 'Ronaldo Cabral'),
(7, 'Luan Carvalho'),
(8, 'Renan Lima');

update instrutores set instr_nome = 'Carlos Souza' where instr_id = 1;
update instrutores set instr_nome = 'Maria Oliveira' where instr_id = 2;

delete from instrutores where instr_id = 8;


insert into alunos (alun_id, alun_nome, alun_datanasc, alun_rua, alun_numrua, alun_bairro, alun_cidade, alun_estado, alun_pais, alun_cep, alun_modalidpref) values
(1, 'Lucas Pereira', '2000-04-12', 'Rua A', 100, 'Centro', 'São Paulo', 'SP', 'Brasil', '12345-678', 'Yoga'),
(2, 'Julia Santos', '1995-06-25', 'Rua B', 200, 'Jardim', 'Rio de Janeiro', 'RJ', 'Brasil', '23456-789', 'Pilates'),
(3, 'Pedro Alves', '1992-08-15', 'Avenida C', 300, 'Zona Sul', 'Belo Horizonte', 'MG', 'Brasil', '34567-890', 'Musculação'),
(4, 'Fernanda Costa', '1998-02-20', 'Rua D', 400, 'Norte', 'Curitiba', 'PR', 'Brasil', '45678-901', 'Boxe'),
(5, 'Mariana Rocha', '2001-11-30', 'Rua E', 500, 'Centro', 'Salvador', 'BA', 'Brasil', '56789-012', 'Crossfit'),
(6, 'Rafael Lima', '1997-09-10', 'Avenida F', 600, 'Leste', 'Fortaleza', 'CE', 'Brasil', '67890-123', 'Natação'),
(7, 'Beatriz Souza', '1999-12-05', 'Rua G', 700, 'Oeste', 'Porto Alegre', 'RS', 'Brasil', '78901-234', 'Zumba'),
(8, 'Thiago Martins', '1994-03-18', 'Rua H', 800, 'Sul', 'Manaus', 'AM', 'Brasil', '89012-345', 'Jiu Jitsu');


update alunos set alun_nome = 'Lucas Pereira da Silva' where alun_id = 1;
update alunos set alun_datanasc = '1999-04-12' where alun_id = 2;

delete from alunos where alun_id = 8;


insert into pagamentos (pagam_id, pagam_data, pagam_valor, pagam_status, pagam_alun_id) values
(1, '2024-01-15', 100.00, 'PENDENTE', 1),
(2, '2024-02-20', 150.00, 'CONCLUÍDO', 2),
(3, '2024-03-10', 200.00, 'EM ESPERA', 3),
(4, '2024-04-05', 250.00, 'PENDENTE', 4),
(5, '2024-05-01', 300.00, 'CONCLUÍDO', 4);

update pagamentos set pagam_status = 'CONCLUÍDO' where pagam_id = 1;
update pagamentos set pagam_valor = 180.00 where pagam_id = 2;

delete from pagamentos where pagam_id = 5;


insert into instrutores_modalidades (nsmd_modal_id, nsmd_instr_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

update instrutores_modalidades set nsmd_instr_id = 2 where nsmd_modal_id = 1;
update instrutores_modalidades set nsmd_instr_id = 1 where nsmd_modal_id = 2;

delete from instrutores_modalidades where nsmd_modal_id = 7 and nsmd_instr_id = 7;


insert into planos_de_treinamento (pdt_id, pdt_alun_id, pdt_nsmd_modal_id, pdt_nsmd_instr_id) values
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6);

update planos_de_treinamento set pdt_nsmd_modal_id = 2 where pdt_id = 1;
update planos_de_treinamento set pdt_nsmd_instr_id = 1 where pdt_id = 2;

delete from planos_de_treinamento where pdt_id = 6;


insert into aulas (aulas_id, aulas_horario, aulas_capacidade, aulas_nsmd_modal_id, aulas_nsmd_instr_id, aulas_pdt_id) values
(1, '08:00:00', 20, 1, 1, 1),
(2, '10:00:00', 15, 2, 2, 2),
(3, '14:00:00', 10, 3, 3, 3),
(4, '16:00:00', 25, 4, 4, 4),
(5, '18:00:00', 30, 5, 5, 5);

update aulas set aulas_capacidade = 18 where aulas_id = 1;
update aulas set aulas_horario = '09:00:00' where aulas_id = 2;

delete from aulas where aulas_id = 5;

