-- ========================================
-- 1️⃣ CRIAR TABELAS
-- ========================================
DROP TABLE IF EXISTS Item_Pedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telefone TEXT
);

CREATE TABLE Produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_produto TEXT NOT NULL,
    preco REAL NOT NULL,
    estoque INTEGER NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    data_pedido TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Item_Pedido (
    id_item INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario REAL NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- ========================================
-- 2️⃣ INSERIR DADOS
-- ========================================
-- Clientes
INSERT INTO Cliente (nome, email, telefone) VALUES
('Lívia Santos', 'livia@email.com', '11999990001'),
('Beatriz Costa', 'beatriz@email.com', '11999990002'),
('Camila Oliveira', 'camila@email.com', '11999990003');

-- Produtos (Bolsas de crochê do Ateliê Lela)
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
