# Projeto Fortes - Banco de Dados

Este repositório contém a estrutura de um banco de dados para o **Projeto Fortes**, desenvolvido em **MySQL**. O banco de dados gerencia informações relacionadas a donatários, funcionários, editais, vistorias, relatórios, reuniões e endereços. O script é projetado para ser utilizado no **MySQL Workbench**.

## Estrutura do Banco de Dados

O banco de dados é composto por diversas tabelas inter-relacionadas, organizadas da seguinte maneira:

---

### 1. **Tabela `donatarios`**
Armazena informações sobre os donatários do projeto.

- **Colunas:**
  - `dona_id` (INT, PK): Identificador único do donatário.
  - `dona_cnpj` (VARCHAR): CNPJ do donatário.
  - `dona_edital` (VARCHAR): Nome do edital associado.
  - `dona_pessoa_cont` (VARCHAR): Pessoa de contato.
  - `dona_nome_representante` (VARCHAR): Nome do representante legal.
  - `dona_cpf_representante` (VARCHAR): CPF do representante legal.

---

### 2. **Tabela `funcionarios`**
Armazena dados dos funcionários associados ao projeto.

- **Colunas:**
  - `func_id` (INT, PK): Identificador único do funcionário.
  - `func_nome` (VARCHAR): Nome do funcionário.
  - `func_email` (VARCHAR): Email do funcionário.
  - `func_cargo` (VARCHAR): Cargo do funcionário.
  - `func_data_nasc` (DATE): Data de nascimento.
  - `func_rg` (VARCHAR): RG do funcionário.

---

### 3. **Tabela `edital`**
Armazena informações sobre os editais do projeto.

- **Colunas:**
  - `ed_id` (INT, PK): Identificador único do edital.
  - `ed_inicio` (DATE): Data de início do edital.
  - `ed_fim` (DATE): Data de término do edital.
  - `ed_objetivo` (TEXT): Objetivo do edital.
  - `ed_tematica` (VARCHAR): Temática do edital.
  - `ed_metodologia` (TEXT): Metodologia aplicada no edital.
  - `ed_metas` (TEXT): Metas do edital.
  - `ed_orcamentos_invest` (DECIMAL): Valor do orçamento do edital.
  - `ed_dona_id` (FK): Relacionamento com a tabela `donatarios`.
  - `ed_func_id` (FK): Relacionamento com a tabela `funcionarios`.

---

### 4. **Tabela `vistorias`**
Registra as vistorias realizadas no âmbito do projeto.

- **Colunas:**
  - `vist_id` (INT, PK): Identificador único da vistoria.
  - `vist_valor_pend` (DECIMAL): Valor pendente da vistoria.
  - `vist_doc_pend` (TEXT): Documentos pendentes.
  - `vist_doc` (TEXT): Documentos da vistoria.
  - `vist_valor_pago` (DECIMAL): Valor pago na vistoria.
  - `vist_dona_id` (FK): Relacionamento com a tabela `donatarios`.
  - `vist_func_id` (FK): Relacionamento com a tabela `funcionarios`.

---

### 5. **Tabela `relatiorios`**
Armazena relatórios de acompanhamento.

- **Colunas:**
  - `rela_id` (INT, PK): Identificador único do relatório.
  - `rela_data` (DATE): Data de criação do relatório.
  - `rela_gastos` (DECIMAL): Gastos registrados no relatório.
  - `rela_vist_id` (FK): Relacionamento com a tabela `vistorias`.

---

### 6. **Tabela `reunioes`**
Registra informações sobre reuniões relacionadas às vistorias.

- **Colunas:**
  - `reun_id` (INT, PK): Identificador único da reunião.
  - `reun_data` (DATE): Data da reunião.
  - `reun_vist_id` (FK): Relacionamento com a tabela `vistorias`.

---

### 7. **Tabela `endereço`**
Armazena endereços associados a donatários e funcionários.

- **Colunas:**
  - `ende_num_rua` (INT): Número da rua.
  - `ende_rua` (VARCHAR): Nome da rua.
  - `ende_bairro` (VARCHAR): Bairro.
  - `ende_cidade` (VARCHAR): Cidade.
  - `ende_uf` (CHAR): Unidade Federativa (Estado).
  - `ende_pais` (VARCHAR): País.
  - `ende_cep` (VARCHAR): CEP.
  - `ende_dona_id` (FK): Relacionamento com a tabela `donatarios`.
  - `ende_func_id` (FK): Relacionamento com a tabela `funcionarios`.

---

## Relacionamentos entre as tabelas

1. **`donatarios`** está relacionado com:
   - `edital`
   - `vistorias`
   - `endereço`

2. **`funcionarios`** está relacionado com:
   - `edital`
   - `vistorias`
   - `endereço`

3. **`vistorias`** está relacionado com:
   - `relatiorios`
   - `reunioes`
