create database EC2_CC1M;

use EC2_CC1M;

create table if not exists passageiros(
pass_cpf varchar(20) primary key not null,
pass_nome varchar(30) not null,
pass_telefone varchar(14) not null,
pass_rua varchar(100) not null,
pass_numrua int,
pass_bairro varchar (50) not null,
pass_cidade varchar (30) not null,
pass_estado varchar(45) not null,
pass_pais varchar(30) not null,
pass_codpostal varchar(10) not null,
pass_email varchar(20) not null
);

alter table passageiros add email varchar(45);
alter table passageiros modify column email varchar(60);
alter table passageiros change column email email_completo varchar(60);
alter table passageiros drop column email_completo;

create table if not exists aeroportos(
aerop_codigo varchar(20) primary key not null,
aerop_longitude decimal(11, 8) not null,
aerop_latitude decimal (10, 8) not null,
aerop_pais varchar(30) not null,
aerop_cidade varchar(30) not null,
aerop_nome varchar(30) not null
);

alter table aeroportos add estado varchar(45);
alter table aeroportos modify column estado char(2);
alter table aeroportos change column estado uf char(2);
alter table aeroportos drop column uf;

create table if not exists aeronaves(
aeron_prefixo varchar(20) primary key not null,
aeron_modelo varchar(25) not null,
aeron_anofabr year not null,
aeron_autonomia decimal(4,2) not null,
aeron_capacidade int not null,
aeron_fabricante varchar(30) not null
);

alter table aeroportos add dono varchar(45);
alter table aeroportos modify column dono varchar(60);
alter table aeroportos change column dono nome_dono varchar(60);
alter table aeroportos drop column nome_dono;

create table if not exists funcionarios(
func_id int primary key not null,
func_nome varchar(30) not null,
func_datanasc datetime not null,
func_rua varchar(100) not null,
func_numrua int,
func_bairro varchar (50) not null,
func_cidade varchar (30) not null,
func_estado varchar(45) not null,
func_pais varchar(30) not null,
func_codpostal varchar(10) not null,
func_cpf varchar(14) not null,
func_funcao text not null
);

alter table funcionarios add email varchar(45);
alter table funcionarios modify column email varchar(80);
alter table funcionarios change column email email_completo varchar(80);
alter table funcionarios drop column email_completo;

create table if not exists voos(
voo_id int primary key not null,
voo_data date not null,
voo_hora time not null,
voo_aerop_origem varchar(20) not null,
voo_aerop_destino varchar(20) not null,
voo_aeronave varchar(20) not null,
constraint fk_aeroporto_origem foreign key (voo_aerop_origem) references aeroportos(aerop_codigo),
constraint fk_aeroporto_destino foreign key (voo_aerop_destino) references aeroportos(aerop_codigo),
constraint fk_aeronave foreign key (voo_aeronave) references aeronaves(aeron_prefixo) 
);

alter table voos add piloto varchar(45);
alter table voos modify column piloto varchar(60);
alter table voos change column piloto nome_piloto varchar(60);
alter table voos drop column nome_piloto;

create table if not exists reservas(
reser_cod int primary key not null,
pass_cpf varchar(20) not null,
voo_id int not null,
constraint fk_passageiro_cpf foreign key (pass_cpf) references passageiros(pass_cpf),
constraint fk_voo_id foreign key (voo_id) references voos(voo_id)
);

alter table reservas add reserva_data date;
alter table reservas modify column reserva_data datetime;
alter table reservas change column reserva_data data_hora datetime;
alter table reservas drop column data_hora;

create table if not exists funcionarios_voos(
fnvs_voo_id int not null,
fnvs_func_id int not null,
primary key (fnvs_voo_id, fnvs_func_id),
constraint pkfk_voo_id foreign key (fnvs_voo_id) references voos(voo_id),
constraint pkfk_funcionario_id foreign key (fnvs_func_id) references funcionarios(func_id)
);

alter table funcionarios_voos add encarregado varchar(60);
alter table funcionarios_voos modify column encarregado varchar(100);
alter table funcionarios_voos change column encarregado nome_encarregado varchar(100);
alter table funcionarios_voos drop column nome_encarregado;

create table if not exists teste2(
id_teste int primary key not null
);

drop table teste2;
