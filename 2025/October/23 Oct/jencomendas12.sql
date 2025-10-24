-- 2.
DROP DATABASE IF EXISTS jencomendas12;
CREATE DATABASE jencomendas12;
USE jencomendas12;

-- 3.
-- Tabela de produtos
CREATE TABLE Fprodutos (
  Fid INT AUTO_INCREMENT PRIMARY KEY,
  Fnome VARCHAR(100) NOT NULL,
  Fpreco DECIMAL(10,2) NOT NULL
);

-- Tabela de clientes
CREATE TABLE Fclientes (
  Fid INT AUTO_INCREMENT PRIMARY KEY,
  Fnome VARCHAR(100) NOT NULL,
  Fcontacto VARCHAR(50)
);

-- Tabela de encomendas (ligada ao cliente)
CREATE TABLE Fencomendas (
  Fid INT AUTO_INCREMENT PRIMARY KEY,
  Fcliente_id INT NOT NULL,
  Fdata DATE NOT NULL DEFAULT CURRENT_DATE,
  FOREIGN KEY (Fcliente_id) REFERENCES Fclientes(Fid)
);

-- Tabela de detalhes de encomenda (ligada à encomenda e ao produto)
CREATE TABLE Fdetalhes_encomenda (
  Fid INT AUTO_INCREMENT PRIMARY KEY,
  Fencomenda_id INT NOT NULL,
  Fproduto_id INT NOT NULL,
  Fquantidade INT NOT NULL DEFAULT 1,
  Fpreco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (Fencomenda_id) REFERENCES Fencomendas(Fid),
  FOREIGN KEY (Fproduto_id) REFERENCES Fprodutos(Fid)
);

-- 4.
INSERT INTO Fprodutos (Fnome, Fpreco) VALUES
  ('Caneta Azul', 0.75),
  ('Caderno A5', 2.50);

INSERT INTO Fclientes (Fnome, Fcontacto) VALUES
  ('Abel Martins', '912345678'),
  ('Joana Silva', '913456789');

INSERT INTO Fencomendas (Fcliente_id) VALUES
  (1),
  (2);

INSERT INTO Fdetalhes_encomenda (Fencomenda_id, Fproduto_id, Fquantidade, Fpreco_unitario) VALUES
  (1, 1, 3, 0.75),
  (2, 2, 2, 2.50);

-- 5.

-- a, b
CREATE USER 'cliente1'@'localhost' IDENTIFIED BY 'cliente123';
GRANT SELECT ON jencomendas12.* TO 'cliente1'@'localhost';
FLUSH PRIVILEGES;

-- c, d
CREATE USER 'vendedor1'@'localhost' IDENTIFIED BY 'vendedor123';
GRANT SELECT, INSERT, UPDATE ON jencomendas12.* TO 'vendedor1'@'localhost';
FLUSH PRIVILEGES;

-- e, f
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON jencomendas12.* TO 'admin1'@'localhost';
FLUSH PRIVILEGES;

-- 6.
-- exit
-- mysql -u cliente1 -p
USE jencomendas12;
SELECT * FROM Fprodutos;
SELECT * FROM Fclientes;
SELECT * FROM Fencomendas;

-- 7.(Tarefa 1)
CREATE USER 'leitor2'@'localhost' IDENTIFIED BY 'leitor2123';
GRANT SELECT ON jencomendas12.* TO 'leitor2'@'localhost';
FLUSH PRIVILEGES;

-- 7. (Tarefa 2)
CREATE USER 'editor2'@'localhost' IDENTIFIED BY 'editor2123';
GRANT INSERT, UPDATE ON jencomendas12.* TO 'editor2'@'localhost';
FLUSH PRIVILEGES;

-- 7. (Tarefa 3)
CREATE USER 'admin2'@'localhost' IDENTIFIED BY 'admin2123';
GRANT ALL PRIVILEGES ON jencomendas12.* TO 'admin2'@'localhost';
FLUSH PRIVILEGES;

-- 7. (Tarefa 4)

SELECT * FROM Fprodutos;
DELETE FROM Fprodutos WHERE Fid=1;

INSERT INTO Fprodutos (Fnome, Fpreco) VALUES ('Produto Teste', 1.99);
UPDATE Fprodutos SET Fpreco=2.50 WHERE Fid=1;
DELETE FROM Fprodutos WHERE Fid=1;
SELECT * FROM Fprodutos;

SELECT * FROM Fprodutos;
INSERT INTO Fprodutos (Fnome, Fpreco) VALUES ('Produto Admin', 3.99);
UPDATE Fprodutos SET Fpreco=4.00 WHERE Fid=1;
DELETE FROM Fprodutos WHERE Fid=1;

-- 7. Tarefa 5

REVOKE INSERT, UPDATE ON jencomendas12.* FROM 'editor2'@'localhost';
FLUSH PRIVILEGES;

