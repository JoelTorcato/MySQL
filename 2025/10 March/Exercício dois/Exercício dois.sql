-- Criar a tabela EQUIPAS
CREATE TABLE EQUIPAS (
    e_numero INT PRIMARY KEY,
    e_nome VARCHAR(50),
    e_cidade VARCHAR(50),
    e_director VARCHAR(50)
);

-- Inserir dados na tabela EQUIPAS
INSERT INTO EQUIPAS (e_numero, e_nome, e_cidade, e_director) VALUES
(12, 'Académico', 'Porto', 'Mário'),
(15, 'Universitário', 'Coimbra', 'João'),
(20, 'Juventude', 'Braga', 'Silva'),
(24, 'Tigres', 'Espinho', 'Cardoso');

-- Criar a tabela TREINADORES
CREATE TABLE TREINADORES (
    t_numero INT PRIMARY KEY,
    t_nome VARCHAR(50),
    t_telefone VARCHAR(15),
    t_equipa INT
);

-- Inserir dados na tabela TREINADORES
INSERT INTO TREINADORES (t_numero, t_nome, t_telefone, t_equipa) VALUES
(1, 'António', '5551524', 12),
(2, 'Barbosa', '5553690', 12),
(3, 'Tavares', '5554820', 15),
(4, 'Joaquim', '5552444', 20),
(5, 'Vítor', '5559237', 24),
(6, 'Duarte', '5557321', 24);

-- Criar a tabela EXPERIENCIA
CREATE TABLE EXPERIENCIA (
    n_expe INT PRIMARY KEY,
    ex_equipa INT,
    ex_treinador INT,
    ex_tipo VARCHAR(20),
    ex_anos INT
);

-- Inserir dados na tabela EXPERIENCIA
INSERT INTO EXPERIENCIA (n_expe, ex_equipa, ex_treinador, ex_tipo, ex_anos) VALUES
(1, 12, 1, 'juniores', 10),
(2, 12, 1, 'seniores', 5),
(3, 12, 2, 'iniciados', 2),
(4, 12, 2, 'juniores', 3),
(5, 12, 2, 'juvenis', 4),
(6, 15, 3, 'juniores', 15),
(7, 24, 5, 'juvenis', 12);

-- Criar a tabela BOLAS
CREATE TABLE BOLAS (
    b_num INT PRIMARY KEY,
    b_equipa INT,
    b_ref INT,
    b_fabricante VARCHAR(20)
);

-- Inserir dados na tabela BOLAS
INSERT INTO BOLAS (b_num, b_equipa, b_ref, b_fabricante) VALUES
(1, 12, 1, 'Adidas'),
(2, 12, 9, 'Reebok'),
(3, 12, 13, 'Adidas'),
(4, 15, 1, 'Adidas'),
(5, 20, 3, 'Olimpic'),
(6, 20, 4, 'Nike'),
(7, 24, 18, 'Reebok'),
(8, 24, 24, 'Olimpic');

-- Criar a tabela JOGADORES
CREATE TABLE JOGADORES (
    j_numero INT PRIMARY KEY,
    j_nome VARCHAR(50),
    j_idade INT
);

-- Inserir dados na tabela JOGADORES
INSERT INTO JOGADORES (j_numero, j_nome, j_idade) VALUES
(358, 'Silva', 21),
(523, 'David', 32),
(1131, 'Joaquim', 28),
(1779, 'João', 25),
(2007, 'Domingos', 27),
(4280, 'Carlos', 25),
(4319, 'Rui', 24),
(5410, 'Santos', 27),
(6564, 'Luis', 24),
(8093, 'Santos', 21),
(8366, 'Gomes', 33);

-- Criar a tabela FILIACAO
CREATE TABLE FILIACAO (
    f_jogador INT,
    f_equipa INT,
    f_anos INT,
    f_media DECIMAL(5,3),
    PRIMARY KEY (f_jogador, f_equipa)
);

-- Inserir dados na tabela FILIACAO
INSERT INTO FILIACAO (f_jogador, f_equipa, f_anos, f_media) VALUES
(358, 15, 5, 0.3),
(358, 20, 3, 0.32),
(523, 12, 10, 0.257),
(1131, 20, 1, 0.283),
(1779, 12, 1, 0.223),
(1779, 24, 2, 0.246),
(2007, 12, 7, 0.227),
(4280, 15, 4, 0.195),
(4319, 20, 3, 0.298),
(5410, 12, 10, 0.244),
(6564, 12, 6, 0.31),
(6564, 20, 6, 0.307),
(8093, 12, 5, 0.25),
(8093, 24, 8, 0.265),
(8366, 20, 7, 0.283);

-- Exercícios:

SELECT * FROM EQUIPAS;
SELECT * FROM EQUIPAS WHERE e_id = 12;
SELECT e_numero, e_nome FROM EQUIPAS;
SELECT j_numero, j_nome FROM JOGADORES WHERE j_idade > 30;
SELECT ex_treinador FROM EXPERIENCIA WHERE ex_tipo = 'juniores' AND ex_anos >= 5;
SELECT * FROM EXPERIENCIA WHERE ex_tipo = 'juniores' OR ex_anos > 10;
SELECT b_equipa FROM BOLAS WHERE b_fabricante = 'Adidas';
SELECT * FROM BOLAS WHERE b_fabricante IN ('Reebok', 'Olimpic');
SELECT * FROM JOGADORES WHERE j_nome LIKE 'S%';
SELECT * FROM JOGADORES WHERE j_idade BETWEEN 20 AND 30;
SELECT * FROM JOGADORES WHERE j_nome LIKE 'S%a';

