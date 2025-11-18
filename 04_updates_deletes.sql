-- ========================================
-- 4️⃣ UPDATES
-- ========================================
UPDATE Produto SET preco = 130.00 WHERE nome_produto = 'Bolsa de Crochê Mini Rosa';
UPDATE Produto SET estoque = estoque + 3 WHERE id_produto = 2;
UPDATE Cliente SET telefone = '11999990010' WHERE nome = 'Lívia Santos';

-- ========================================
-- 5️⃣ DELETES
-- ========================================
DELETE FROM Item_Pedido WHERE id_item = 4;
DELETE FROM Pedido WHERE id_pedido = 2;
DELETE FROM Cliente WHERE id_cliente = 3;
