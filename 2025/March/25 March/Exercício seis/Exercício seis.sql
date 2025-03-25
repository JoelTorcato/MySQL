-- a
SELECT AVG(Idade) AS Media_Idades 
FROM Jogadores;

-- b
SELECT MAX(Salário) AS Maior_Salario 
FROM Vencimentos;

-- c 
SELECT Nome, MIN(Data) AS Equipa_Mais_Antiga 
FROM Equipas;

-- d
SELECT Nome, MAX(Data) AS Equipa_Mais_Recente 
FROM Equipas;

-- e
SELECT COUNT(Cod_Jogador) AS Numero_Jogadores 
FROM Jogadores;

-- f
SELECT COUNT(Cod_Equipa) AS Numero_Equipas 
FROM Equipas;

-- g
SELECT MIN(Idade) AS Jogador_Mais_Novo 
FROM Jogadores;