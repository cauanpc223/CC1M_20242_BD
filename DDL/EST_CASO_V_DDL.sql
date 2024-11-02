create database EST5_CC1M;

use EST5_CC1M;

create table if not exists fornecedores(
forn_cnpj int primary key,
forn_contato varchar(20) not null,
forn_nome varchar(20) not null
);

alter table fornecedores add ceo varchar(30);
alter table fornecedores modify column ceo varchar(45);
alter table fornecedores change column ceo nome_cfo varchar(45);
alter table fornecedores drop column nome_cfo;

create table if not exists clientes(
cli_cpf int primary key,
cli_nome varchar(45) not null,
cli_datanascimento date not null,
cli_rua varchar(50) not null,
cli_numrua int,
cli_bairro varchar(40) not null,
cli_cidade varchar(40) not null,
cli_estado varchar(35) not null,
cli_pais varchar(30) not null,
cli_codpostal varchar(10) not null,
cli_status text not null
);

alter table clientes add email varchar(100);
alter table clientes modify column email varchar(20);
alter table clientes change column email telefone varchar(20);
alter table clientes drop column telefone;

create table if not exists produtos(
prod_cod int primary key,
prod_categoria varchar(50) not null,
prod_preco decimal(10,2) not null,
prod_quantidade int
);

alter table produtos add dimensao varchar(50);
alter table produtos modify column dimensao text;
alter table produtos change column dimensao dimensoes text;
alter table produtos drop column dimensoes;

create table if not exists vendas(
vendas_cod int primary key,
vendas_cli_cpf int not null,
constraint fk_vendas_cli_cpf foreign key (vendas_cli_cpf) references clientes(cli_cpf)
);

alter table vendas add vendas_data varchar(50);
alter table vendas modify column vendas_data datetime;
alter table vendas change column vendas_data vendas_datahora datetime;
alter table vendas drop column vendas_datahora;

create table if not exists pagamentos(
pag_cod int primary key,
pag_data date not null,
pag_valor decimal(10,2) not null,
pag_status varchar(45) not null,
pag_forma varchar(15) not null,
pag_vendas_cod int not null,
constraint fk_pag_vendas_cod foreign key (pag_vendas_cod) references vendas(vendas_cod)
);

alter table pagamentos add pag_banco varchar(20);
alter table pagamentos modify column pag_banco text;
alter table pagamentos change column pag_banco pag_agencia text;
alter table pagamentos drop column pag_agencia;

create table if not exists produtos_vendas(
prvn_quantidade int not null,
prvn_valorvenda decimal(10,2),
prvn_prod_cod int not null,
prvn_vendas_cod int not null,
primary key(prvn_prod_cod, prvn_vendas_cod),
constraint pkfk_prvn_prod_cod foreign key (prvn_prod_cod) references produtos(prod_cod),
constraint pkfk_prvn_vendas_cod foreign key (prvn_vendas_cod) references vendas(vendas_cod)
);

alter table produtos_vendas add recebimento varchar(20);
alter table produtos_vendas modify column recebimento date;
alter table produtos_vendas change column recebimento chegada date;
alter table produtos_vendas drop column chegada;

create  table if not exists fornecedores_produtos(
frpr_forn_cnpj int not null,
frpr_prod_cod int not null,
primary key(frpr_forn_cnpj, frpr_prod_cod),
constraint pkfk_frpr_forn_cnpj foreign key (frpr_forn_cnpj) references fornecedores(forn_cnpj),
constraint pkfk_frpr_prod_cod foreign key (frpr_prod_cod) references produtos(prod_cod)
);

alter table fornecedores_produtos add produtores varchar(20);
alter table fornecedores_produtos modify column produtores text;
alter table fornecedores_produtos change column produtores fabricantes text;
alter table fornecedores_produtos drop column fabricantes;

create table if not exists teste5(
id_teste int primary key not null
);

drop table teste5;
