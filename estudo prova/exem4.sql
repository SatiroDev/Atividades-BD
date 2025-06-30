create database AcademiaDB;
use AcademiaDB;

create table Alunos (
    idAluno int primary key auto_increment,
    nomeAluno varchar(100) not null,
    cpf varchar(100) unique not null,
    plano varchar(20),
    data_inscricao date not null
);

create table Treinadores (
    idTreinador int primary key auto_increment,
    nomeTreinador varchar(100) not null,
    especialidade varchar(60),
    ativo tinyint(1) not null
);

insert into Alunos (nomeAluno, cpf, plano, data_inscricao)
values
('Lucas Martins', '55555555555', 'Mensal', '2024-10-01'),
('Carla Bezerra', '44444444444', 'Anual', '2025-01-15');

insert into Treinadores (nomeTreinador, especialidade, ativo)
values
('Tiago Silva', 'Musculação', 1),
('Juliana Mendes', 'Funcional', 0);

alter table Alunos add telefone varchar(15);

update Alunos set telefone = '85987654321'
where nomeAluno = 'Lucas Martins';

delete from Treinadores
where ativo = 0;

alter table Alunos drop plano;

select 
    nomeAluno as 'Nome do aluno',
    data_inscricao as 'Data da inscrição'
from Alunos
where data_inscricao between '2025-01-01' and '2025-06-30';

select
    nomeTreinador as 'Nome do treinador',
    especialidade as 'Especialidade do treinador'
from Treinadores
where ativo = 1 and nomeTreinador like 'T%';