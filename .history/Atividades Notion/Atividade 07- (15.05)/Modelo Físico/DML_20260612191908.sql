# =========================================================================
# 1. TABELA: filiais (Auto-relacionamento: Sedes inseridas primeiro)
# =========================================================================
-- Primeiro inserimos as sedes (id_sede nulo ou apontando para elas mesmas após a criação)
INSERT INTO filiais (id_sede, endereco_filial) VALUES 
(NULL, 'Av. Paulista, 1000 - São Paulo/SP'),
(NULL, 'Av. Rio Branco, 500 - Rio de Janeiro/RJ'),
(NULL, 'Av. Olegário Maciel, 300 - Belo Horizonte/MG'),
(NULL, 'Av. Sete de Setembro, 1200 - Curitiba/PR'),
(NULL, 'Av. Farrapos, 450 - Porto Alegre/RS');

-- Agora inserimos as filiais que dependem das sedes acima
INSERT INTO filiais (id_sede, endereco_filial) VALUES 
(1, 'Rua Augusta, 450 - São Paulo/SP'),
(1, 'Av. Rebouças, 2200 - São Paulo/SP'),
(1, 'Rua Domingos de Morais, 800 - São Paulo/SP'),
(2, 'Rua Copacabana, 150 - Rio de Janeiro/RJ'),
(2, 'Av. das Américas, 3000 - Rio de Janeiro/RJ'),
(3, 'Av. Afonso Pena, 1500 - Belo Horizonte/MG'),
(3, 'Rua Paraíba, 400 - Belo Horizonte/MG'),
(4, 'Rua XV de Novembro, 600 - Curitiba/PR'),
(4, 'Av. Batel, 900 - Curitiba/PR'),
(5, 'Av. Ipiranga, 2000 - Porto Alegre/RS'),
(5, 'Rua dos Andradas, 1100 - Porto Alegre/RS'),
(1, 'Av. Cruzeiro do Sul, 1800 - São Paulo/SP'),
(2, 'Rua São Francisco Xavier, 500 - Rio de Janeiro/RJ'),
(3, 'Av. Amazonas, 2100 - Belo Horizonte/MG'),
(4, 'Av. Visconde de Guarapuava, 3500 - Curitiba/PR');

# =========================================================================
# 2. TABELA: turnos
# =========================================================================
INSERT INTO turnos (turno) VALUES 
('Matutino'), ('Vespertino'), ('Noturno'), ('Madrugada'), ('Comercial'),
('Intermediário A'), ('Intermediário B'), ('Fim de Semana'), ('Plantão Diurno'), ('Plantão Noturno'),
('Escala 6x1 M'), ('Escala 6x1 V'), ('Escala 6x1 N'), ('Escala 12x36 D'), ('Escala 12x36 N'),
('Part-Time M'), ('Part-Time V'), ('Especial Natal'), ('Especial Ano Novo'), ('Sazonal');

# =========================================================================
# 3. TABELA: cargos
# =========================================================================
INSERT INTO cargos (cargo) VALUES 
('Diretor Executivo'), ('Gerente Geral'), ('Supervisor de Operações'), ('Coordenador de RH'), ('Analista Financeiro'),
('Comprador Sênior'), ('Encarregado de Estoque'), ('Operador de Caixa'), ('Repositor de Mercadorias'), ('Auxiliar de Limpeza'),
('Fiscal de Loja'), ('Conferente'), ('Açougueiro'), ('Padeiro'), ('Atendente de Balcão'),
('Motorista'), ('Analista de TI'), ('Assistente de Marketing'), ('Nutricionista'), ('Técnico de Manutenção');

# =========================================================================
# 4. TABELA: funcionarios
# =========================================================================
INSERT INTO funcionarios (nome_funcionario, cpf_funcionario, salario_funcionario, idade_funcionario, id_cargo, id_turno) VALUES 
('Carlos Silva', '11122233344', 12000.00, 45, 1, 5),
('Ana Pires', '22233344455', 6500.00, 38, 2, 5),
('Marcos Souza', '33344455566', 4200.00, 32, 3, 1),
('Julia Costa', '44455566677', 3800.00, 29, 4, 5),
('Roberto Santos', '55566677788', 3500.00, 27, 5, 5),
('Fernanda Lima', '66677788899', 4800.00, 41, 6, 5),
('Ricardo Alves', '77788899900', 2800.00, 35, 7, 1),
('Beatriz Melo', '88899900011', 2100.00, 22, 8, 1),
('Lucas Gabriel', '99900011122', 2100.00, 20, 8, 2),
('Camila Oliveira', '00011122233', 1900.00, 24, 9, 2),
('Thiago Pereira', '12345678901', 1900.00, 26, 9, 3),
('Amanda Rodrigues', '23456789012', 1700.00, 50, 10, 1),
('Bruno Cezar', '34567890123', 2200.00, 31, 11, 3),
('Daniela Dias', '45678901234', 2400.00, 28, 12, 1),
('Eduardo Nunes', '56789012345', 2600.00, 34, 13, 1),
('Fabiana Guedes', '67890123456', 2600.00, 33, 14, 4),
('Gabriel Jesus', '78901234567', 1800.00, 21, 15, 2),
('Hugo Leonardo', '89012345678', 2900.00, 40, 16, 5),
('Isabela Reis', '90123456789', 4000.00, 26, 17, 5),
('Jonathan Prado', '01234567890', 2500.00, 29, 18, 5);