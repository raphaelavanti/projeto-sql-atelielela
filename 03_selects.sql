-- ========================================
-- 3️⃣ CONSULTAS DE TESTE
-- ========================================
-- Listar todos os clientes
SELECT * FROM Cliente;

-- Pedidos de um cliente específico
SELECT * FROM Pedido WHERE id_cliente = 1;

-- Produtos com estoque > 5
SELECT * FROM Produto WHERE estoque > 5 ORDER BY preco DESC;

-- Listar itens de pedidos com JOIN
SELECT p.id_pedido, c.nome AS cliente, pr.nome_produto, i.quantidade, i.preco_unitario
FROM Item_Pedido i
JOIN Pedido p ON i.id_pedido = p.id_pedido
JOIN Cliente c ON p.id_cliente = c.id_cliente
JOIN Produto pr ON i.id_produto = pr.id_produto;

-- Total gasto por cliente
SELECT c.nome, SUM(i.quantidade * i.preco_unitario) AS total_gasto
FROM Cliente c
JOIN Pedido p ON c.id_cliente = p.id_cliente
JOIN Item_Pedido i ON p.id_pedido = i.id_pedido
GROUP BY c.nome;
