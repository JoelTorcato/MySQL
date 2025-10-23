drop database if exists Matrículas;
create database Matrículas;
use Matrículas;

create table Cursos (
  CodCurso int primary key,
  NomeCurso varchar(50),
  CargaHorária int
);

create table Alunos (
  CodAluno int primary key,
  NomeAluno varchar(50),
  Morada varchar(50),
  CodCurso int,
  Idade int,
  foreign key (CodCurso) references Cursos(CodCurso)
);

create table Disciplinas (
  CodDisciplina int primary key,
  NomeDisciplina varchar(50),
  CargaHorária int
);

create table Alunos_Disciplinas (
  CodAluno int,
  CodDisciplina int,
  primary key (CodAluno, CodDisciplina),
  foreign key (CodAluno) references Alunos(CodAluno),
  foreign key (CodDisciplina) references Disciplinas(CodDisciplina)
);

insert into Cursos values
  (1, 'Curso de Robótica', 1200),
  (2, 'Curso de Inteligência Artificial', 900);

insert into Alunos values
  (1, 'Simão Tesla', 'Rua da Tesla', 1, 20),
  (2, 'Joel Ferrari', 'Rua da Ferrari', 2, 16);

insert into Disciplinas values
  (1, 'Matemática Computacional', 200),
  (2, 'Português', 150);

insert into Alunos_Disciplinas values
  (1, 1),
  (2, 2);

-- 2.
select count(*) from Cursos
where CargaHorária is null or CargaHorária = 0;

-- 3.
select max(Idade)
from Alunos;

-- 4.
select NomeAluno
from Alunos
order by NomeAluno limit 1;

-- 5.
select sum(D.CargaHorária)
from Alunos_Disciplinas AD
join Disciplinas D on AD.CodDisciplina = D.CodDisciplina
where AD.CodAluno = 5;

-- 6.
select avg(A.Idade)
from Alunos A
join Alunos_Disciplinas AD on A.CodAluno = AD.CodAluno
join Disciplinas D on AD.CodDisciplina = D.CodDisciplina
where D.NomeDisciplina = 'Portugues';

-- 7.
select CodCurso, avg(Idade) as Media_Idade
from Alunos
group by CodCurso
order by Media_Idade desc;

-- 8.
select count(*) from Alunos;

-- 9.
select NomeAluno from Alunos order by NomeAluno desc limit 1;

-- 10.
select avg(Idade) from Alunos where Morada = 'Rua Nova';

-- 11.
select count(*) as TotalCursos, count(case when CargaHorária is not null and CargaHorária > 0 then 1 end) as CursosComCarga from Cursos;

-- 12.
select avg(A.Idade)
from Alunos A
join Cursos C on A.CodCurso = C.CodCurso
where C.NomeCurso = 'Curso Profissional de Tecnico de Gestao e Programacao de Sistemas Informaticos';

-- 13.
select count(*) from Alunos where Idade > 20;

-- 14.
select A.NomeAluno, count(AD.CodDisciplina) as NumDisciplinas
from Alunos A
join Cursos C on A.CodCurso = C.CodCurso
join Alunos_Disciplinas AD on A.CodAluno = AD.CodAluno
where C.NomeCurso = 'Curso Cientifico-humanistico de Linguas e Literaturas'
group by A.CodAluno
having NumDisciplinas > 1
order by NumDisciplinas desc;

-- 15.
select D.NomeDisciplina, count(AD.CodAluno) as NumAlunos
from Disciplinas D
join Alunos_Disciplinas AD on D.CodDisciplina = AD.CodDisciplina
group by D.CodDisciplina
order by NumAlunos desc;

-- 16.
select min(Idade) from Alunos;

-- 17.
select A.NomeAluno, count(AD.CodDisciplina) as NumDisciplinas
from Alunos A
join Cursos C on A.CodCurso = C.CodCurso
join Alunos_Disciplinas AD on A.CodAluno = AD.CodAluno
where C.NomeCurso = 'Curso Cientifico-humanistico de Linguas e Literaturas'
group by A.CodAluno
order by NumDisciplinas desc;

-- 18.
select CodCurso, avg(Idade) as Media_Idade
from Alunos
group by CodCurso
having Media_Idade < 19
order by Media_Idade desc;

-- 19.
select A.NomeAluno, C.NomeCurso
from Alunos A
join Cursos C on A.CodCurso = C.CodCurso
order by A.NomeAluno;
