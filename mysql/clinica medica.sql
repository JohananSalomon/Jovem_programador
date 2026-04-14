create table paciente(
cpf bigint(11) primary key,
nome varchar(50) not null,
data_nascimento date not null,
endereco varchar(100)
);

create table recepcao (
matricula int auto_increment primary key,
nome varchar(50) not null,
genero varchar(10) not null,
data_nascimento date not null,
cpf_paciente bigint(11),
foreign key (cpf_paciente) references paciente (cpf)
);

create table triagem (
id_triagem int auto_increment primary key,
descricao varchar(200),
data_triagem datetime default current_timestamp,
matricula_recepcao int,
cpf_paciente bigint(11),
foreign key (matricula_recepcao) references recepcao (matricula),
foreign key (cpf_paciente) references paciente (cpf)
);

create table consulta(
id_consulta int auto_increment primary key,
data_consulta datetime default current_timestamp,
cpf_paciente bigint(11),
id_triagem int,
foreign key (id_triagem) references triagem (id_triagem),
foreign key (cpf_paciente) references paciente (cpf)
);

create table doutor(
cpf_doutor bigint(11) primary key,
nome varchar(50) not null,
data_nascimento date not null,
especialidade varchar(50),
cpf_paciente bigint(11),
id_consulta int,
foreign key (cpf_paciente) references paciente (cpf),
foreign key (id_consulta) references consulta (id_consulta)
);

select * from paciente;
select * from recepcao;
select * from triagem;
select * from consulta;
select * from doutor;

insert into paciente (cpf,nome,data_nascimento,endereco) values (67187609876,"gasbriel",'2000-04-25',"rua santos carlinhos bairro calinho"),
(67187609877,"johanins",'2005-07-05',"rua renar bairro calinhos"),
(67187609878,"leosnado",'1975-01-01',"rua flores bairro calinho"),
(67187609879,"pesdro",'2002-04-02',"rua pedroso bairro pedro"),
(67187609880,"ronaldos",'2007-06-07',"rua pato bairro fresco");

insert into recepcao (nome,genero,data_nascimento,cpf_paciente) values ("joão","masculino",'2000-04-02',67187609876),
("frabisio","masculino",'1990-12-08',67187609877),
("laura","feminino",'1992-05-09',67187609878),
("virgicios","masculino",'1987-03-13',67187609879),
("malta","feminino",'1995-05-07',67187609880);

insert into triagem (descricao,matricula_recepcao,cpf_paciente) values ("dor nosoio",1,67187609876),("pneumonia",2,67187609877),("cancer",3,67187609878),("glipe",4,67187609879),("ta doente",5,67187609880);

insert into consulta (cpf_paciente,id_triagem) values (67187609876,1),(67187609877,2),(67187609878,3),(67187609879,4),(67187609880,5);

insert into doutor (cpf_doutor,nome,data_nascimento,especialidade,cpf_paciente,id_consulta) values (54372819082,"beringela",'1900-04-09',"urologista",67187609876,1),
(54372819083,"bengala",'1800-01-01',"doutor",67187609877,2),
(54372819087,"ronaldo",'1900-04-09',"urologista",67187609878,3),
(54372819084,"verganis",'1900-04-09',"urologista",67187609879,4),
(54372819088,"panaca",'1800-01-01',"pediastra",67187609880,5);


drop table consulta;
drop table recepcao;
