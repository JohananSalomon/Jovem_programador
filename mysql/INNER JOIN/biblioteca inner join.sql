use biblioteca_inner;

create table livros (
id_livros int primary key auto_increment,
titulo varchar (50),
autor varchar (50)
);

create table emprestimos (
cod_emprestimos int primary key auto_increment,
nome_cliente varchar (50),
data_emprestimo date,
id_livros int,
foreign key (id_livros) references livros (id_livros)
);

insert into livros (titulo, autor) values('Dom Casmurro', 'Machado de Assis'),('O Hobbit', 'J.R.R. Tolkien'),('Harry Potter', 'J.K. Rowling'),('1984', 'George Orwell');
insert into emprestimos (nome_cliente, data_emprestimo, id_livros) values('Carlos Silva', '2026-05-10', 1),('Ana Souza', '2026-05-12', 3);

select l.titulo, l.autor, e.nome_cliente, e.data_emprestimo from emprestimos e inner join livros l on e.id_livros = l.id_livros;

select * from livros;
select * from emprestimos;