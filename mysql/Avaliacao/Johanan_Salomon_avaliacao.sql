use pizzaria;

create table cliente (
id_cliente int primary key auto_increment,
nome varchar (50) not null,
telefone varchar (15),
email varchar (100),
cidade varchar (80)
);

create table endereco (
id_endereco int primary key auto_increment,
rua varchar (150),
numero varchar (10),
bairro varchar (80),
id_cliente int,
foreign key (id_cliente) references cliente (id_cliente)
);

create table categoria (
id_categoria int primary key auto_increment,
nome varchar (80),
descricao varchar (200)
);

create table pizza (
id_pizza int primary key auto_increment,
nome varchar (100),
sabor varchar (80),
tamanho varchar (20),
preco decimal (10,2),
id_categoria int,
foreign key (id_categoria) references categoria (id_categoria)
);

create table pedido (
id_pedido int primary key auto_increment,
data_pedido date not null,
quantidade int not null,
status_pedido varchar (30),
id_cliente int,
id_pizza int,
foreign key (id_cliente) references cliente (id_cliente),
foreign key (id_pizza) references pizza (id_pizza)
);

insert into categoria (nome,descricao) values ("Tradicional","Pizza classica do cardápio"),("Especial","Pizza premium com ingredientes diferenciados"),("Doce","Pizza com recheio doce");
insert into cliente (nome,telefone,email,cidade) values ("Ana Souza","4991112233","ana@email.com","videira"),("Bruno Lima","4994445566","bruno@email.com","caçador"),("Carla Melo","497778899","carla@email.com","fraiburgo"),("Diego Costa","4990001122","diego@email.com","videira");
insert into endereco (rua,numero,bairro,id_cliente) values ("Rua Das Flores",123,"Centro",1),("Av. Brasil",456,"São Cristovão",2),("Rua XV de Novembro",789,"Centro",3),("Rua Tiradentes",321,"Vila Nova",4);
insert into pizza (nome,sabor,tamanho,preco,id_categoria) values ("Margherita","Queijo e Tomate","M",35.90,1),("Portuguesa","Presunto e Ovos","G",49.90,1),("Frango BBQ","Frango e Barbecue","G",54.90,2),("Chocolate","Nutella e Morango","M",42.00,3);
insert into pedido (data_pedido,quantidade,status_pedido,id_cliente,id_pizza) values ('2026-10-01',1,"entregue",1,2),('2026-10-03',2,"entregue",2,1),('2026-10-05',1,"aguardando",3,3),('2026-10-07',3,"em preparo",1,1),('2026-10-10',1,"aguardando",4,4);
insert into pedido (data_pedido,quantidade,status_pedido,id_cliente,id_pizza) values ('2026-10-13',3,"entregue",3,2);

select nome,email,cidade from cliente where cidade = "videira";

select c.nome as cliente, e.rua, e.numero, e.bairro from endereco e inner join cliente c on c.id_cliente = e.id_cliente;  

select count(*) from pedido;

update pedido set status_pedido = "entregue" where id_pedido = 3;

alter table pedido add column desconto decimal (10,2) default 0.00;


select * from cliente;
select * from endereco;
select * from pizza;
select * from pedido;
select * from log_pedidos;
select * from vw_pizza_cardapio;

create table log_pedidos (
id_log int auto_increment primary key,
id_pedido int,
data_hora datetime,
mensagem varchar (100),
foreign key (id_pedido) references pedido (id_pedido)
);
create view vw_pizza_cardapio AS select p.nome as nome_pizza, p.sabor, p.tamanho, p.preco as pizza, c.nome from categoria c join pizza p on c.id_categoria = p.id_categoria; 

DELIMITER //
create trigger trg_log_pedido
after insert on pedido
for each row
begin
	insert into log_pedidos (id_pedido,data_hora,mensagem)
    values (new.id_pedido, now(), 'Novo Pedido Registrado');
END //
DELIMITER ;

select * from vw_pizza_cardapio where nome = "especial";