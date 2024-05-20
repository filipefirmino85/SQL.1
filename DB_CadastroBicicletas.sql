if not exists (
           select name from  master.sys.databases
           where name = 'db_bicyclonV1')
begin 
    create database db_bicyclonV1;
end;

use db_bicyclonV1

-- criar tabela com condição

create table tb_linha_produtos(
id_linha_produto int identity (1,1) primary key,
nome  varchar (255) not null,
descrição varchar (255)not null);


create table tb_produtos(
id_produtos int identity (1,1) primary key,
nome varchar (255) not null,
descrição varchar (255)not null,
preço money not null,
fk_linha_produto int,
foreign key (fk_linha_produto) references tb_linha_produtos(id_linha_produto));

create table tb_endereços(
id_endereços int identity (1,1) primary key,
país varchar(255) default 'Brasil',
uf char (2) not null,
cidade varchar(255) not null,
bairro varchar(255) not null,
rua varchar(255) not null, 
número int not null);

create table tb_regionais(
id_regionall int identity (1,1) primary key,
nome varchar(255) not null,
telefone varchar(255) not null,
fk_endereço int not null,
foreign key (fk_endereço) references tb_endereços(id_endereços));

create table tb_vendedores(
id_vendedor int identity (1,1) primary key,
nome varchar(255) not null,
email varchar(255) not null,
fk_regionall int,
foreign key (fk_regionall) references tb_regionais(id_regionall),
fk_endereço int,
foreign key (fk_endereço) references tb_endereços(id_endereços));

create table tb_clientes(
id_cliente int identity (1,1) primary key,
nome varchar(255) not null,
fk_endereço int,
foreign key (fk_endereço) references tb_endereços(id_endereços),
fk_regionall int,
foreign key (fk_regionall) references tb_regionais(id_regionall));

create table tb_pedidos(
id_pedidos int identity (1,1) primary key,
dt_pedido datetime not null,
fk_cliente int,
foreign key (fk_cliente) references tb_clientes(id_cliente),
fk_vendedor int,
foreign key (fk_vendedor) references tb_vendedores(id_vendedor));

create table tb_intens_pedidos(
id_item_pedido int identity (1,1) primary key,
quantidade int not null,
desconto decimal(5,2) default 0.0,
fk_pedido int,
foreign key (fk_pedido) references tb_pedidos(id_pedidos),
fk_produto int,
foreign key (fk_produto) references tb_produtos(id_produtos));





insert into tb_linha_produtos values
('Mountain Bikes','Bicicletas ideais para trilhas e terrenos acidentados'),
('Road Bikes','Bicicletas de alta performance para estradas e competições'),
('Hybrid Bikes','Bicicletas versáteis para uso urbano e fora de estrada'),
('BMX Bikes','Bicicletas robustas e ágeis para manobras e práticas esportivas'),
('Electric Bikes','Bicicletas com motor elétrico, ideais para deslocamentos mais longos'),
('Folding Bikes','Bicicletas dobráveis, perfeitas para armazenamento e viagens'),
('Kids Bikes','Bicicletas especialmente projetadas para crianças'),
('Cruiser Bikes','Bicicletas confortáveis para passeios descontraídos'),
('Fat Bikes','Bicicletas com pneus largos, ideais para superfícies arenosas'),
('Touring Bikes','Bicicletas projetadas para viagens e aventuras de longa distância')



insert into tb_produtos values
('Trailblazer 1000','Mountain Bike com suspensão dianteira',1999,1),
('Summit Seeker 2000','Mountain Bike com suspensão dianteira e traseira',2499,1),
('Velocity Racer 3000','Road Bike de carbono leve',3499,2),
('Urban Commuter 4000','Hybrid Bike para uso urbano e off-road',1199,3),
('Stunt Master 5000','BMX Bike para acrobacias e manobras',1699,4),
('E-Power Cruiser 6000','Electric Bike com motor de pedal assistido',2399,5),
('Foldaway Trekker 7000','Folding Bike compacta e fácil de transportar',1999,6),
('Junior Adventurer 8000','Kids Bike para crianças de 6 a 9 anos',2999,7),
('Coastal Breezer 9000','Cruiser Bike com assento acolchoado',1499,8),
('Sand Surfer 10000','Fat Bike com pneus largos para terrenos arenosos',1599,9),
('Expedition Voyager 11000','Touring Bike para viagens longas e aventuras',2799,10);



insert into tb_endereços values
(default , 'SP', 'São Paulo', 'Ipiranga', 'Das Bicicletas', 123),
(default , 'RJ', 'Rio de Janeiro', 'Lapa', 'Av. das Pedaladas', 456),
(default , 'SP', 'Santos', 'Lambará', 'Praça dos Ciclistas', 789),
(default , 'BA', 'Salvador', '7 de abril', 'Travessa das Bikes', 101),
(default , 'BA', 'Camaçary', 'Comédia', 'Alameda das Ciclovias', 458),
(default , 'SP', 'São Paulo', 'Ipiranga', 'Das Bicicletas', 9623),
(default , 'RJ', 'Rio de Janeiro', 'Lapa', 'Av. das Pedaladas', 459),
(default , 'BA', 'Salvador', '7 de abril', 'Travessa das Bikes', 101),
(default , 'SP', 'São Paulo', 'Ipiranga', 'Das Bicicletas', 3),
(default , 'SP', 'Santos', 'Pemba', 'Limão Azul', 12),
(default , 'SP', 'São Paulo', 'Pascal', 'Das Motonetas', 6614),
(default , 'RJ', 'Rio de Janeiro', 'Três Rios', 'Pedro Thomaz', 460),
(default , 'SP', 'São Paulo', 'Pascal', 'Das Motonetas', 21),
(default , 'BA', 'Salvador', 'Paripeira', 'Mangueira', 1051),
(default , 'SP', 'Santos', 'Limeira', 'Costa azul', 21),
(default , 'RJ', 'Três Rios', 'Centro', 'Quincão', 36),
(default , 'SP', 'São Paulo', 'Ipiranga', 'Tabor', 468),
(default , 'BA', 'Salvador', 'Cebolinha', 'Travessa Alves', 1248),
(default , 'RJ', 'Paraiba do Sul', 'Grama', 'Saluares', 4569),
(default , 'RJ', 'Rio de Janeiro', 'Barra', 'Av. Florida', 1952),
(default , 'RJ', 'Rio de Janeiro', 'Barra', 'Av. Praiana', 3254),
(default , 'RJ', 'Rio de Janeiro', 'Jardins', 'Av. Jardineiros', 25),
(default , 'RJ', 'Rio de Janeiro', 'Jardins', 'Av. Lápis', 250),
(default , 'MG', 'Juiz de Fora', 'Ipatinha', 'Patas', 9632),
(default , 'RJ', 'Rio de Janeiro', 'Copa', 'Copa caca', 1485),
(default , 'SP', 'São Paulo', 'Ipiranga', 'Coronel Diogo', 2123),
(default , 'RJ', 'Rio de Janeiro', 'Leme', 'Paolo Lolo', 154),
(default , 'RJ', 'Rio de Janeiro', 'Pipoca', 'Av. Pipocas', 25),
(default , 'MG', 'Pombas', 'Caramelo', 'A',32),
(default , 'MG', 'Pomas', 'Cascatas', 'Cerol', 632),
(default , 'BA', 'Salvador', 'Pereira', 'Batuque', 51),
(default , 'SP', 'São Paulo', 'Itaquera', 'Alameda Meda', 123);



insert into tb_regionais values
('Região Sudeste','1112122121',1),
('Região Sudeste','2133333333',2),
('Região Sudeste','1422122212',3),
('Região Nordeste','7145455454',4),
('Região Nordeste','7132332233',5)



insert into tb_clientes values 
('Velocycle Emporium',31, 2),
('Pedal & Gear Haven',27, 2),
('CicloFusion Marketplace',32, 5),
('BiciMondo Ventures',26, 4),
('SpinScape Bikes & Beyond',23, 4),
('CyclaVista Cyclery',30, 3),
('RollRight Wheels Emporium',24, 3),
('GearSpin Provisions',28, 5),
('BikeHub Oasis',25, 4),
('PedalCraft Boutique',29, 4);


insert into tb_pedidos values
(convert(datetime, '2023-07-21 08:30:00', 120), 5, 4),
(convert(datetime, '2023-07-22 09:15:00', 120), 6, 15),
(convert(datetime, '2023-08-27 08:45:00', 120), 4, 19),
(convert(datetime, '2023-08-28 10:10:00', 120), 8, 5),
(convert(datetime, '2023-08-05 09:45:00', 120), 6, 15),
(convert(datetime, '2023-08-15 08:20:00', 120), 3, 4),
(convert(datetime, '2023-08-17 08:30:00', 120), 1, 5),
(convert(datetime, '2023-08-17 09:25:00', 120), 1, 5),
(convert(datetime, '2023-08-21 09:55:00', 120), 9, 6),
(convert(datetime, '2023-08-23 10:30:00', 120), 6, 7),
(convert(datetime, '2023-08-27 11:15:00', 120), 4, 5),
(convert(datetime, '2023-08-01 11:30:00', 120), 2, 4),
(convert(datetime, '2023-09-05 12:00:00', 120), 9, 20),
(convert(datetime, '2023-09-28 13:15:00', 120), 5, 19),
(convert(datetime, '2023-09-15 13:45:00', 120), 3, 6),
(convert(datetime, '2023-09-26 14:30:00', 120), 9, 18),
(convert(datetime, '2023-09-28 15:10:00', 120), 6, 6),
(convert(datetime, '2023-10-29 16:30:00', 120), 4, 19);



insert into tb_intens_pedidos values 
(2, 0.00, 3, 1),
(3, 0.10, 3, 2),
(1, 0.05, 4, 3),
(4, 0.15, 4, 4),
(2, 0.00, 3, 5),
(2, 0.10, 10, 6),
(5, 0.05, 11, 7),
(1, 0.10, 12, 8),
(3, 0.00, 3, 9),
(5, 0.15, 4, 7),
(1, 0.05, 5, 8),
(3, 0.10, 5, 9),
(5, 0.00, 5, 7),
(1, 0.15, 5, 8),
(3, 0.05, 6, 9),
(5, 0.10, 6, 7),
(1, 0.00, 7, 8),
(3, 0.10, 8, 9),
(5, 0.15, 10, 7),
(2, 0.00, 11, 1),
(3, 0.10, 11, 2),
(1, 0.05, 11, 3),
(4, 0.15, 12, 4),
(2, 0.00, 12, 5),
(2, 0.10, 12, 6),
(5, 0.05, 13, 7),
(1, 0.10, 13, 8),
(3, 0.00, 13, 9),
(5, 0.15, 14, 7),
(1, 0.05, 15, 8),
(3, 0.10, 15, 9),
(5, 0.00, 16, 7),
(1, 0.15, 17, 8),
(3, 0.05, 18, 9);

select * from tb_pedidos

insert into tb_vendedores values
--('João Silva','joao.silva@email.com',1,6),
--('Maria Santos', 'maria.silva@email.com',1, 9),
--('Pedro Souza', 'pedro.souza@email.com',1, 10),
('Ana Oliveira', 'ana.oliveira@email.com',2,15),
('Rafael Vieira', 'rafael.vieira@email.com',2,17),
('Fernanda Lima', 'fernanda.lima@email.com',3,11),
('Luiz Pereira', 'luiz.pereira@email.com',3,13),
('Camila Carvalho', 'camila.carvalho@email.com',1,7),
('Ana Gomes', 'ana.gomes@email.com',4,16),
('Letícia Fernandes', 'leticia.fernandes@email.com',3,19),
('Sheila Gomes', 'sheila.silva@email.com',4,16),
('Paula Costa', 'paula.costa@email.com',5,12),
('Laura Fernandes', 'laura.santos@email.com',3,19),
('Ricardo Fernandes', 'ricardo.almeida@email.com',3,19),
('Renata Ferreira', 'renata.ferreira@email.com',5,21),
('Marcos Lima', 'marcos.souza@email.com',3,8),
('Isabela Fernandes', 'isabela.santos@email.com',3,19),
('Gustavo Oliveira', 'gustavo.oliveira@email.com',2,14),
('Juliana Lima', 'juliana.lima@email.com',3,8),
('Daniel Ribeiro', 'daniel.ribeiro@email.com',5,18)