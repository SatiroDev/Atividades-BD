
-- Insira um novo título na tabela tbNetflix informando todos os campos. (Use a versão com a lista de colunas explícitas)
INSERT INTO tbnetflix ( titulo, avaliacaoGlobalNota, avaliacaoGlobal, dataDeLancamento, horasDeVisualizacao, duracaoEmMinutos, duracao, vizulizacoes) 
VALUES (
    1008, 'O Poderoso Chefão', 9.2, 'Yes', '1972-03-24', 1500000.5, 175, '02:55', 20000000
);

-- Insira um novo título apenas com os dados obrigatórios, usando INSERT INTO sem listar as colunas. (Garanta que a tabela tenha colunas com DEFAULT ou AUTO_INCREMENT)
INSERT INTO tbNetflix (titulo, avaliacaoGlobalNota, avaliacaoGlobal, dataDeLancamento, horasDeVisualizacao, duracaoEmMinutos, duracao, vizulizacoes)
VALUES ('Interestelar', 8.6, 'Yes', '2014-11-07', 980000.0, 169, '02:49', 15000000);

-- O que acontece se você omitir o valor da coluna AUTO_INCREMENT ao inserir dados?
O valor é gerado automaticamente com o próximo número da sequência.

-- Crie uma tabela tbGenero com colunas id_genero INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(50).

create database exerDML;

use exerDML;

create table tbGenero (
    id_genero int auto_increment primary key,
    nome varchar(50)
);

-- Insira 3 registros na tabela tbGenero sem informar o valor do campo id_genero.


INSERT INTO tbGenero (nome) VALUES ('Ação'),
('Comédia'),
('Drama');

-- Explique o que acontece se tentar inserir um valor duplicado em uma coluna com UNIQUE.

-- resp: Da erro, pois valores duplicados não são permitidos em colunas UNIQUE.


-- Insira dois registros na tabela tbPerfil com nomes e idades diferentes.

create table tbPerfil (
    id_perfil int auto_increment primary key,
    nome varchar(100),
    idade int not null
); 

insert into tbPerfil (nome, idade)
values ('José', 17),
('Maria', 10)

-- Insira um conteúdo com avaliação acima de 9.5. A coluna tem CHECK(avaliacao <= 10)?
INSERT INTO tbnetflix (cod, titulo, avaliacaoGlobalNota, avaliacaoGlobal, dataDeLancamento, horasDeVisualizacao, duracaoEmMinutos, duracao, vizulizacoes)
VALUES (1010, 'O Senhor dos Anéis', 11, 'Yes', '2001-12-19', 1200000, 178, '02:58', 25000000);
-- não possui check, ent aceita nota acima de 10, até o limite Decimal(3,1)

-- Insira um conteúdo com NULL em uma coluna marcada como NOT NULL. O que acontece?

insert into tbperfil(nome, idade) 
values ('João', null);

-- resp: da erro, pois a coluna que está com o NOT NULL, não pode ser deixada com valor NULL.


-- Insira um conteúdo com data de lançamento futura (ex: '2030-01-01'). O MySQL aceita?
INSERT INTO tbnetflix (titulo, avaliacaoGlobalNota, avaliacaoGlobal, dataDeLancamento, horasDeVisualizacao, duracaoEmMinutos, duracao, vizulizacoes)
VALUES ('Filme Futuro', 0, 'Yes', '2030-01-01', 0, 120, '02:00', 0);

--resp: Sim, o MySQL aceita inserir uma data futura normalmente, desde que o formato seja válido.


-- Atualize a avaliação de um título específico da tbNetflix para 8.9.
update tbNetflix set avaliacaoGlobalNota = 8.9 
where titulo = 'O senhor dos Anéis';

-- Atualize todos os títulos lançados antes de 2020 para avaliação 7.5.

update tbNetflix set avaliacaoGlobalNota = 7.5
where dataDeLancamento < '2020-01-01';

-- Altere o nome de um gênero específico na tbGenero para “Suspense”.

update tbGenero set nome = 'Suspense'
where nome = 'Ação';

-- Atualize os títulos com mais de 2 horas para ter uma avaliação 9.0.
update tbnetflix set avaliacaoGlobalNota = 9
where duracao > '02:00';

-- O que acontece se você rodar um UPDATE sem WHERE?

-- resp: todos os registros da tabela serão atualizados com os novos valores informados. Isso pode causar perda de dados importantes se feito por engano.

-- Crie uma atualização que aumente todas as visualizações em 10%.

update tbnetflix set vizulizacoes = vizulizacoes * 1.10;


-- Atualize a duração de todos os títulos com nota inferior a 5 para 60 minutos.
update tbnetflix set duracao = '01:00'
where avaliacaoGlobalNota < 5;




-- Explique como usar UPDATE em múltiplas tabelas ao mesmo tempo no MySQL

-- Use UPDATE com JOIN para alterar colunas de várias tabelas ao mesmo tempo, desde que estejam relacionadas (chaves estrangeiras)

-- Remova um registro específico da tabela tbPerfil.

delete from tbPerfil 
where id_perfil = 2;

-- Delete todos os títulos com avaliação menor que 4.0.

delete from tbnetflix
where avaliacaoGlobalNota < 4;

-- Remova todos os gêneros da tabela tbGenero exceto “Drama”.

delete from tbGenero 
where nome != 'Drama';

-- Remova todos os conteúdos que não tenham valor na coluna vizulizacoes.

delete from tbnetflix
where vizulizacoes is null;

-- Delete todos os perfis com idade menor que 13 anos.

delete from tbperfil 
where idade < 13;

-- O que acontece se você usar DELETE sem cláusula WHERE?
--resp: Todos os registros da tabela serão removidos permanentemente, ou seja, a tabela ficará vazia.


-- Apague todos os conteúdos lançados após 2028.

delete from tbnetflix
where dataDeLancamento > '2028-01-01';

-- Remova títulos cujo nome começa com "The".

delete from tbnetflix 
where titulo like 'The%';


-- Explique a diferença entre DELETE, DROP e TRUNCATE.

-- resp: 
-- DELETE: Remove dados específicos com WHERE, mantém a tabela.

-- TRUNCATE: Remove todos os dados rapidamente, sem WHERE, mantém a tabela.

-- DROP: Apaga a tabela inteira, incluindo estrutura e dados.

--Crie duas tabelas: tbCategoria (id_categoria) e tbFilme (id_filme, id_categoria FK) com ON DELETE CASCADE.

create database exerDML3;

use exerDML3;

create table tbCategoria (
    id_categoria int primary key auto_increment
);

create table tbFilme (
    id_filme int primary key auto_increment,
    id_categoria_FK int,
    constraint fkCategoriaFilme foreign key (id_categoria_FK) references tbCategoria (id_categoria) on delete cascade
);

--	Insira 3 categorias e 5 filmes vinculados a essas categorias

insert into tbCategoria (id_categoria)
values (1),
(2),
(3);

insert into tbFilme (id_filme, id_categoria_FK)
values (1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 1);

-- Delete uma categoria. O que acontece com os filmes vinculados?

delete from tbCategoria
where id_categoria = 1;

-- Modifique a constraint da tabela tbFilme para ON DELETE SET NULL. Teste o comportamento.
alter table tbFilme
drop foreign key fkCategoriaFilme;

ALTER TABLE tbFilme
ADD CONSTRAINT fkCategoriaFilme
FOREIGN KEY (id_categoria_FK) REFERENCES tbCategoria(id_categoria)
ON DELETE SET NULL;


delete from tbFilme
where id_categoria_FK = 2;

-- Explique a diferença entre ON DELETE RESTRICT e ON DELETE NO ACTION.
-- resp:

--ON DELETE RESTRICT: Impede a exclusão do pai imediatamente se houver filhos relacionados.
--ON DELETE NO ACTION: Também impede a exclusão, mas a verificação ocorre no fim da transação.


-- Crie uma tabela tbVisualizacao com FOREIGN KEY para tbNetflix(cod) com ON DELETE CASCADE.
create table tbVisualizacao (
    id_visualizacao int primary key auto_increment,
    cod_netflix_fk int,
    dataVisualizacao DATE,
    constraint fkVisualizacaoNetflix foreign key (cod_netflix_fk) references tbNetflix(cod) on delete cascade
);
