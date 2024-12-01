CREATE DATABASE projeto_fortes;

USE projeto_fortes;

CREATE TABLE IF NOT EXISTS donatarios(
dona_id INT PRIMARY KEY,
dona_cnpj VARCHAR(20) NOT NULL,
dona_edital VARCHAR(35) NOT NULL,
dona_pessoa_cont VARCHAR(35) NOT NULL,
dona_nome_representante  VARCHAR(100) NOT NULL,
dona_cpf_representante VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS funcionarios(
func_id INT PRIMARY KEY,
func_nome VARCHAR(100) NOT NULL,
func_email VARCHAR(100) NOT NULL,
func_cargo VARCHAR(30) NOT NULL,
func_data_nasc DATE NOT NULL,
func_rg VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS edital(
ed_id INT PRIMARY KEY,
ed_inicio DATE NOT NULL,
ed_fim DATE NOT NULL,
ed_objetivo TEXT NOT NULL,
ed_tematica VARCHAR(50) NOT NULL,
ed_metodologia TEXT NOT NULL,
ed_metas TEXT NOT NULL,
ed_orcamentos_invest DECIMAL(10,2) NOT NULL,
ed_dona_id INT NOT NULL,
ed_func_id INT NOT NULL,
CONSTRAINT ed_dona_id_FK FOREIGN KEY (ed_dona_id) REFERENCES donatarios (dona_id),
CONSTRAINT ed_func_id_FK FOREIGN KEY (ed_func_id) REFERENCES funcionarios (func_id)
);

CREATE TABLE IF NOT EXISTS vistorias(
vist_id INT PRIMARY KEY,
vist_valor_pend DECIMAL(10,2),
vist_doc_pend TEXT,
vist_doc TEXT NOT NULL,
vist_valor_pago DECIMAL(10,2) NOT NULL,
vist_dona_id INT NOT NULL,
vist_func_id INT NOT NULL,
CONSTRAINT vist_dona_idFK FOREIGN KEY (vist_dona_id) REFERENCES donatarios (dona_id),
CONSTRAINT vist_func_id_FK FOREIGN KEY (vist_func_id) REFERENCES funcionarios (func_id)
);

CREATE TABLE IF NOT EXISTS relatiorios(
rela_id INT PRIMARY KEY,
rela_data DATE NOT NULL,
rela_gastos DECIMAL(10,2) NOT NULL,
rela_vist_id INT NOT NULL,
CONSTRAINT rela_vist_id_FK FOREIGN KEY (rela_vist_id) REFERENCES vistorias (vist_id)
);

CREATE TABLE IF NOT EXISTS reunioes(
reun_id INT PRIMARY KEY,
reun_data DATE NOT NULL,
reun_vist_id INT NOT NULL,
CONSTRAINT reun_vist_id_FK FOREIGN KEY (reun_vist_id) REFERENCES vistorias (vist_id)
);

CREATE TABLE IF NOT EXISTS endereço(
ende_num_rua INT,
ende_rua VARCHAR(100) NOT NULL,
ende_bairro VARCHAR(100) NOT NULL,
ende_cidade VARCHAR(50) NOT NULL,
ende_uf CHAR(2) NOT NULL,
ende_pais VARCHAR(50) NOT NULL,
ende_cep VARCHAR(10) NOT NULL,
ende_dona_id INT NOT NULL,
ende_func_id INT NOT NULL,
CONSTRAINT ende_dona_id_FK FOREIGN KEY (ende_dona_id) REFERENCES donatarios (dona_id),
CONSTRAINT ende_func_id_FK FOREIGN KEY (ende_func_id) REFERENCES funcionarios (func_id)
);
