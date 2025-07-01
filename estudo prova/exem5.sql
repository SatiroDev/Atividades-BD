create database LojaDB;
use LojaDB;

create table Clientes (
    idCliente int primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(11) unique not null,
    telefone varchar(15) default '(00)0000-0000'
);

create table Pedidos (
    idPedido int primary key auto_increment,
    valorTotal decimal(8,2) not null,
    dataPedido date not null,
    status varchar(100) not null
    check (status = 'Pedende' or status = 'Pago' or status = 'Cancelado')
);

insert into Clientes (nome, cpf, telefone)
values 
('Julia Mendes', '12345678901', default),
('Ricardo Oliveira', '98765432100', '(11)99888-7766');

insert into Pedidos (valorTotal, dataPedido, status)
values
(250.00, '2025-06-01', 'Pago'),
(120.50, '2025-06-05', 'Cancelado');


alter table Pedidos add idCliente int null;
alter table Pedidos add constraint foreign key fkPedidosClientes (idCliente)
references Clientes(idCliente);

update Pedidos set idCliente = 1
where idPedido = 1;

delete from Clientes 
where cpf = '98765432100';


alter table Pedidos add constraint chk_PedidosClientes check (valorTotal > 1.00);

select
    valorTotal as 'Valor total',
    dataPedido as 'Data do pedido'
from Pedidos
where status = 'Pago';

select 
    nome as 'Nome do cliente'
from Clientes;
