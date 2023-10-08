-- Tabela pra armazenar informações das empresas
CREATE TABLE tb_empresas (
   id_emp SERIAL PRIMARY KEY,
   emp_nome VARCHAR(255) NOT NULL CHECK (LENGTH(emp_nome) > 0),
   emp_ende VARCHAR(255),
   emp_email VARCHAR(255) UNIQUE NOT NULL CHECK (emp_email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
);

-- Tabela para armazenar informações dos produtos
CREATE TABLE tb_produtos (
   id_prod SERIAL PRIMARY KEY,
   prod_nome VARCHAR(255) NOT NULL CHECK (LENGTH(prod_nome) > 0),
   prod_desc TEXT,
   prod_prec DECIMAL(10,2) NOT NULL CHECK (prod_prec > 0),
   id_emp INT REFERENCES tb_empresas(id_emp)
);

-- Tabela para armazenar informações dos usuários
CREATE TABLE tb_usuarios (
   id_usr SERIAL PRIMARY KEY,
   usr_nome VARCHAR(255) NOT NULL CHECK (LENGTH(usr_nome) > 0),
   usr_email VARCHAR(255) NOT NULL CHECK (usr_email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'),
   usr_hash VARCHAR(255) NOT NULL
);

-- Tabela para mensagens enviadas pelos usuários às empresas
CREATE TABLE tb_mensagens (
   id_mens SERIAL PRIMARY KEY,
   mens_cont TEXT NOT NULL CHECK (LENGTH(mens_cont) > 0),
   id_usr INT REFERENCES tb_usuarios(id_usr),
   id_emp INT REFERENCES tb_empresas(id_emp)
);

-- Tabela para armanezar categorias dos produtos
CREATE TABLE tb_categorias (
   id_cat SERIAL PRIMARY KEY,
   cat_nome VARCHAR(255) NOT NULL CHECK (LENGTH(cat_nome) > 0)
);

-- Tabela para relacionar produtos e suas categorias(multivalorada)
CREATE TABLE prod_cat (
   id_prod INT REFERENCES tb_produtos(id_prod),
   id_cat INT REFERENCES tb_categorias(id_cat),
   PRIMARY KEY (id_prod, id_cat)
);
