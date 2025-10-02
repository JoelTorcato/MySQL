drop database if exists Joel_12;
create database Joel_12;
use Joel_12;

create table Clube(
  Nome_Clube varchar(50) primary key,
  Morada varchar(50),
  Atividade varchar(50),
  Idade_Clube int
);

create table Atleta(
  Nome_Atleta varchar(50) primary key,
  BI varchar(11),
  Idade_Atleta int,
  Valor_Passe int,
  Telefone int(9)
);

create table Clube_Atleta(
  Nome_Clube varchar(50),
  Nome_Atleta varchar(50),
  primary key(Nome_Clube, Nome_Atleta),
  foreign key(Nome_Clube) references Clube(Nome_Clube),
  foreign key(Nome_Atleta) references Atleta(Nome_Atleta)
);

insert into Clube values
  ('Águias','Rua das Águias','Futebol',20),
  ('Bracarense','Av. Braga','Futebol',15);

insert into Atleta values
  ('João Silva','BI123',22,10000,'912345678'),
  ('Ana Costa','BI456',20,15000,NULL);

insert into Clube_Atleta values
  ('Águias','João Silva'),
  ('Bracarense','Ana Costa');

-- a
select * from Atleta where Idade_Atleta<25;

-- b
select Nome_Atleta, Nome_Clube from Clube_Atleta;

-- c
select count(*) as Total_Atletas from Clube_Atleta where Nome_Clube='Águias';

-- d
select avg(Atleta.Valor_Passe) from Atleta;

-- e
select Nome_Atleta
from Clube_Atleta
where Nome_Clube <> 'Bracarense'
and Nome_Atleta in (select Nome_Atleta from Atleta where Idade_Atleta = 20);

-- f
select Nome_Atleta from Atleta where Telefone is null or Telefone = '';
