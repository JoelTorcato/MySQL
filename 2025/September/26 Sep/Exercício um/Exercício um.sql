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
  BI varchar(50),
  Idade_Atleta int,
  Valor_Passe int,
  Telefone varchar(15)
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

select * from Atleta where Idade_Atleta<25;
