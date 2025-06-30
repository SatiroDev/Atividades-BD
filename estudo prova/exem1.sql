create database LivrariaDB;

use LivrariaDB;

create table Livro (
    idLivro int primary key auto_increment,
    tituloLivro varchar(100) not null,
    autor varchar(80) not null,
    ano_publicacao int,
    preco decimal (4,2) not null
);

create table Categoria (
    idCategoria int primary key auto_increment,
    nomeCategoria varchar(50) not null
);

insert into Categoria (nomeCategoria)
values ('Literatura'),
('Ficção Científica');