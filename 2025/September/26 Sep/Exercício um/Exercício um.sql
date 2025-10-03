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
  Telefone varchar(9)
);

create table Clube_Atleta(
  Nome_Clube varchar(50),
  Nome_Atleta varchar(50),
  primary key(Nome_Clube, Nome_Atleta),
  foreign key(Nome_Clube) references Clube(Nome_Clube),
  foreign key(Nome_Atleta) references Atleta(Nome_Atleta)
);

insert into Clube values
  ('Alverca','Rua dos Moinhos','Basquetebol',3),
  ('Bucelas','Av. Brasil','Surf',11);

insert into Atleta values
  ('Joel Fernandes','1Q2W3E45',16,10000,'938112685'),
  ('Simão Torcato','',20,15000,NULL);

insert into Clube_Atleta values
  ('Alverca','Joel Fernandes'),
  ('Bucelas','Simão Torcato');

-- a
select * from Atleta
where Idade_Atleta<25;

-- b
select Nome_Atleta, Nome_Clube
from Clube_Atleta;

-- c
select count(*)
as Total_Atletas
from Clube_Atleta
where Nome_Clube='Alverca';

-- d
select avg(Atleta.Valor_Passe)
from Atleta;

-- e
select Nome_Atleta
from Clube_Atleta
where Nome_Clube <> 'Bucelas'
and Nome_Atleta in (select Nome_Atleta from Atleta where Idade_Atleta = 20);

-- select (f)
select Nome_Atleta
from Atleta
where Telefone
is null or Telefone = '';

-- describe
describe Clube;

-- show
show tables;

-- 02.10.25

-- a
select Nome_Clube
from Clube
where Idade_Clube > 10;

-- b
update Atleta set Valor_Passe = 1000000
where Nome_Atleta = 'Joel Fernandes';
select * from Atleta;

-- c
delete from Atleta
where Idade_Atleta > 35;

-- d
select distinct Clube_Atleta.Nome_Clube
from Clube_Atleta
inner join Atleta on Clube_Atleta.Nome_Atleta = Atleta.Nome_Atleta
where Atleta.BI is null or Atleta.BI = '';

-- e
select Nome_Atleta
from Atleta
where Nome_Atleta like 'J%';

-- f
select Nome_Clube
from Clube_Atleta
group by Nome_Clube
having count(Nome_Atleta) > 3;

-- g
select Nome_Atleta, Valor_Passe
from Atleta
order by Valor_Passe desc;

-- h
select * from Atleta
where Idade_Atleta
between 18 and 30;

-- i
select Nome_Clube
from Clube
where Nome_Clube
not in (select Nome_Clube from Clube_Atleta);

-- j
select Nome_Atleta, Nome_Clube
from Clube_Atleta
order by Nome_Clube;
