-- 1.
SELECT C_NOME FROM Cliente;

-- 2.
SELECT P_MODELO FROM Produto;

-- 3.
SELECT * FROM Produto;

-- 4.
SELECT C_ENDERECO, C_TELEFONE FROM Cliente;

-- 5.
SELECT P_NOME, P_PRECO FROM Produto;

-- 6.
SELECT E_DATA, E_QUANT FROM Encomenda;

-- 7.
SELECT Produto.P_NOME, Encomenda.E_DATA 
FROM Encomenda 
JOIN Produto ON Encomenda.E_P_ID = Produto.P_ID;

-- 8.
SELECT * FROM Produto;

-- 9.
SELECT DISTINCT C_ENDERECO FROM Cliente;