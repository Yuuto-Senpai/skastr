-- Criação da tabela Empresas
CREATE TABLE tb_empresas (
    id_empr SERIAL PRIMARY KEY,
    empr_nome VARCHAR(255) NOT NULL,
    empr_endereco VARCHAR(255),
    empr_email VARCHAR(255) UNIQUE NOT NULL,
    empr_senha VARCHAR(512) NOT NULL,
    empr_telefone VARCHAR(20),
    empr_descricao TEXT,
    empr_cep VARCHAR(10),
    empr_cidade VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela Produtos
CREATE TABLE tb_produtos (
    id_prod SERIAL PRIMARY KEY,
    id_empr INT REFERENCES tb_empresas(id_empr),
    prod_nome VARCHAR(255) NOT NULL,
    prod_descricao TEXT,
    prod_preco NUMERIC(10, 2) NOT NULL,
    prod_categoria VARCHAR(50),
    prod_subcategoria VARCHAR(50),
    prod_stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Tipos de Usuário
CREATE TABLE tb_tiposusuario (
    id_tipousuario SERIAL PRIMARY KEY,
    tipousuario_nome VARCHAR(50) UNIQUE NOT NULL
);

-- Popula a tabela de Tipos de Usuário
INSERT INTO tb_tiposusuario (tipousuario_nome) VALUES ('Administrador'), ('Cliente'), ('Funcionario');

-- Criação da tabela Clientes
CREATE TABLE tb_clientes (
    id_cli SERIAL PRIMARY KEY,
    cli_nome VARCHAR(255) NOT NULL,
    cli_cpf CHAR(11) UNIQUE,
    cli_cnpj CHAR(14) UNIQUE,
    cli_email VARCHAR(255) UNIQUE NOT NULL,
    cli_senha VARCHAR(512) NOT NULL,
    cli_datanasc DATE,
    cli_genero CHAR(1),
    cli_tipo INT REFERENCES tb_tiposusuario(id_tipousuario),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Compras
CREATE TABLE tb_compras (
    id_comp SERIAL PRIMARY KEY,
    id_cli INT REFERENCES tb_clientes(id_cli),
    comp_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comp_status VARCHAR(50) DEFAULT 'Pendente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Itens de Compra
CREATE TABLE tb_itenscompras (
    id_itemcomp SERIAL PRIMARY KEY,
    id_comp INT REFERENCES tb_compras(id_comp),
    id_prod INT REFERENCES tb_produtos(id_prod),
    itemcomp_quantidade INT NOT NULL CHECK (itemcomp_quantidade > 0),
    itemcomp_precounitario NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de índices para otimizar as pesquisas
CREATE INDEX idx_empresa_nome ON tb_empresas(empr_nome);
CREATE INDEX idx_produto_nome ON tb_produtos(prod_nome);
CREATE INDEX idx_cliente_email ON tb_clientes(cli_email);
CREATE INDEX idx_cliente_cpf ON tb_clientes(cli_cpf);
CREATE INDEX idx_cliente_cnpj ON tb_clientes(cli_cnpj);


--v1.0.1

ALTER TABLE tb_clientes
ALTER COLUMN cli_cpf TYPE VARCHAR(14);

ALTER TABLE tb_clientes
ALTER COLUMN cli_cnpj TYPE VARCHAR(18);


COMMENT ON TABLE tb_empresas IS 'Tabela que armazena informações sobre as empresas';
COMMENT ON COLUMN tb_empresas.id_empr IS 'ID único para cada empresa';
COMMENT ON TABLE tb_produtos IS 'Tabela que armazena informações sobre os produtos';
COMMENT ON COLUMN tb_produtos.id_prod IS 'ID único para cada produto';
COMMENT ON TABLE tb_tiposusuario IS 'Tabela que armazena informações sobre os tipos de usuários';
COMMENT ON COLUMN tb_tiposusuario.id_tipousuario IS 'ID único para cada tipo de usuarios';
COMMENT ON TABLE tb_clientes IS 'Tabela que armazena informações sobre os usuários';
COMMENT ON COLUMN tb_clientes.id_cli IS 'ID único para cada usuário';
COMMENT ON TABLE tb_compras IS 'Tabela que armazena informações sobre as compras';
COMMENT ON COLUMN tb_compras.id_comp IS 'ID único para cada compra';
COMMENT ON TABLE tb_itenscompras IS 'Tabela que armazena informações sobre os itens comprados';
COMMENT ON COLUMN tb_itenscompras.id_itemcomp IS 'ID único para cada tipousuarios';

ALTER TABLE tb_itenscompras
ADD COLUMN id_empr INT REFERENCES tb_empresas(id_empr);

--v1.0.2
-- Criando a tabela de Categorias
CREATE TABLE tb_categorias (
    id_categoria SERIAL PRIMARY KEY,
    categoria_nome VARCHAR(50) UNIQUE NOT NULL
);

-- Criando a tabela de Subcategorias
CREATE TABLE tb_subcategorias (
    id_subcategoria SERIAL PRIMARY KEY,
    id_categoria INT REFERENCES tb_categorias(id_categoria),
    subcategoria_nome VARCHAR(50) UNIQUE NOT NULL
);

-- Adicionando colunas de id_categoria e id_subcategoria na tabela de Produtos
ALTER TABLE tb_produtos
ADD COLUMN id_categoria INT REFERENCES tb_categorias(id_categoria),
ADD COLUMN id_subcategoria INT REFERENCES tb_subcategorias(id_subcategoria);

-- Removendo as colunas antigas de categoria e subcategoria
ALTER TABLE tb_produtos
DROP COLUMN prod_categoria,
DROP COLUMN prod_subcategoria;

-- Criando a tabela de Auditoria
CREATE TABLE tb_auditoria (
    id_audit SERIAL PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    id_registro_afetado INT,
    operacao VARCHAR(10),
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Adicionando a coluna id_empr na tabela tb_itenscompras (já existe em seu script, apenas para referência)
ALTER TABLE tb_itenscompras
ADD COLUMN id_empr INT REFERENCES tb_empresas(id_empr);

-- Atualizando os tipos de dados para CPF e CNPJ em tb_clientes (já existe em seu script, apenas para referência)
ALTER TABLE tb_clientes
ALTER COLUMN cli_cpf TYPE VARCHAR(14),
ALTER COLUMN cli_cnpj TYPE VARCHAR(18);

-- v1.0.3
-- Adicionando CHECK para email em tb_empresas
ALTER TABLE tb_empresas
ADD CONSTRAINT chk_email_format CHECK (empr_email ~* '^.+@.+\..+$');

-- Adicionando CHECK para CEP em tb_empresas
ALTER TABLE tb_empresas
ADD CONSTRAINT chk_cep_format CHECK (empr_cep ~ '[0-9]{5}-?[0-9]{3}');

-- Adicionando CHECK para preço em tb_produtos
ALTER TABLE tb_produtos
ADD CONSTRAINT chk_preco_non_negative CHECK (prod_preco >= 0);

-- Adicionando CHECK para estoque em tb_produtos
ALTER TABLE tb_produtos
ADD CONSTRAINT chk_stock_non_negative CHECK (prod_stock >= 0);

-- Adicionando CHECK para status em tb_compras
ALTER TABLE tb_compras
ADD CONSTRAINT chk_status_values CHECK (comp_status IN ('Pendente', 'Aprovado', 'Cancelado'));

-- Adicionando CHECK para operação em tb_auditoria
ALTER TABLE tb_auditoria
ADD CONSTRAINT chk_operacao_values CHECK (operacao IN ('INSERT', 'UPDATE', 'DELETE'));

-- Adicionando índices adicionais
CREATE INDEX idx_empresa_cidade ON tb_empresas(empr_cidade);
CREATE INDEX idx_cliente_tipo ON tb_clientes(cli_tipo);

-- v1.0.4