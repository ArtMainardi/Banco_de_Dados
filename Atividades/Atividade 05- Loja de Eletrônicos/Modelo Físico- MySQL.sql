# ===== CRIAÇÃO DO BANCO DE DADOS =====
create database DB_Loja_Eletronicos;
use DB_Loja_Eletronicos;


# ===== CRIAÇÃO DAS TABELAS =====
# --- Tabela Clientes ---
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(40) not null,
    cpf_cliente CHAR(11) not null,
    telefone_cliente CHAR(11) not null
);

# --- Tabela Vendas ---
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    valor_total_venda DECIMAL(10 , 2 ) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
);

# --- Tabela TiposPagamentos ---
CREATE TABLE tiposPagamentos (
    id_tipo_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo VARCHAR(40) not null,
    desconto_tipo DECIMAL(10 , 2 )
);

# --- Tabela Pagamentos ---
CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10 , 2 ) NOT NULL,
    id_tipo_pagamento INT,
    id_venda INT,
    FOREIGN KEY (id_tipo_pagamento)
        REFERENCES tiposPagamentos (id_tipo_pagamento),
    FOREIGN KEY (id_venda)
        REFERENCES vendas (id_venda)
);

# --- Tabela MarcasProduto ---
CREATE TABLE marcasProduto (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(40) NOT NULL
);

# --- Tabela CategoriasProduto ---
CREATE TABLE categoriasProduto (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(40) NOT NULL
);

# --- Tabela Produtos ---
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(40) NOT NULL,
    preco_produto DECIMAL(10 , 2 ) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_categoria INT,
    id_marca INT,
    FOREIGN KEY (id_categoria)
        REFERENCES categoriasProduto (id_categoria),
    FOREIGN KEY (id_marca)
        REFERENCES marcasProduto (id_marca)
);

# --- Tabela VendasProduto (entidade associativa -> vendas - produtos) ---
CREATE TABLE vendasProduto (
    id_produto INT,
    id_venda INT,
    PRIMARY KEY (id_produto , id_venda),
    quantidade_produto INT NOT NULL,
    valor_unitario DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto),
    FOREIGN KEY (id_venda)
        REFERENCES vendas (id_venda)
);