create table livro(
id_livro int auto_increment primary key,
titulo varchar(50),
autor varchar(50),
quantidade int
);

create table emprestimos(
id int auto_increment primary key,
id_livro int,
aluno varchar(100),
data_emprestimo timestamp default current_timestamp,
status_livro varchar (50),
foreign key (id_livro) references livro(id_livro)
);

select * from livro;
select * from emprestimos;

insert into livro (titulo,autor,quantidade) values ("monaliza","capich",2);
insert into emprestimos (id_livro,aluno,status_livro) values (1,'maria',"");

update livro set ;