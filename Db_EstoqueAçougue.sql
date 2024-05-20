create database db_açougue;
go
use db_açougue;


create table tb_categoria(
ID_categoria int identity(1,1) primary key,
nome varchar (255) not null,
dt_registro datetime default getdate()
);


create table tb_carne(
id_carne int identity(1,1) primary key,
nome varchar(255) not null,
preço money not null,
dt_validade date not null,
fk_categoria int, 
foreign key (fk_categoria) references tb_categoria(ID_categoria),
dias_restantes as datediff(day,getdate(), dt_validade),
dt_registro datetime default getdate()
);

insert into tb_categoria values
('Bovina', default),
('Suína', default),
('Frango', default),
('Linguiça', default),
('Peixe', default);



insert into tb_carne values
('Alcatra', 25.99, '2024-07-15', 1, default),
('Picanha', 32.50, '2024-04-18', 1, default),
('Coxa de Frango', 19.99, '2024-04-19', 3, default),
('Costela Suína', 15.75, '2024-08-20', 2, default),
('Linguiça Toscana', 10.50, '2024-08-10', 4, default),
('Salmão', 38.90, '2024-08-22', 5, default),
('Carne de Sol', 10.50, '2024-08-25', 1, default),
('Bife de Filé Mignon', 40.60, '2024-07-20', 1, default),
('Pernil de Porco', 35.25, '2024-04-30', 2, default),
('Tilápia', 17.50, '2024-05-08', 5, default);

-- retirando as duplicatas
delete from tb_carne where ID_carne > 10;


-- Consulta para selecionar todas as carnes com seus preços
select nome, preço from tb_carne;

-- Consulta para selecionar carnes com dias restantes de validade menores que 5 dias
select nome, dias_restantes from tb_carne 
where dias_restantes < 5;

-- Consulta para selecionar carnes com preços entre R$ 20 e R$ 30
select nome, preço from tb_carne
where preço between 20.00 and 30.00;

-- Consulta para selecionar carnes ordenadas por data de validade mais próxima
select nome, dt_validade from tb_carne
order by dt_validade;

-- Consulta para selecionar a quantidade de carnes em cada categoria
select tb_categoria.nome, COUNT(*) as Quantidade
from 
tb_categoria join tb_carne
on tb_carne.fk_categoria = tb_categoria.ID_categoria
group by tb_categoria.nome
order by Quantidade desc;

--Consulta para selecionar carnes de uma categoria específica (exemplo: Bovina = categoria 1)
select nome, preço from tb_carne
where fk_categoria = 1;

-- ou 
select nome, preço from tb_carne
where fk_categoria = (
    select id_categoria from tb_categoria
    where nome = 'Bovina');

-- Consulta para selecionar a categoria com o menor preço médio das carnes
select 
	top 1
    tb_categoria.nome, 
	CONVERT(decimal(10,2), AVG(tb_carne.preço)) as 'Preço Médio'
from 
    tb_categoria join tb_carne
    on tb_categoria.id_categoria = tb_carne.fk_categoria
	group by tb_categoria.nome
	order by 'Preço Médio';


-- alterar o preço da picanha para 34.50
update tb_carne set preço = 34.5 where nome = 'Picanha';

-- Deletar as carnes vencidas 
delete from tb_carne where dt_validade < getdate();



