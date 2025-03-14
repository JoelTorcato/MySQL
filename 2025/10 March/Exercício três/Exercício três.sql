
-- 2.
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
    nome CHAR(50),
    cod_artista INT,
    cod_tipo INT,
    FOREIGN KEY (cod_artista) REFERENCES ARTISTAS(cod_artista),
    FOREIGN KEY (cod_tipo) REFERENCES TIPO_MUSICAS(cod_tipo)
);

-- 3.
INSERT INTO ARTISTAS (cod_artista, nome, nacionalidade, idade) VALUES
(1, "Linda de Suza", "Portuguesa", 55),
(2, "José Afonso", "Portuguesa", 25),
(3, "Richard Miller", "Americana", 40),
(4, "Celine Dion", "Canadiana", 44),
(5, "Michael Bocelli", "Italiana", 38),
(6, "Adolfo", "Francesa", 25),
(7, "Max", "Alemã", 30),
(8, "Brandt", "Alemã", 35),
(9, "Brad Presley", "Americana", 30),
(10, "Vassilis", "Grega", 60);

INSERT INTO TIPO_MUSICAS (cod_tipo, tipo) VALUES
(1, "Rock"),
(2, "Romântica"),
(3, "Jazz"),
(4, "Clássica"),
(5, "Pop"),
(6, "Folk");

INSERT INTO MUSICAS (cod_musica, nome, cod_artista, cod_tipo) VALUES
(1, "Um Português", 1, 2),
(2, "Marinheiro", 1, 2),
(3, "Canção do mar", 2, 6),
(4, "Coro dos caídos", 2, 6),
(5, "In the Moon", 3, 3),
(6, "Moon Love", 3, 3),
(7, "Tell him", 4, 5),
(8, "The reason", 4, 5),
(9, "Love Tender", 9, 1),
(10, "Angel", 9, 1),
(11, "Eine Kleine Nachmusik", 7, 4),
(12, "Para Elisa", 8, 4);

-- 4.
UPDATE ARTISTAS
SET nome = "Ana Moura"
WHERE nome = "Linda de Suza";

-- 5. 
ALTER TABLE ARTISTAS
ADD email CHAR(20) NOT NULL;

-- 6.
ALTER TABLE ARTISTAS
CHANGE nacionalidade origem CHAR(25) NOT NULL;

-- 7.
ALTER TABLE ARTISTAS
DROP COLUMN email;

-- 8.
DELETE FROM MUSICAS WHERE nome = "Angel";

-- 9.
-- a)
SELECT * FROM ARTISTAS WHERE origem = "Americana";

-- b)
SELECT * FROM ARTISTAS WHERE origem <> "Portuguesa";

-- c)
SELECT nome FROM ARTISTAS WHERE idade > 30;

-- d)
SELECT nome FROM ARTISTAS WHERE idade BETWEEN 35 AND 45;

-- e)
SELECT * FROM TIPO_MUSICAS WHERE tipo LIKE "%a";

-- f)
SELECT * FROM TIPO_MUSICAS WHERE CHAR_LENGTH(tipo) = 4;

-- g)
SELECT MUSICAS.nome 
FROM MUSICAS
JOIN ARTISTAS ON MUSICAS.cod_artista = ARTISTAS.cod_artista
WHERE ARTISTAS.nome = "Celine Dion";

-- h)
SELECT MUSICAS.nome AS Musica, TIPO_MUSICAS.tipo AS Tipo, ARTISTAS.nome AS Artista
FROM MUSICAS
JOIN ARTISTAS ON MUSICAS.cod_artista = ARTISTAS.cod_artista
JOIN TIPO_MUSICAS ON MUSICAS.cod_tipo = TIPO_MUSICAS.cod_tipo;
