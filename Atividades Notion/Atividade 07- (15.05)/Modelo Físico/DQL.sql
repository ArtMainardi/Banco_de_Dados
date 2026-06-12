# == ARTHUR == #
# Query 0
SELECT 
    f.nome_funcionario AS 'Nome do Funcionário',
    c.cargo AS 'Cargo do Funcionário',
    t.turno AS 'Turno do Funcionário',
    SUM(v.valor_total) AS 'Valor Total das Vendas do Funcionário'
FROM
    funcionarios AS f
	JOIN cargos AS c ON f.id_cargo = c.id_cargo
	JOIN turnos AS t ON f.id_turno = t.id_turno
    LEFT JOIN vendas AS v ON v.id_funcionario = f.id_funcionario 
GROUP BY 
    f.nome_funcionario, 
    c.cargo, 
    t.turno;

# Query 1
SELECT 
    f.endereco_filial AS 'Endereço Filial', 
    SUM(v.valor_total) 
FROM 
    filiais AS f
    JOIN vendas AS v ON v.id_filial = f.id_filial
GROUP BY f.id_filial
ORDER BY SUM(v.valor_total) DESC;


# == LORENZO == #
# Query 2
select endereco_filial, id_filial from filiais where endereco_filial like '%Paulista%';

# Query 3
select id_cliente, idade_cliente, pontos_cliente from clientes where pontos_cliente > 500 and idade_cliente > 30;


# == JOÃO MARCOS == #
# Query 4
SELECT V.id_venda AS id,
V.data_venda AS dataVenda,
P.nome_produto AS nomeProduto,
VP.qtd_produto_venda AS quantidadeVendida
FROM Vendas AS V
JOIN vendasprodutos AS VP ON VP.id_venda = V.id_venda
JOIN produtos AS P ON VP.id_produto = P.id_produto
JOIN categorias AS C ON P.id_categoria = C.id_categoria
WHERE C.nome_categoria = "Limpeza";

# Query 5
SELECT data_compra AS dataCompra,
feedback_entrega AS feedback,
nota_entrega AS nota
FROM compras
WHERE (feedback_entrega like "%congelad%") OR (feedback_entrega like "%descongelad%")


# == BÁRBARA == #
# Query 6
SELECT c.nome_categoria AS Categoria, MAX(p.preco) AS Preco_Maximo, MIN(p.preco) AS Preco_Minimo
FROM produtos p
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nome_categoria;

# Query 7
SELECT v.data_venda AS Data_Venda, v.valor_total AS Valor_Total, v.feedback AS Feedback
FROM vendas v
WHERE v.feedback LIKE '%caixa%';


# == RYAN == #
# Query 8
SELECT F.nome_fornecedor, F.cnpj_fornecedor, P.nome_produto
FROM produtos as P
JOIN fornecedores AS F ON P.id_fornecedor = F.id_fornecedor
WHERE P.nome_produto LIKE '%Cerveja%' OR P.nome_produto LIKE '%Coca-Cola%';

# Query 9
SELECT P.nome_produto, SUM(V.qtd_produto_venda) AS qtd_venda
FROM vendasProdutos AS V
JOIN produtos AS P ON V.id_produto = P.id_produto
WHERE P.nome_produto LIKE 'Leite%'
GROUP BY P.id_produto
HAVING SUM(V.qtd_produto_venda) > 15;