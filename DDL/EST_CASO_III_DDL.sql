create database EC3_CC1M;

use EC3_CC1M;

create table if not exists clientes(
cli_cod int primary key,
cli_cnpj varchar(20) not null,
cli_razaosocial varchar(30) not null,
cli_ramoatv text not null,
cli_datacadastro date not null,
cli_peessoacont varchar(30) not null
);

alter table clientes add email varchar(100);
alter table clientes modify column email varchar(150);
alter table clientes change column email telefone varchar(100);
alter table clientes drop column telefone;

create table if not exists fornecedores(
forn_cnpj varchar(20) primary key,
forn_razaosocial varchar(30) not null,
forn_peessoacont varchar(30) not null
);

alter table fornecedores add nome_ceo varchar(30);
alter table fornecedores modify column nome_ceo varchar(45);
alter table fornecedores change column nome_ceo nome_cfo varchar(45);
alter table fornecedores drop column nome_cfo;

create table if not exists empregados(
empreg_matr int primary key,
empreg_qualificacoes text not null,
empreg_datadeadmi date not null,
empreg_salario decimal(10,2),
empreg_cargo varchar(20) not null,
empreg_nome varchar(25) not null
);

alter table empregados add cpf varchar(10);
alter table empregados modify column cpf varchar(14);
alter table empregados change column cpf empreg_cpf varchar(14);
alter table empregados drop column empreg_cpf;

create table if not exists tipos_de_componentes(
tdc_cod int primary key,
tdc_nome varchar(40) not null
);

alter table tipos_de_componentes add quantidade decimal(1,0);
alter table tipos_de_componentes modify column quantidade int;
alter table tipos_de_componentes change column quantidade qnt int;
alter table tipos_de_componentes drop column qnt;

create table if not exists maquinas(
maquinas_cod int primary key,
maquinas_fimdegarantia date not null,
maquinas_datacompra date not null,
maquinas_tempodevida int not null
);

alter table maquinas add cor varchar(20);
alter table maquinas modify column cor text;
alter table maquinas change column cor pintura text;
alter table maquinas drop column pintura;

create table if not exists pagamentos(
pagam_id int primary key,
pagam_total decimal(10,2) not null,
pagam_desconto decimal(10,2), 
pagam_liquido decimal (10,2) not null,
pagam_formpagam varchar(20) not null,
pagam_quantparcelas int not null
);

alter table pagamentos add banco varchar(20);
alter table pagamentos modify column banco text;
alter table pagamentos change column banco agencia text;
alter table pagamentos drop column agencia;

create table if not exists tipos_de_endereço(
tde_cod int primary key,
tde_nome varchar(20) not null,
tde_cli_cod int not null,
tde_empreg_matr int not null,
tde_forn_cnpj varchar(20) not null,
constraint fk_tde_cliente_cod foreign key (tde_cli_cod) references clientes(cli_cod),
constraint fk_tde_empregado_matr foreign key (tde_empreg_matr) references empregados(empreg_matr),
constraint fk_tde_fornecedor_cnpj foreign key (tde_forn_cnpj) references fornecedores(forn_cnpj)
);

alter table tipos_de_endereço add cidade varchar(100);
alter table tipos_de_endereço modify column cidade varchar(45);
alter table tipos_de_endereço change column cidade uf varchar(45);
alter table tipos_de_endereço drop column uf;

create table if not exists endereços(
ender_num int,
ender_logradouro varchar(45) not null,
ender_complemento varchar(45) not null,
ender_cep varchar(20) not null,
ender_bairro varchar(45) not null,
ender_cidade varchar(45) not null,
ender_estado varchar (45) not null,
ender_tde_cli_cod int not null,
ender_tde_empreg_matr int not null,
ender_tde_forn_cnpj varchar(20) not null,
constraint fk_ender_tde_cliente_cod foreign key (ender_tde_cli_cod) references tipos_de_endereço(tde_cli_cod),
constraint fk_ender_tde_empregado_matr foreign key (ender_tde_empreg_matr) references tipos_de_endereço(tde_empreg_matr),
constraint fk_ender_tde_fornecedor_cnpj foreign key (ender_tde_forn_cnpj) references tipos_de_endereço(tde_forn_cnpj)
);

alter table endereços add endereço varchar(100);
alter table endereços modify column endereço varchar(120);
alter table endereços change column endereço log varchar(120);
alter table endereços drop column log;

create table if not exists telefones(
telef_ddi varchar(3) not null,
telef_ddd char(2) not null,
telef_num varchar(11) not null,
telef_cli_cod int not null,
telef_empreg_matr int not null,
telef_forn_cnpj varchar(20) not null,
constraint fk_telef_cliente_cod foreign key (telef_cli_cod) references clientes(cli_cod),
constraint fk_telef_empregado_matr foreign key (telef_empreg_matr) references empregados(empreg_matr),
constraint fk_telef_fornecedor_cnpj foreign key (telef_forn_cnpj) references fornecedores(forn_cnpj)
);

alter table telefones add credito decimal(10,2);
alter table telefones modify column credito decimal(4,2);
alter table telefones change column credito saldo decimal(4,2);
alter table telefones drop column saldo;

create table if not exists encomendas(
enc_num int primary key not null,
enc_datainclus date not null,
enc_cli_cod int not null,
enc_pagam_id int not null,
constraint fk_enc_cliente_cod foreign key (enc_cli_cod) references clientes(cli_cod),
constraint fk_enc_pagam_id foreign key (enc_pagam_id) references pagamentos(pagam_id)
);

alter table encomendas add tempo_de_entrega int;
alter table encomendas modify column tempo_de_entrega time;
alter table encomendas change column tempo_de_entrega previsao_de_entrega time;
alter table encomendas drop column previsao_de_entrega;

create table if not exists componentes(
comp_cod int primary key not null,
comp_und varchar(15) not null,
comp_preçounit decimal(5,2) not null,
comp_quantestoque int,
comp_nome varchar(30) not null,
comp_tdc_cod int not null,
constraint fk_comp_tdc_cod foreign key (comp_tdc_cod) references tipos_de_componentes(tdc_cod)
);

alter table componentes add quantidade decimal(1,0);
alter table componentes modify column quantidade int;
alter table componentes change column quantidade qnt int;
alter table componentes drop column qnt;

create table if not exists registro_de_suprimentos(
rs_quantidade int,
rs_datanecessidade date not null,
rs_maquinas_cod int not null,
rs_comp_cod int not null,
primary key (rs_maquinas_cod, rs_comp_cod),
constraint pkfk_rs_com_cod foreign key (rs_comp_cod) references componentes(comp_cod),
constraint pkfk_rs_maquinas_cod foreign key (rs_maquinas_cod) references maquinas(maquinas_cod)
);

alter table registro_de_suprimentos add recebimento date;
alter table registro_de_suprimentos modify column recebimento datetime;
alter table registro_de_suprimentos change column recebimento data_recebimento datetime;
alter table registro_de_suprimentos drop column data_recebimento;

create table if not exists produtos(
prod_cod int primary key not null,
prod_nome varchar(45) not null,
prod_cor varchar(25) not null,
prod_dimensão varchar(20) not null,
prod_peso decimal(5, 2) not null,
prod_tempodefabr time not null,
prod_horaobra time not null,
prod_empreg_matr int not null,
prod_enc_num int not null,
prod_rs_maquinas_cod int not null,
prod_rs_comp_cod int not null,
constraint fk_prod_empregado_matr foreign key (prod_empreg_matr) references empregados(empreg_matr),
constraint fk_prod_enc_num foreign key (prod_enc_num) references encomendas(enc_num),
constraint fk_prod_rs_maquinas_cod foreign key (prod_rs_maquinas_cod) references registro_de_suprimentos(rs_maquinas_cod),
constraint fk_prod_rs_comp_cod foreign key (prod_rs_comp_cod) references registro_de_suprimentos(rs_comp_cod)
);

alter table produtos add saida date;
alter table produtos modify column saida datetime;
alter table produtos change column saida recebimento datetime;
alter table produtos drop column recebimento;

create table if not exists recursos_especificos(
re_horasobra time not null,
re_tempouso date not null,
re_und varchar(25) not null,
re_quantnecessaria int not null,
re_prod_cod int not null,
constraint fk_re_prod_cod foreign key (re_prod_cod) references produtos(prod_cod)
);

alter table recursos_especificos add peso text;
alter table recursos_especificos modify column peso decimal(10,3);
alter table recursos_especificos change column peso pesagem decimal(10,3);
alter table recursos_especificos drop column pesagem;

create table if not exists componentes_fornecedores(
cmfr_comp_cod int not null,
cmfr_forn_cnpj varchar(20) not null,
primary key (cmfr_comp_cod, cmfr_forn_cnpj),
constraint pkfk_cmfr_com_cod foreign key (cmfr_comp_cod) references componentes(comp_cod),
constraint pkfk_cmfr_forn_cnpj foreign key (cmfr_forn_cnpj) references fornecedores(forn_cnpj)
);

alter table componentes_fornecedores add produtor text;
alter table componentes_fornecedores modify column produtor varchar(45);
alter table componentes_fornecedores change column produtor fabricante varchar(45);
alter table componentes_fornecedores drop column fabricante;

create table if not exists registros_de_manutenção(
rm_data date not null,
rm_descrição text not null,
rm_maquinas_cod int not null,
constraint fk_rm_maquinas_cod foreign key (rm_maquinas_cod) references maquinas(maquinas_cod)
);

alter table registros_de_manutenção add mecanico varchar(45);
alter table registros_de_manutenção modify column mecanico text;
alter table registros_de_manutenção change column mecanico mecanico_responsavel text;
alter table registros_de_manutenção drop column mecanico_responsavel;



create table if not exists teste3(
id_teste int primary key not null
);

drop table teste3;
