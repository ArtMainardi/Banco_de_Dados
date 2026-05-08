create database Lojinha;
use Lojinha;

-- Criação das Tabelas:
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(20),
    sobrenome_cliente VARCHAR(30),
    cpf_cliente VARCHAR(11),
    telefone_cliente VARCHAR(20),
    email_cliente VARCHAR(50),
    rua_cliente VARCHAR(50),
    numero_rua_cliente VARCHAR(5),
    cidade_cliente VARCHAR(30),
    cep_cliente VARCHAR(10)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    descricao_produto TEXT,
    preco_produto DECIMAL(10 , 2 ),
    categoria_produto VARCHAR(30),
    marca_produto VARCHAR(30),
    codigo_produto VARCHAR(100),
    validade_produto DATE,
    peso_produto DECIMAL(5 , 2 ),
    status_produto VARCHAR(30)
);

CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100),
    cnpj_fornecedor VARCHAR(30),
    email_fornecedor VARCHAR(50),
    status_fornecedor VARCHAR(30)
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    total_venda DECIMAL(10 , 2 ),
    forma_pagamento VARCHAR(30),
    desconto_venda DECIMAL(10 , 2 ),
    id_cliente INT,
    status_venda VARCHAR(30),
    hora_venda TIME,
    observacoes_venda TEXT,
    caixa_venda INT,
    FOREIGN KEY (id_cliente)
        REFERENCES Cliente (id_cliente)
);

CREATE TABLE Item_venda (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade_produto INT,
    preco_item_unitario DECIMAL(10 , 2 ),
    subtotal_item DECIMAL(10 , 2 ),
    desconto_item DECIMAL(10 , 2 ),
    imposto_item DECIMAL(10 , 2 ) DEFAULT 30.00,
    status_item VARCHAR(30),
    observacoes_item TEXT,
    FOREIGN KEY (id_venda)
        REFERENCES Venda (id_venda),
    FOREIGN KEY (id_produto)
        REFERENCES Produtos (id_produto)
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    quantidade_estoque INT,
    quantidade_minima INT,
    localizacao_estoque VARCHAR(30),
    data_entrada DATETIME,
    data_saida DATETIME,
    lote_estoque VARCHAR(30),
    status_estoque VARCHAR(30),
    validade_estoque DATE,
    FOREIGN KEY (id_produto)
        REFERENCES Produtos (id_produto)
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    tipo_pagamento VARCHAR(30),
    data_pagamento DATETIME,
    status_pagamento VARCHAR(30),
    parcelas_pagamento INT,
    bandeira_pagamento VARCHAR(10),
    autorizacao_pagamento INT,
    observacoes_pagamento TEXT,
    FOREIGN KEY (id_venda)
        REFERENCES Venda (id_venda)
);

-- Visualização das Tabelas:
select * from Cliente;
select * from Produtos;
select * from Fornecedor;
select * from Venda;
select * from Item_venda;
select * from estoque;
select * from pagamento;