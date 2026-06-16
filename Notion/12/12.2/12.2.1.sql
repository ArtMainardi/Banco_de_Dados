-- Active: 1780436273590@@127.0.0.1@3307
create DATABASE BancoDados;

# 1- Conceda todos os privilégios para o usuário criado com o seu nome.
create user 'arthur'@'localhost' IDENTIFIED by '123123';
grant all on *.* to 'arthur'@'localhost';

# 2- Crie uma nova base de dados contendo duas tabelas com pelo menos três colunas cada.
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

# 3- Crie um novo usuário chamado programador.
CREATE USER 'programador'@'localhost' IDENTIFIED BY 'senha123';

# 4- Conceda ao usuário programador apenas os privilégios de manipulação de dados (SELECT, INSERT e UPDATE) em apenas uma das tabelas criadas.
GRANT SELECT, INSERT, UPDATE on usuario to 'programador'@'localhost';