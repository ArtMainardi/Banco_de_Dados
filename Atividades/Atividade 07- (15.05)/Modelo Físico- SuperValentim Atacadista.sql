create database DB_SUPERVALENTIM_ATACADISTA;
use DB_SUPERVALENTIM_ATACADISTA;

# ==== CRIANDO TABELAS ====
# --- Tabela Filiais:
CREATE TABLE filiais (
    id_filial INT PRIMARY KEY AUTO_INCREMENT,
    id_sede INT,
    endereco_filial TINYTEXT,
    FOREIGN KEY (id_sede)
        REFERENCES filiais (id_filial)
);

# --- Tabela Turnos:
CREATE TABLE turnos (
    id_turno INT PRIMARY KEY AUTO_INCREMENT,
    turno VARCHAR(30)
);

# --- Tabela Cargos:
CREATE TABLE cargos (
    id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    cargo VARCHAR(30)
);

# --- Tabela Funcionarios:
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(30),
    cpf_funcionario CHAR(11),
    salario_funcionario DECIMAL(10 , 2 ),
    idade_funcionario INT,
    id_cargo INT,
    id_turno INT,
    FOREIGN KEY (id_cargo)
        REFERENCES cargos (id_cargo),
    FOREIGN KEY (id_turno)
        REFERENCES turnos (id_turno)
);

# --- Tabela Clientes:
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    cpf_cliente CHAR(11),
    telefone_cliente CHAR(11),
    idade_cliente INT,
    pontos_cliente INT
);

# --- Tabela Vendas:
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    valor_total DECIMAL(10 , 2 ),
    nota_cliente INT,
    feedback_cliente TINYTEXT,
    id_cliente INT,
    id_funcionario INT,
    id_filial INT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (id_filial)
        REFERENCES filiais (id_filial)
);

# --- Tabela Fornecedores:
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(30),
    endereco_fornecedor TINYTEXT,
    cnpj_fornecedor CHAR(14)
);

# --- Tabela Categorias:
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(30),
    descricao_categoria TINYTEXT
);

# --- Tabela Produtos:
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30),
    descricao_produto TINYTEXT,
    preco_produto DECIMAL(10 , 2 ),
    qtd_estoque INT,
    id_categoria INT,
    id_fornecedor INT,
    id_filial INT,
    FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria),
    FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedores (id_fornecedor),
    FOREIGN KEY (id_filial)
        REFERENCES filiais (id_filial)
);

# --- Tabela VendasProdutos (entidade Associativa: vendas - produtos):
CREATE TABLE vendasProdutos (
    id_venda INT,
    id_produto INT,
    PRIMARY KEY (id_venda , id_produto),
    qtd_produto_venda INT,
    FOREIGN KEY (id_venda)
        REFERENCES vendas (id_venda),
    FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto)
);

# --- Tabela Compras:
CREATE TABLE compras (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    data_compra DATE,
    data_entrega DATE,
    nota_entrega INT,
    feedback_entrega TINYTEXT,
    valor_total_compra DECIMAL(10 , 2 ),
    id_filial INT,
    FOREIGN KEY (id_filial)
        REFERENCES filiais (id_filial)
);

# --- Tabela CompraProdutos (entidade Associativa: compras - produtos):
CREATE TABLE compraProdutos (
    id_compra INT,
    id_produto INT,
    PRIMARY KEY (id_compra , id_produto),
    qtd_produto_compra INT,
    FOREIGN KEY (id_compra)
        REFERENCES compras (id_compra),
    FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto)
);