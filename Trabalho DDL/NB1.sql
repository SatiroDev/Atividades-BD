--1
CREATE DATABASE dbNetiflix;


-- 4
CREATE TABLE tbFilme (
    ID_filme int,
    Titulo_filme VARCHAR(200),
    ano_lancamento int
);

-- 7
DROP TABLE tbFilme;

-- 8 
CREATE TABLE tbFilme (
    ID_filme serial primary key, -- ID_filme int primary key auto_increment,
    Titulo_filme VARCHAR(200),
    ano_lancamento int
);

-- 9
CREATE DATABASE dbTeste;
DROP DATABASE dbTeste;

-- 11 
CREATE TABLE tbCategoria (
    id_categoria serial primary key, -- int primary key auto_increment,
    nome_categoria VARCHAR(100) not null unique,
);

-- 12
CREATE TABLE tbConteudo (
    id_conteudo serial primary key, -- int primary key auto_increment,
    titulo VARCHAR(200) not null,
    avaliacao decimal(3,1) check(avaliacao >= 0 and avaliacao <= 10)
    id_categoria int references tbCategoria(id_categoria)
    -- foreign key (id_categoria) references tbCategoria(id_categoria)

);

-- 13 
-- not null: significa que o campo é obrigatório, ou seja, não pode ser deixado em branco
-- default: significa que caso o usuário deixe esse campo em branco, ele terá um valor padrão

-- 14
CREATE TABLE tbPerfil (
    idade int default 18
);

-- 15
-- se não for informado nada, a idade padrão será '18'

--16
-- vai dar erro, pois a informação já existe, e o unique quer dizer que a informação colocada naquele campo, não poderá ser repetida

--17
-- primary key: é algo que faz com que você indentique melhor o que você procura, é melhor para fazer busca, e também não pode se repetir, parecido com o unique, e so pode haver um por tabela, já o UNIQUE, pode está em varias colunas na mesma tabela.

-- 18
-- É util para aceitar avaliações somente de 0 até 10, quando um filme tem restrição de idade, uma pessoa pode assistir determinado filme se tiver a partir de uma determinada idade.

-- 19
-- Cria um vínculo entre uma coluna de uma tabela, com a chave primária de outra, ideal para fazer buscas expecificas.

-- 20 
-- Quando a coluna precisa registrar automaticamente a data atual no momento exato quando é colocado a informação, bom que não precisa fazer isso manualmente

-- 21
-- Númericos: 
--int -> idade int
-- decimal -> preco decimal(10,2)
-- float -> nota float
-- double -> media double

--Strings:
-- varchar -> nome varchar(100)
-- text -> descricao text

-- Data e hora:
-- date -> data_nascimento date
-- time -> hora time
-- datetime -> criado_em datetime

-- 22
-- float: ocupa pouco espaço, pode gerar arredondamentos
-- double: ocupa mais espaço do que o float, tem uma precisão maior do que o float
-- decimal: tem uma alta precisão, não ocorre arredondamento automático
-- real: funciona da mesma forma que o double

-- 23
 CREATE TABLE tbTesteTipos (
    quantidade_filhos tinyint,
    cpf bigint,
    data_nascimento date,
    data_registro datetime,
    horario_entrada time,
    descricao text
 );

--24
-- datetime é melhor que o date, quando queremos não so armazenar a data, mas também o horário exato de algo

-- 27
--
alter table tbConteudo add column duracao int not null;

-- 28
alter table tbPerfil change idade faixa_etaria int;

--29
alter table tbConteudo modify column avaliacao float;

-- 30
alter table tbConteudo DROP column duracao;

-- 31

CREATE table tbUsuario (
    id_usuario int primary key auto_increment,
    nome varchar(100),
    email text
);

--32
alter table tbUsuario add column senha varchar(100);

--33
alter table tbUsuario DROP column senha;

--34
alter table tbUsuario modify column email varchar(150);

--35
alter table tbUsuario rename tbConta;

--36
alter table tbConta change nome nome_completo varchar(100);

--37
alter table tbConta add constraint uq_email unique (email);

--38
alter table tbConta add constraint chk_nome_completo check 

--39
alter table tbConta add column id_outraTabela;
alter table tbConta add constraint fk_Conta foreign key (id_outraTabela) references tbOutraTabela(id_outraTabela)

--40
-- change: renomeia a coluna e altera seu tipo
ALTER TABLE tbUsuario CHANGE nome nome_completo VARCHAR(100) NOT NULL;
-- modify: modifica o tipo, tamanho ou restrições de uma coluna já existente
ALTER TABLE tbUsuario MODIFY nome VARCHAR(150) NOT NULL;

