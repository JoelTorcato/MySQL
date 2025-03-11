-- 1. Criar a base de dados
CREATE DATABASE BANDAS;
USE BANDAS;

-- 2. Criar tabelas
CREATE TABLE ARTISTAS (
    cod_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome CHAR(20),
    nacionalidade CHAR(25),
    idade INT(2)
);

CREATE TABLE TIPO_MUSICAS (
    cod_tipo INT AUTO_INCREMENT PRIMARY KEY,
    tipo CHAR(20)
);

CREATE TABLE MUSICAS (
    cod_musica INT AUTO_INCREMENT PRIMARY KEY,
    nome CHAR(20),
    cod_artista INT,
    cod_tipo INT,
    FOREIGN KEY (cod_artista) REFERENCES ARTISTAS(cod_artista),
    FOREIGN KEY (cod_tipo) REFERENCES TIPO_MUSICAS(cod_tipo)
);

-- 3. Inserir dados
INSERT INTO ARTISTAS (cod_artista, nome, nacionalidade, idade) VALUES
(1,'Linda de Suza', 'Portuguesa', 55),
(2,'José Afonso', 'Portuguesa', 25),
(3,'Richard Miller', 'Americana', 40),
(4,'Celine Dion', 'Canadiana', 44),
(5,'Michael Bocelli', 'Italiana', 38),
(6,'Adolfo', 'Francesa', 25),
(7,'Max', 'Alemã', 30),
(8,'Brandt', 'Alemã', 35),
(9,'Brad Presley', 'Americana', 30),
(10,'Vassilis', 'Grega', 60);

INSERT INTO TIPO_MUSICAS (cod_tipo, tipo) VALUES
(1,'Rock'),
(2,'Romântica'),
(3,'Jazz'),
(4,'Clássica'),
(5,'Pop'),
(6,'Folk');

INSERT INTO MUSICAS (cod_musica, nome, cod_artista, cod_tipo) VALUES
(1,'Um Português',1,2),
(2,'Marinheiro',1,2),
(3,'Canção do mar',2,6),
(4,'Coro dos caídos',2,6),
(5,'In the Moon',3,3),
(6,'Moon Love',3,3),
(7,'Tell him',4,5),
(8,'The reason',4,5),
(9,'Love Tender',9,1),
(10,'Angel',9,1),
(11,'Eine Kleine Nachmusik',7,4),
(12,'Para Elisa',8,4);

-- 4. Alterar nome de "Linda de Suza" para "Ana Moura"
UPDATE ARTISTAS SET nome = 'Ana Moura' WHERE nome = 'Linda de Suza';

-- 5. Adicionar campo "email"
ALTER TABLE ARTISTAS ADD COLUMN email CHAR(20) NOT NULL;

-- 6. Alterar nome do campo "Nacionalidade" para "Origem"
ALTER TABLE ARTISTAS CHANGE COLUMN nacionalidade origem CHAR(25) NOT NULL;

-- 7. Remover campo "email"
ALTER TABLE ARTISTAS DROP COLUMN email;

-- 8. Apagar um registo da tabela MUSICAS
DELETE FROM MUSICAS WHERE cod_musica = 1 LIMIT 1;

-- 9. Consultas
-- a) Mostrar os artistas de origem Americana
SELECT * FROM ARTISTAS WHERE origem = 'Americana';

-- b) Mostrar os artistas de origem não Portuguesa
SELECT * FROM ARTISTAS WHERE origem <> 'Portuguesa';

-- c) Mostrar o nome dos artistas com mais de 30 anos
SELECT nome FROM ARTISTAS WHERE idade > 30;

-- d) Mostrar o nome dos artistas com idade entre os 35 e 45 anos
SELECT nome FROM ARTISTAS WHERE idade BETWEEN 35 AND 45;

-- e) Mostrar todos os tipos de músicas terminados em "a"
SELECT * FROM TIPO_MUSICAS WHERE tipo LIKE '%a';

-- f) Mostrar todos os tipos de músicas com 4 caracteres no nome
SELECT * FROM TIPO_MUSICAS WHERE CHAR_LENGTH(tipo) = 4;

-- g) Mostrar as músicas da Celine Dion
SELECT MUSICAS.nome FROM MUSICAS
JOIN ARTISTAS ON MUSICAS.cod_artista = ARTISTAS.cod_artista
WHERE ARTISTAS.nome = 'Celine Dion';

-- h) Mostrar todas as músicas, os tipos de música e os artistas dessas músicas
SELECT MUSICAS.nome AS Musica, TIPO_MUSICAS.tipo AS Tipo, ARTISTAS.nome AS Artista
FROM MUSICAS
JOIN ARTISTAS ON MUSICAS.cod_artista = ARTISTAS.cod_artista
JOIN TIPO_MUSICAS ON MUSICAS.cod_tipo = TIPO_MUSICAS.cod_tipo;
