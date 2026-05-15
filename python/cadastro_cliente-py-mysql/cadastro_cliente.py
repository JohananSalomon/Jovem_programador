import mysql.connector
from conexao import conectar


def cadastro_cliente ():
    nome = input ("digite seu nome:")
    telefone = input ("qual a seu telefone?:")
    email = input("digite seu email:")

    sql = "insert into clientes (nome,telefone,email) values (%s,%s,%s)"
    values = (nome,telefone,email)

    con = conectar()
    cursor = con.cursor()

    cursor.execute(sql,values)
    con.commit()

    print (f"\ncliente {nome} cadastrado com sucesso!!\n")

    cursor.close()
    con.close()

