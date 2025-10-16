drop database if exists Escola;
create database Escola;
use Escola;

create table Alunos
(
    id    int primary key,
    nome  varchar(50),
    turma varchar(10)
);

create table Professoras
(
    id         int primary key,
    nome       varchar(50),
    disciplina varchar(50)
);

create table Notas
(
    id_aluno      int,
    id_professora int,
    nota          float,
    primary key (id_aluno, id_professora),
    foreign key (id_aluno) references Alunos (id),
    foreign key (id_professora) references Professoras (id)
);

DROP USER IF EXISTS 'Abel'@'localhost';
CREATE USER 'Abel'@'localhost' IDENTIFIED BY 'ferreira@caim';
GRANT INSERT, UPDATE ON Escola.Alunos TO 'Abel'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Abel'@'localhost';
