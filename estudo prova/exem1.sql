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

insert into Livro (tituloLivro, autor, ano_publicacao, preco)
values ('1984', 'George Orwell', 1949, 39.90),
('Dom Casmusso', 'Machado de Assis', 1899, 29.50);



alter table Livro add categoria_id int null;
alter table Livro add constraint fkLivroCategoria 
foreign key (categoria_id) references Categoria (idCategoria);

update Livro set categoria_id = 2
where tituloLivro = '1984';

update Livro set tituloLivro = 'Dom Casmurro'
where tituloLivro = 'Dom Casmusso';

select 
    tituloLivro as 'Título do Livro',
    autor as 'Autor do Livro',
    preco as 'Preço do Livro'
from Livro
where preco > 30.00;