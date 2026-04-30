create table cliente (
cpf bigint(11) primary key,
nome varchar(50) not null,
telefone bigint(15) not null
);

create table horario (
id_horario int auto_increment primary key,
data_triagem datetime default current_timestamp,
data_horario date not null,
cpf_cliente bigint(11),
id_servicos int,
foreign key (id_servicos) references servicos (id_servicos),
foreign key (cpf_cliente) references cliente (cpf)
);

create table servicos (
id_servicos int auto_increment primary key,
descricao varchar (200) not null,
items varchar(300) not null,
valor decimal (10.2),
cpf_cliente bigint(11),
foreign key (cpf_cliente) references cliente (cpf)
);

insert into cliente (cpf,nome,telefone) values (80303483704,"maria",49991611543), (80303483705,"pedro",49991611544),(80303483706,"jose",49991611545);
insert into servicos (descricao,items,valor,cpf_cliente) values ("troca de oleo e filtro","oleo,filtro",50.00,80303483704),("troca de correia","correia",100.00,80303483705),("troca de filtros de ar e combustivel","filtro de ar,filtro de combustivel",300.00,80303483706);
insert into horario (data_horario,cpf_cliente,id_servicos) values ('2026-04-25',80303483704,1),('2026-04-30',80303483705,2),('2026-05-06',80303483706,3);

select * from cliente; 
select * from horario;
select * from servicos;

drop table cliente;
drop table servicos;
drop table horario;