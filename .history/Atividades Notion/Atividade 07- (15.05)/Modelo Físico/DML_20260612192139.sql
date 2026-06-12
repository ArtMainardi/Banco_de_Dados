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

# =========================================================================
# 5. TABELA: clientes
# =========================================================================
INSERT INTO clientes (cpf_cliente, telefone_cliente, idade_cliente, pontos_cliente) VALUES 
('10120230340', '11988887777', 34, 150),
('20230340450', '11977776666', 28, 420),
('30340450560', '21966665555', 45, 80),
('40450560670', '21955554444', 52, 1200),
('50460670780', '31944443333', 23, 25),
('60570780890', '31933332222', 61, 640),
('70680890900', '41922221111', 39, 310),
('80790900010', '41911110000', 31, 95),
('90800010120', '51900009999', 26, 510),
('00910120230', '51999998888', 48, 180),
('11223344556', '11912345678', 37, 75),
('22334455667', '21923456789', 29, 340),
('33445566778', '31934567890', 42, 120),
('44455667788', '41945678901', 50, 890),
('55566778899', '51956789012', 19, 10),
('66677889900', '11967890123', 55, 2300),
('77788990011', '21978901234', 33, 415),
('88899001122', '31989012345', 27, 60),
('99900112233', '41990123456', 64, 1150),
('00011223344', '51901234567', 41, 285);

# =========================================================================
# 6. TABELA: vendas
# =========================================================================
INSERT INTO vendas (data_venda, valor_total, nota_cliente, feedback_cliente, id_cliente, id_funcionario, id_filial) VALUES 
('2026-01-10', 350.50, 5, 'Excelente atendimento no caixa.', 1, 8, 6),
('2026-01-11', 1200.00, 4, 'Preços bons, mas fila um pouco demorada.', 2, 9, 6),
('2026-01-12', 85.40, 5, 'Rápido e prático.', 3, 8, 9),
('2026-01-15', 540.00, 3, 'Faltaram alguns produtos na prateleira.', 4, 9, 10),
('2026-01-18', 210.25, 5, 'Muito limpo e organizado.', 5, 8, 11),
('2026-01-20', 95.00, 4, 'Estacionamento cheio.', 6, 9, 12),
('2026-01-22', 1500.80, 5, 'Ótimo para compras no atacado.', 7, 8, 13),
('2026-01-25', 320.00, 2, 'Atendente do balcão foi um pouco ríspido.', 8, 9, 14),
('2026-01-28', 430.10, 4, 'Boa variedade de marcas.', 9, 8, 15),
('2026-02-02', 75.00, 5, 'Tudo perfeito.', 10, 9, 16),
('2026-02-05', 680.40, 4, 'Gostei das promoções da semana.', 11, 8, 6),
('2026-02-07', 115.00, 3, 'Setor de hortifrúti estava desfalcado.', 12, 9, 7),
('2026-02-10', 890.00, 5, 'Preço de atacado imbatível.', 13, 8, 11),
('2026-02-12', 245.50, 4, 'Atendimento padrão.', 14, 9, 13),
('2026-02-15', 53.00, 5, 'Caixa rápido foi bem rápido mesmo.', 15, 8, 15),
('2026-02-18', 3100.00, 5, 'Compra grande para meu restaurante, ótimo suporte.', 16, 9, 1),
('2026-02-20', 420.00, 4, 'Satisfeito.', 17, 8, 2),
('2026-02-22', 190.00, 3, 'Ar condicionado estava muito frio.', 18, 9, 3),
('2026-02-25', 740.00, 5, 'Melhor atacado da região.', 19, 8, 4),
('2026-02-28', 135.20, 4, 'Sem problemas.', 20, 9, 5);

# =========================================================================
# 7. TABELA: fornecedores
# =========================================================================
INSERT INTO fornecedores (nome_fornecedor, endereco_fornecedor, cnpj_fornecedor) VALUES 
('Ambev S/A', 'Av. Antarctica, 1000 - São Paulo/SP', '12345678000101'),
('Nestlé Brasil', 'Av. Chucri Zaidan, 200 - São Paulo/SP', '23456789000102'),
('Unilever Brasil', 'Av. Rebouças, 4000 - São Paulo/SP', '34567890000103'),
('JBS Friboi', 'Av. Marginal Direita do Tietê, 500 - São Paulo/SP', '45678901000104'),
('BRF Alimentos', 'Rua Tornado, 150 - Itajaí/SC', '56789012000105'),
('P&G Industrial', 'Rodovia Anchieta, Km 18 - São Bernardo/SP', '67890123000106'),
('Coca-Cola FEMSA', 'Estrada de Itapecerica, 5000 - São Paulo/SP', '78901234000107'),
('M. Dias Branco', 'Rodovia BR-116, Km 4 - Eusébio/CE', '89012345000108'),
('Danone Ltda', 'Av. Paulista, 2300 - São Paulo/SP', '90123456000109'),
('Kimberly-Clark', 'Av. Nações Unidas, 14000 - São Paulo/SP', '01234567000110'),
('Bunge Alimentos', 'Rua Diogo Moreira, 180 - São Paulo/SP', '11223344000122'),
('Camil Alimentos', 'Av. Estado, 5000 - São Paulo/SP', '22334455000133'),
('Mondelez Brasil', 'Rua Bento Gonçalves, 300 - Curitiba/PR', '33445566000144'),
('Colgate-Palmolive', 'Av. Jaguaré, 800 - São Paulo/SP', '44556677000155'),
('Johnson & Johnson', 'Rod. Presidente Dutra, Km 154 - São José dos Campos/SP', '55667788000166'),
('Seara Alimentos', 'Av. Marginal Direita, 550 - São Paulo/SP', '66778899000177'),
('Aurora Alimentos', 'Rua Silveira Martins, 150 - Chapecó/SC', '77889900000188'),
('Santa Helena Amendoim', 'Rua Ribeirão Preto, 400 - Ribeirão Preto/SP', '88990011000199'),
('Piracanjuba Laticínios', 'Rodovia GO-020, Km 2 - Bela Vista/GO', '99001122000111'),
('Itambé Alimentos', 'Av. Contorno, 8000 - Belo Horizonte/MG', '00112233000122');

# =========================================================================
# 8. TABELA: categorias
# =========================================================================
INSERT INTO categorias (nome_categoria, descricao_categoria) VALUES 
('Bebidas', 'Refrigerantes, sucos, águas e alcoólicos'),
('Mercearia', 'Arroz, feijão, massas e óleos'),
('Carnes e Aves', 'Cortes bovinos, suínos e aves frescas ou congeladas'),
('Laticínios', 'Leites, queijos, iogurtes e manteigas'),
('Higiene Pessoal', 'Shampoos, sabonetes, cremes dentais e desodorantes'),
('Limpeza', 'Detergentes, amaciantes, desinfetantes e sabão em pó'),
('Hortifrúti', 'Frutas, legumes e verduras frescas'),
('Padaria', 'Pães, bolos, salgados e doces'),
('Congelados', 'Pratos prontos, pizzas e hambúrgueres congelados'),
('Biscoitos e Snacks', 'Salgadinhos, bolachas doces e recheadas'),
('Pet Shop', 'Rações, petiscos e areia para gatos'),
('Bazar e Utilidades', 'Pratos, copos, talheres e potes plásticos'),
('Automotivo', 'Óleos, ceras e fluidos para veículos'),
('Papelaria', 'Cadernos, canetas, papéis e envelopes'),
('Eletro', 'Pequenos eletrodomésticos e eletrônicos de consumo'),
('Tabacaria', 'Isqueiros, palhas e carvão para narguilé/churrasco'),
('Bomboniere', 'Balas, chocolates, gomas de mascar e pirulitos'),
('Matinais', 'Cafés, achocolatados, cereais e chás'),
('Conservas e Molhos', 'Extrato de tomate, azeitonas, milho e ervilha'),
('Suplementos', 'Whey protein, creatina e barras de proteína');

# =========================================================================
# 9. TABELA: produtos
# =========================================================================
INSERT INTO produtos (nome_produto, descricao_produto, preco_produto, qtd_estoque, id_categoria, id_fornecedor, id_filial) VALUES 
('Cerveja Skol Latão 473ml', 'Fardo com 12 unidades', 45.00, 500, 1, 1, 6),
('Café Solúvel Nescafé 200g', 'Vidro tradicional', 18.50, 200, 18, 2, 7),
('Sabão em Pó Omo 1.6kg', 'Lavagem perfeita', 22.90, 150, 6, 3, 8),
('Contra Filé Friboi KG', 'Peça resfriada a vácuo', 42.90, 80, 3, 4, 9),
('Lasanha Seara 600g', 'Sabor Quatro Queijos', 12.50, 120, 9, 16, 10),
('Shampoo Pantene 400ml', 'Restauração intensa', 19.90, 90, 5, 6, 11),
('Coca-Cola Pet 2L', 'Fardo com 6 unidades', 48.00, 400, 1, 7, 12),
('Biscoito Cream Cracker 400g', 'M. Dias Branco tradicional', 5.20, 300, 10, 8, 13),
('Iogurte Grego Danone 400g', 'Bandeja com 4 unidades', 8.50, 100, 4, 9, 14),
('Papel Higiênico Neve Leve 12', 'Folha dupla 30 metros', 24.00, 180, 5, 10, 15),
('Óleo de Soja Soya 900ml', 'Caixa com 20 unidades', 130.00, 60, 2, 11, 16),
('Arroz Camil Tipo 1 - 5kg', 'Pacote fardo com 6', 150.00, 75, 2, 12, 17),
('Chocolate Lacta Barra 90g', 'Ao leite tradicional', 5.50, 450, 17, 13, 1),
('Creme Dental Colgate 90g', 'Total 12 proteção', 6.80, 350, 5, 14, 2),
('Sempre Livre Com Abas 32un', 'Adapt Plus', 14.20, 140, 5, 15, 3),
('Frango Passarinho Seara 1kg', 'Congelado IQF', 16.90, 210, 3, 16, 4),
('Linguiça Toscana Aurora 1kg', 'Pacote resfriado', 19.90, 130, 3, 17, 5),
('Amendoim Ovinhos Pettiz 150g', 'Santa Helena tradicional', 6.50, 250, 10, 18, 6),
('Leite UHT Piracanjuba Integral', 'Caixa com 12 litros', 58.00, 380, 4, 19, 7),
('Leite Condensado Itambé 395g', 'Lata integral', 7.20, 500, 4, 20, 8);

# =========================================================================
# 10. TABELA: compras (Pedidos feitos pelas filiais aos fornecedores)
# =========================================================================
INSERT INTO compras (data_compra, data_entrega, nota_entrega, feedback_entrega, valor_total_compra, id_filial) VALUES 
('2026-03-01', '2026-03-03', 5, 'Entrega rápida e sem avarias.', 5400.00, 6),
('2026-03-02', '2026-03-05', 4, 'Atrasou 1 dia, mas os produtos vieram certos.', 2300.50, 7),
('2026-03-03', '2026-03-04', 5, 'Excelente transportadora.', 12500.00, 8),
('2026-03-04', '2026-03-07', 3, 'Duas caixas de sabão vieram rasgadas.', 4100.00, 9),
('2026-03-05', '2026-03-08', 5, 'Perfeito, tudo paletizado.', 8900.00, 10),
('2026-03-06', '2026-03-09', 4, 'Conferência demorada.', 3200.00, 11),
('2026-03-07', '2026-03-10', 5, 'Nota 10 para o motorista.', 15000.00, 12),
('2026-03-08', '2026-03-12', 2, 'Carga de congelados veio um pouco descongelada.', 6700.00, 13),
('2026-03-09', '2026-03-11', 4, 'Tudo em ordem.', 2150.00, 14),
('2026-03-10', '2026-03-14', 5, 'Atendeu as expectativas.', 9800.00, 15),
('2026-03-11', '2026-03-13', 4, 'Vieram caixas a mais por engano, corrigido na hora.', 11300.00, 16),
('2026-03-12', '2026-03-15', 5, 'Ótimo fornecedor.', 450.00, 17),
('2026-03-13', '2026-03-16', 3, 'Falta de comunicação sobre o horário da entrega.', 7300.00, 1),
('2026-03-14', '2026-03-17', 5, 'Descarregamento muito ágil.', 19000.00, 2),
('2026-03-15', '2026-03-18', 4, 'Padrão.', 540.00, 3),
('2026-03-16', '2026-03-19', 5, 'Embalagens impecáveis.', 3400.00, 4),
('2026-03-17', '2026-03-20', 4, 'Tudo certo.', 6200.00, 5),
('2026-03-18', '2026-03-22', 1, 'Produtos vencendo em menos de 10 dias.', 1500.00, 6),
('2026-03-19', '2026-03-21', 5, 'Agilidade incrível.', 8800.00, 7),
('2026-03-20', '2026-03-24', 4, 'Aceitável.', 1260.00, 8);

# =========================================================================
# 11. TABELA ASSOCIATIVA: vendasProdutos
# =========================================================================
INSERT INTO vendasProdutos (id_venda, id_produto, qtd_produto_venda) VALUES 
(1, 1, 5), (1, 7, 2),
(2, 11, 4), (2, 12, 5),
(3, 8, 3), (3, 14, 2),
(4, 3, 10), (4, 10, 5),
(5, 4, 3), (5, 17, 4),
(6, 13, 10), (6, 18, 5),
(7, 12, 10),
(8, 6, 4), (8, 15, 3),
(9, 2, 6), (9, 19, 4),
(10, 20, 10),
(11, 7, 12), (11, 1, 3),
(12, 9, 5),
(13, 12, 4), (13, 11, 2),
(14, 4, 4), (14, 16, 3),
(15, 13, 6),
(16, 1, 50), (16, 7, 20),
(17, 3, 8),
(18, 19, 3),
(19, 12, 4), (19, 4, 2),
(20, 20, 15);

# =========================================================================
# 12. TABELA ASSOCIATIVA: compraProdutos
# =========================================================================
INSERT INTO compraProdutos (id_compra, id_produto, qtd_produto_compra) VALUES 
(1, 1, 100), (1, 7, 50),
(2, 2, 40), (2, 19, 30),
(3, 12, 80),
(4, 3, 120), (4, 10, 60),
(5, 4, 150), (5, 16, 80),
(6, 6, 70), (6, 14, 100),
(7, 1, 200), (7, 7, 150),
(8, 5, 200), (8, 9, 100),
(9, 8, 150),
(10, 11, 60), (10, 12, 30),
(11, 13, 500),
(12, 18, 50),
(13, 15, 120),
(14, 19, 300), (14, 20, 200),
(15, 14, 50),
(16, 17, 140),
(17, 16, 180),
(18, 9, 80),
(19, 3, 250),
(20, 13, 150);