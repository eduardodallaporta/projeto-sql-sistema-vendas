-- Inserção de dados nas tabelas

-- Clientes
INSERT INTO clientes (nome, email) VALUES 
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Pedro Lima', 'pedro@email.com');

-- Produtos
INSERT INTO produtos (nome, preco) VALUES 
('Teclado', 100.00),
('Mouse', 50.00),
('Monitor', 800.00),
('Cadeira Gamer', 1200.00),
('Webcam', 300.00);

-- Pedidos
INSERT INTO pedidos (cliente_id, data_pedido) VALUES 
(1, '2024-04-02'),
(2, '2024-04-03'),
(3, '2024-04-04');

-- Itens do Pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES 
(1, 1, 1), -- Teclado para João
(1, 2, 2), -- Mouse para João
(2, 3, 1), -- Monitor para Maria
(3, 2, 1), -- Mouse para Pedro
(3, 5, 1); -- Webcam para Pedro

