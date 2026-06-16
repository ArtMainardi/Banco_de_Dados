-- Active: 1780436273590@@127.0.0.1@3307@vamosla

/* Considerando o banco de dados vamosla, crie uma role chamada app_desativado e remova 
todas as permissões do usuário usuario_desenvolvedor, simulando uma situação em que a 
conta continua cadastrada no sistema, porém sem acesso operacional ao banco de dados.*/

# == DDL ==
create database vamosla;
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

# == DCL ==
CREATE ROLE'app_desenvolvedor', 'app_leitura', 'app_escrita';
GRANT ALL ON vamosla.*TO'app_desenvolvedor';
GRANT SELECT ON vamosla.*TO'app_leitura';
GRANT INSERT,UPDATE,DELETE ON vamosla.* TO'app_escrita';

CREATE USER'usuario_desenvolvedor'@'localhost';
CREATE USER'usuario_leitura'@'localhost';
CREATE USER'usuario_escrita'@'localhost';

GRANT'app_desenvolvedor' TO'usuario_desenvolvedor'@'localhost';
GRANT'app_leitura' TO'usuario_leitura'@'localhost';
GRANT'app_leitura', 'app_escrita' TO'usuario_escrita'@'localhost';

CREATE ROLE 'app_desativado';
REVOKE 'app_desenvolvedor' FROM 'usuario_desenvolvedor'@'localhost';
GRANT 'app_desativado' TO 'usuario_desenvolvedor'@'localhost';
