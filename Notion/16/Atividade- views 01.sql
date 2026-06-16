-- Active: 1780436273590@@127.0.0.1@3307@INDUSTRIA
# https://app.notion.com/p/Atividade-views-01-381edc33d7e580ad9f80e7ecf4148821?source=copy_link

# 1- Crie um banco de dados chamado INDUSTRIA.
CREATE DATABASE INDUSTRIA;

# 2/3- Crie uma tabela chamada FUNCIONARIO.
CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(50),
    estado CHAR(2),
    status_funcionario VARCHAR(20) DEFAULT 'Ativo',
    CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario)
);

# 4- Insira alguns registros na tabela.
INSERT INTO FUNCIONARIO (nome, cargo, setor, data_admissao, salario, email, telefone, cidade, estado, status_funcionario)
VALUES 
('Ana Silva', 'Analista de Sistemas', 'TI', '2023-03-15', 6500.00, 'ana.silva@empresa.com', '(11) 99999-1111', 'São Paulo', 'SP', 'Ativo'),
('Carlos Souza', 'Gerente de Projetos', 'PMO', '2021-08-10', 12000.00, 'carlos.souza@empresa.com', '(21) 98888-2222', 'Rio de Janeiro', 'RJ', 'Ativo'),
('Mariana Costa', 'Designer UX/UI', 'Marketing', '2024-01-10', 5200.00, 'mariana.costa@empresa.com', '(31) 97777-3333', 'Belo Horizonte', 'MG', 'Ativo'),
('Ricardo Alves', 'Analista de Suporte', 'TI', '2022-11-01', 3800.00, 'ricardo.alves@empresa.com', '(11) 96666-4444', 'Campinas', 'SP', 'Inativo'),
('Beatriz Santos', 'Coordenadora de RH', 'Recursos Humanos', '2020-05-20', 8500.00, 'beatriz.santos@empresa.com', '(41) 95555-5555', 'Curitiba', 'PR', 'Ativo');

# 5- Crie uma view contendo apenas os campos de 'nome, cargo, setor':
CREATE VIEW VisualizarFuncionario AS
    SELECT nome, cargo, setor FROM `FUNCIONARIO`;
SELECT * FROM VisualizarFuncionario;

# 6- Realize consultas na view utilizando a cláusula WHERE.
SELECT * FROM VisualizarFuncionario WHERE nome LIKE '%a';
SELECT * FROM VisualizarFuncionario WHERE setor = 'Recursos Humanos';

# 7- Liste todos os funcionários pertencentes a um setor específico informado pelo professor.
SELECT * FROM VisualizarFuncionario WHERE setor = 'TI';

# 8- Liste todos os funcionários cujo cargo contenha uma palavra-chave definida pelo professor.
SELECT * FROM VisualizarFuncionario WHERE cargo LIKE '%analista%';