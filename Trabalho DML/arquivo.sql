
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