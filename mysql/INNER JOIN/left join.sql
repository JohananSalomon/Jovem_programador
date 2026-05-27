use biblioteca_inner;

create table funcionarios (
id_funcionarios int auto_increment primary key,
nome varchar (50),
cargo varchar (40)
);

create table setores(
cod_setor int auto_increment primary  key,
nome_setor varchar (50),
andar varchar (15),
id_funcionarios int,
foreign key (id_funcionarios) references funcionarios (id_funcionarios)
);

insert into funcionarios (nome, cargo) values ('Carlos Silva', 'Gerente'),('Ana Souza', 'Atendente'),('Pedro Lima', 'Bibliotecario'),('Mariana Alves', 'Auxiliar'),('Joao Costa', 'Supervisor');
insert into setores (nome_setor, andar, id_funcionarios) values ('Administracao', '1 Andar', 1),('Atendimento', 'Terreo', 2),('Leitura', '2 Andar', 3);

select f.nome, f.cargo, s.nome_setor, s.andar from funcionarios f left join setores s on f.id_funcionarios = s.id_funcionarios;