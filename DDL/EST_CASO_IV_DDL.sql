create database EC4_CC1M;

use EC4_CC1M;

create table if not exists modalidades(
modal_id int primary key,
modal_nome varchar(45) not null
);

alter table modalidades add quantidade decimal(2,1);
alter table modalidades modify column quantidade int;
alter table modalidades change column quantidade qnt int;
alter table modalidades drop column qnt;

create table if not exists instrutores(
instr_id int primary key,
instr_nome varchar(45) not null
);

alter table instrutores add qnt_alunos varchar(10);
alter table instrutores modify column qnt_alunos int;
alter table instrutores change column qnt_alunos quantidade_alunos int;
alter table instrutores drop column quantidade_alunos;

create table if not exists alunos(
alun_id int primary key,
alun_nome varchar(50) not null,
alun_datanasc date not null,
alun_rua varchar(50) not null,
alun_numrua int,
alun_bairro varchar(30) not null,
alun_cidade varchar(30) not null,
alun_estado varchar(50) not null,
alun_pais varchar(50) not null,
alun_cep varchar(14) not null,
alun_modalidpref varchar(25) not null
);

alter table alunos add num_modalidades decimal(2,1);
alter table alunos modify column num_modalidades int;
alter table alunos change column num_modalidades numero_modalidades int;
alter table alunos drop column numero_modalidades;

create table if not exists pagamentos(
pagam_id int primary key,
pagam_data date not null,
pagam_valor decimal(10, 2),
pagam_status enum('PENDENTE','CONCLUÍDO','EM ESPERA'),
pagam_alun_id int not null,
constraint fk_pagam_alun_id foreign key (pagam_alun_id) references alunos(alun_id)
);

alter table pagamentos add banco varchar(30);
alter table pagamentos modify column banco varchar(45);
alter table pagamentos change column banco agência varchar(45);
alter table pagamentos drop column agência;


create table if not exists instrutores_modalidades(
nsmd_modal_id int not null,
nsmd_instr_id int not null,
primary key (nsmd_modal_id, nsmd_instr_id),
constraint pkfk_nsmd_modal_id foreign key (nsmd_modal_id) references modalidades(modal_id),
constraint pkfk_nsmd_instr_id foreign key (nsmd_instr_id) references instrutores(instr_id)
);

alter table instrutores add capacidade decimal(2,1);
alter table instrutores modify column capacidade int;
alter table instrutores change column capacidade capacidade_max int;
alter table instrutores drop column capacidade_max;

create table if not exists planos_de_treinamento(
pdt_id int primary key,
pdt_alun_id int not null,
pdt_nsmd_modal_id int not null,
pdt_nsmd_instr_id int not null,
constraint fk_pdt_nsmd_modal_id foreign key (pdt_nsmd_modal_id) references instrutores_modalidades(nsmd_modal_id),
constraint fk_pdt_nsmd_instr_id foreign key (pdt_nsmd_instr_id) references instrutores_modalidades(nsmd_instr_id)
);

alter table planos_de_treinamento add qnt_aluno varchar(300);
alter table planos_de_treinamento modify column qnt_aluno int;
alter table planos_de_treinamento change column qnt_aluno qnt_alunos int;
alter table planos_de_treinamento drop column qnt_alunos;

create table if not exists aulas(
aulas_id int primary key,
aulas_horario time not null,
aulas_capacidade int not null,
aulas_nsmd_modal_id int not null,
aulas_nsmd_instr_id int not null,
aulas_pdt_id int not null,
constraint fk_aulas_nsmd_modal_id foreign key (aulas_nsmd_modal_id) references instrutores_modalidades(nsmd_modal_id),
constraint fk_aulas_nsmd_instr_id foreign key (aulas_nsmd_instr_id) references instrutores_modalidades(nsmd_instr_id),
constraint fk_aulas_pdt_id foreign key (aulas_pdt_id) references planos_de_treinamento(pdt_id)
);

alter table aulas add aulas_por_dia text;
alter table aulas modify column aulas_por_dia int;
alter table aulas change column aulas_por_dia aulas_no_dia int;
alter table aulas drop column aulas_no_dia;

create table if not exists teste4(
id_teste int primary key not null
);

drop table teste4;
