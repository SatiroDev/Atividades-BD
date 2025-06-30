create database EmpresaDB;
use EmpresaDB;


create table Funcionarios (
    idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(100) not null,
    cpf varchar(11) unique not null,
    salario decimal(8, 2) not null,
    data_admissao date not null
);
create table Departamentos (
    idDepartamento int primary key auto_increment,
    nomeDepartamento varchar(50) not null
);

insert into Departamentos (nomeDepartamento)
values
('Recursos Humanos'),
('Tecnologia da Informção');

insert into Funcionarios (nomeFuncionario, cpf, salario, data_admissao)
values
('Ana Lima', '12345678900', 3500.00, '2020-01-10'),
('Paulo Souza', '98765432100', 4200.50, '2019-07-01');



alter table Funcionarios add departamento_id int null;

alter table Funcionarios add constraint foreign key (departamento_id)
references Departamentos (idDepartamento);

update Funcionarios set departamento_id = 2
where nomeFuncionario = 'Paulo Souza'; 

select
    nomeFuncionario as 'Nome do Funcionário',
    salario as 'Salário do Funcionário'
from Funcionarios
where salario >= 4000.00;

update Departamentos set nomeDepartamento = 'Tecnologia da Informação'
where idDepartamento = 2;