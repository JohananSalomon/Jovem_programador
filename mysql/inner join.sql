use teste_bd;
create table cliente (
id_cliente int primary key auto_increment,
nome varchar (50) not null,
cpf varchar (12) unique not null
);

create table pedido (
id_servico int primary key auto_increment,
produto varchar (100),
valor decimal (10,2),
descricao varchar (300),
id_cliente int,
foreign key (id_cliente) references cliente (id_cliente)
);

select c.nome AS cliente, p.produto, p.valor from pedido p INNER JOIN cliente c ON p.id_cliente = c.id_cliente;
 
 drop table servico;
 
 insert into cliente (nome,cpf) values ("maria",8099090092);
 insert into pedido (produto,valor,descricao,id_cliente) values ("coca-cola",16,"uma coca fria",1);
 
create table aluno (
id_aluno int primary key auto_increment,
matricula varchar(15) unique not null,
nome varchar (50),
data_nascimento date,
id_turma int,
foreign key (id_turma) references turma (id_turma) 
);

create table turma (
id_turma int primary key auto_increment,
nome_turma varchar (50) not null,
turno varchar (50)
);

insert into aluno (matricula,nome,data_nascimento,id_turma) values (1,"joão",'2006-08-23',1),(2,"Maria",'2008-01-23',2),(3,"joão",'2009-10-13',3),(4,"Pedro",'2010-02-12',4),(5,"Lucas",'2006-04-01',5);
insert into turma (nome_turma,turno) values ("Matematica","Matutino"),("Portugues","Vespertino"),("Historia","Noturno"),("Ciencias","Matutino"),("Geografia","Vespertino");

select a.nome, a.matricula AS aluno, t.nome_turma, t.turno from turma t inner join aluno a on a.id_turma = t.id_turma;

drop table turma;

select * from turma;

create table aluno (
id int primary key,
nome varchar(50)
);

insert into aluno (id,nome) values (1,"joão"),(2,"ana"),(3,"rafael"),(4,"carlos");
insert into notas (cod,materia,nota,id_aluno) values (1,"matematica",5,1),(2,"historia",8,2),(3,"educação fisica",3,4);
 
create table notas(
cod int primary key,
materia varchar(45),
nota int,
id_aluno int,
foreign key (id_aluno) references aluno (id)
);

select * from aluno;
select * from notas;

select a.nome, n.materia, n.nota from aluno a left join notas n ON n.id_aluno = a.id;
