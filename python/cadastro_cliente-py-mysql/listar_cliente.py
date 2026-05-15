import mysql.connector
from conexao import conectar

def listar_clientes(conexao):
    cursor = conexao.cursor()
    cursor.execute("select * from clientes")
    resultados = cursor.fetchall()
    print("\ntabela de clientes:\n")
    for cliente in resultados:
        print(f"ID: {cliente[0]}, Nome: {cliente[1]}, Telefone: {cliente[2]}, Email: {cliente[3]}")


