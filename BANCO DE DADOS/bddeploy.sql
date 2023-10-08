-- Criação da tabela Empresas
CREATE TABLE tb_empresas (
    id_empr SERIAL PRIMARY KEY,
    empr_nome VARCHAR(255) NOT NULL,
    empr_endereco VARCHAR(255),
    empr_email VARCHAR(255) UNIQUE NOT NULL CHECK (empr_email ~* '^.+@.+\..+$'),
    empr_senha VARCHAR(512) NOT NULL,
    empr_telefone VARCHAR(20),
    empr_descricao TEXT,
    empr_cep VARCHAR(10) CHECK (empr_cep ~ '[0-9]{5}-?[0-9]{3}'),
    empr_cidade VARCHAR(150),
    empr_status VARCHAR(50) DEFAULT 'Ativa' CHECK (empr_status IN ('Ativa', 'Inativa')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela Categorias
CREATE TABLE tb_categorias (
    id_categoria SERIAL PRIMARY KEY,
    categoria_nome VARCHAR(50) UNIQUE NOT NULL
);

-- Criação da tabela Subcategorias
CREATE TABLE tb_subcategorias (
    id_subcategoria SERIAL PRIMARY KEY,
    id_categoria INT REFERENCES tb_categorias(id_categoria),
    subcategoria_nome VARCHAR(50) UNIQUE NOT NULL
);

-- Criação da tabela Produtos
CREATE TABLE tb_produtos (
    id_prod SERIAL PRIMARY KEY,
    id_empr INT REFERENCES tb_empresas(id_empr),
    id_categoria INT REFERENCES tb_categorias(id_categoria),
    id_subcategoria INT REFERENCES tb_subcategorias(id_subcategoria),
    prod_nome VARCHAR(255) NOT NULL,
    prod_descricao TEXT,
    prod_preco NUMERIC(10, 2) NOT NULL CHECK (prod_preco >= 0),
    prod_stock INT CHECK (prod_stock >= 0),
    prod_desconto NUMERIC(10, 2) DEFAULT 0.0 CHECK (prod_desconto >= 0 AND prod_desconto <= 100),
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
    cli_cpf VARCHAR(14) UNIQUE,
    cli_cnpj VARCHAR(18) UNIQUE,
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
    comp_status VARCHAR(50) DEFAULT 'Pendente' CHECK (comp_status IN ('Pendente', 'Aprovado', 'Cancelado')),
    comp_validade TIMESTAMP,
    comp_metodo_pagamento VARCHAR(50) CHECK (comp_metodo_pagamento IN ('Cartão de Crédito', 'Boleto', 'Débito')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Itens de Compra
CREATE TABLE tb_itenscompras (
    id_itemcomp SERIAL PRIMARY KEY,
    id_comp INT REFERENCES tb_compras(id_comp),
    id_prod INT REFERENCES tb_produtos(id_prod),
    id_empr INT REFERENCES tb_empresas(id_empr),
    itemcomp_quantidade INT NOT NULL CHECK (itemcomp_quantidade > 0),
    itemcomp_precounitario NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Auditoria
CREATE TABLE tb_auditoria (
    id_audit SERIAL PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    id_registro_afetado INT,
    operacao VARCHAR(10) CHECK (operacao IN ('INSERT', 'UPDATE', 'DELETE')),
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação de índices para otimizar as pesquisas
CREATE INDEX idx_empresa_nome ON tb_empresas(empr_nome);
CREATE INDEX idx_produto_nome ON tb_produtos(prod_nome);
CREATE INDEX idx_cliente_email ON tb_clientes(cli_email);
CREATE INDEX idx_cliente_cpf ON tb_clientes(cli_cpf);
CREATE INDEX idx_cliente_cnpj ON tb_clientes(cli_cnpj);
CREATE INDEX idx_empresa_cidade ON tb_empresas(empr_cidade);
CREATE INDEX idx_cliente_tipo ON tb_clientes(cli_tipo);
CREATE INDEX idx_prod_desconto ON tb_produtos(prod_desconto);
CREATE INDEX idx_comp_metodo_pagamento ON tb_compras(comp_metodo_pagamento);
CREATE INDEX idx_empr_status ON tb_empresas(empr_status);
