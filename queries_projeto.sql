
-- Questão 1: Listar todos os pedidos com nome do cliente
SELECT 
    p.*,
    c.nome
FROM
    pedidos p
JOIN
    clientes c ON p.cliente_id = c.id;


-- Questão 2: Mostrar produtos comprados por João Silva
SELECT 
    pr.nome AS Nome_Produto, 
    c.nome AS Nome_Cliente
FROM 
    clientes c
JOIN 
    pedidos p ON c.id = p.cliente_id
JOIN
    itens_pedido ip ON p.id = ip.pedido_id
JOIN
    produtos pr ON ip.produto_id = pr.id
WHERE
    c.nome = 'João Silva';


-- Questão 3: Mostrar a quantidade de produtos por pedido
SELECT 
    ip.pedido_id, 
    SUM(ip.quantidade) AS Total_Produtos
FROM
    itens_pedido ip
GROUP BY
    ip.pedido_id;


-- Questão 4: Mostrar o total de pedidos por cliente
SELECT 
    c.nome, 
    COUNT(p.id) AS Total_Pedidos
FROM
    clientes c
JOIN
    pedidos p ON c.id = p.cliente_id
GROUP BY
    c.nome;


-- Questão 5: Produtos que nunca foram comprados
SELECT
    pr.nome
FROM
    produtos pr
LEFT JOIN itens_pedido ip ON pr.id = ip.produto_id
WHERE
    ip.id IS NULL;


-- Questão 6: Total de vendas por produto
SELECT 
    pr.nome, 
    SUM(ip.quantidade * pr.preco) AS Total_Vendido
FROM
    produtos pr
JOIN
    itens_pedido ip ON pr.id = ip.produto_id
GROUP BY
    pr.nome
ORDER BY
    Total_Vendido DESC;


-- Questão 7: Valor médio dos pedidos (com duas casas e R$)
SELECT 
    CONCAT('R$', ROUND(AVG(total_pedido), 2)) AS media_valor_pedido
FROM (
    SELECT 
        ip.pedido_id,
        SUM(ip.quantidade * pr.preco) AS total_pedido
    FROM 
        itens_pedido ip
    JOIN 
        produtos pr ON ip.produto_id = pr.id
    GROUP BY 
        ip.pedido_id
) AS totais;

