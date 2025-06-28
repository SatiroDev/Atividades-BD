
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

Da erro, pois valores duplicados não são permitidos em colunas UNIQUE.