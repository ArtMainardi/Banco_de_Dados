# ===== CRIAÇÃO DO BANCO DE DADOS =====
create database DB_Manutencao_Industrial;
use DB_Manutencao_Industrial;


# ===== CRIAÇÃO DAS TABELAS =====
# --- Tabela Setores ---
CREATE TABLE setores (
    id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome_setor VARCHAR(30) NOT NULL
);

# --- Tabela Maquinas ---
CREATE TABLE maquinas (
    codigo_maquina INT PRIMARY KEY AUTO_INCREMENT,
    nome_maquina DATE NOT NULL,
    data_aquisicao DATE NOT NULL,
    id_setor INT,
    FOREIGN KEY (id_setor)
        REFERENCES setores (id_setor)
);

# --- Tabela Funcionarios ---
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(30) NOT NULL,
    cpf_funcionario CHAR(11) NOT NULL,
    especialidade_funcionario VARCHAR(30) NOT NULL
);

# --- Tabela Pecas ---
CREATE TABLE pecas (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(30) NOT NULL,
    qtd_estoque INT NOT NULL,
    qtd_minima_estoque INT NOT NULL
);

# --- Tabela StatusOS ---
CREATE TABLE statusOS (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    status_os VARCHAR(20) NOT NULL
);

# --- Tabela OrdensServico ---
CREATE TABLE ordensServico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    data_abertura DATE NOT NULL,
    data_fechamento DATE NOT NULL,
    id_status INT,
    id_funcionario INT,
    codigo_maquina INT,
    FOREIGN KEY (id_status)
        REFERENCES statusOS (id_status),
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios (id_funcionario),
    FOREIGN KEY (codigo_maquina)
        REFERENCES maquinas (codigo_maquina)
);

# --- Tabela RegistrosManutencao ---
CREATE TABLE registrosManutencao (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    descricao_registro VARCHAR(40) NOT NULL,
    horas_gastas INT NOT NULL,
    id_os INT,
    FOREIGN KEY (id_os)
        REFERENCES ordensServico (id_os)
);

# --- Tabela OsFuncionarios (entidade associativa -> OS - funcionarios) ---
CREATE TABLE osFuncionarios (
    id_os INT,
    id_funcionario INT,
    PRIMARY KEY (id_os , id_funcionario),
    FOREIGN KEY (id_os)
        REFERENCES ordensServico (id_os),
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios (id_funcionario)
);

# --- Tabela OsPecas (entidade associativa -> OS - pecas) ---
CREATE TABLE osPecas (
    id_os INT,
    id_peca INT,
    qtd_pecas INT NOT NULL,
    PRIMARY KEY (id_os , id_peca),
    FOREIGN KEY (id_os)
        REFERENCES ordensServico (id_os),
    FOREIGN KEY (id_peca)
        REFERENCES pecas (id_peca)
);