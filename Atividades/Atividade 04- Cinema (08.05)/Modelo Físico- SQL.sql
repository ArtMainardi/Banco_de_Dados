# ==== CRIANDO DATABASE ===
create database db_cinema;
use db_cinema;


# ==== CRIANDO TABELAS ====
# -> Tabela salas:
CREATE TABLE salas (
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    descricao_sala TEXT,
    projecao_3d BOOL,
    sala_vip BOOL
);

# -> Tabela filmes:
CREATE TABLE filmes (
    id_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo_filme VARCHAR(40),
    descricao_filme TEXT,
    categoria_filme VARCHAR(20),
    faixa_etaria INT
);

# -> Tabela sessoes (entidade associativa-> salas - filmes):
CREATE TABLE sessoes (
    id_sessao INT PRIMARY KEY AUTO_INCREMENT,
    id_filme INT,
    id_sala INT,
    horario INT,
    FOREIGN KEY (id_filme)
        REFERENCES filmes (id_filme),
    FOREIGN KEY (id_sala)
        REFERENCES salas (id_sala)
);

# -> Tabela Clientes:
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(40),
    cpf_cliente CHAR(11),
    telefone_cliente CHAR(11),
    rg_cliente VARCHAR(20)
);

# -> Tabela Pedidos:
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    tipo_pagamento_pedido ENUM('PIX', 'CREDITO', 'DINHEIRO'),
    data_pedido DATE,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
);

# -> Tabela TipoIngressos:
CREATE TABLE tipo_ingressos (
    id_tipo_ingresso INT PRIMARY KEY AUTO_INCREMENT,
    descricao_tipo_ingresso TEXT,
    valor_tipo_ingresso DECIMAL(10 , 2 )
);

# -> Tabela Ingressos (entidade associativa-> pedidos - tipoIngressos - sessoes):
CREATE TABLE ingressos (
    id_ingresso INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_ingresso INT,
    id_pedido INT,
    id_sessao INT,
    FOREIGN KEY (id_tipo_ingresso)
        REFERENCES tipo_ingressos (id_tipo_ingresso),
    FOREIGN KEY (id_pedido)
        REFERENCES pedidos (id_pedido),
    FOREIGN KEY (id_sessao)
        REFERENCES sessoes (id_sessao)
);