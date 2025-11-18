-- ========================================
-- 2️⃣ INSERIR DADOS
-- ========================================
-- Clientes

DELETE FROM Item_Pedido;
DELETE FROM Pedido;
DELETE FROM Produto;
DELETE FROM Cliente;

INSERT INTO Cliente (nome, email, telefone) VALUES
('Lívia Santos', 'livia@email.com', '11999990001'),
('Beatriz Costa', 'beatriz@email.com', '11999990002'),
('Camila Oliveira', 'camila@email.com', '11999990003');

-- Produtos (Bolsas de crochê Ateliê Lela)
INSERT INTO Produto (nome_produto, preco, estoque) VALUES
('Bolsa de Crochê Mini Rosa', 120.00, 10),
('Bolsa de Crochê Grande Bege', 180.00, 5),
('Bolsa de Crochê Média Azul', 150.00, 8);

-- Pedidos
INSERT INTO Pedido (id_cliente, data_pedido) VALUES
(1, '2025-11-01'),
(2, '2025-11-02'),
(1, '2025-11-03');

-- Itens de pedidos
INSERT INTO Item_Pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 120.00),
(1, 3, 2, 150.00),
(2, 2, 1, 180.00),
(3, 3, 1, 150.00);

