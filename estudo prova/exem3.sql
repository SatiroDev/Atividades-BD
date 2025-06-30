create database ClinicaDB;
use ClinicaDB;

create table Pacientes (
    idPaciente int primary key auto_increment,
    nomePaciente varchar(100) not null,
    cpf varchar(11) unique not null,
    data_nascimento date,
    sexo char(1) not null
);
create table Medicos (
    idMedico int primary key auto_increment,
    nomeMedico varchar(100) not null,
    especialidade varchar(60),
    crm varchar(10) unique not null
); 

insert into Pacientes (nomePaciente, cpf, data_nascimento, sexo)
values
('João Pereira', '11111111111', '1990-05-10', 'M'),
('Maria Fernandes', '22222222222', '1985-03-25', 'F');

insert into Medicos (nomeMedico, especialidade, crm)
values
('Dr. Ana Torres', 'Cardiologia', '12345SP'),
('Dr. Bruno Lopes', 'Ortopedia', '67890SP');

alter table Pacientes add telefone varchar(15);

alter table Medicos modify especialidade varchar(100);

update Pacientes set telefone = '11912345678'
where nomePaciente = 'João Pereira';

delete from Medicos
where crm = '67890SP';

select 
    nomePaciente as 'Nome do paciente',
    data_nascimento as 'Data de nascimento'
from Pacientes
where sexo = 'F';

update Pacientes set nomePaciente = 'Maria Fernanda'
where idPaciente = 2;