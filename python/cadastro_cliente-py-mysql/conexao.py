#importar a biblioteca que serve para conectar o python ao banco de dados
import mysql.connector

#executa uma função da lib que realiza a conexão
def conectar ():
        conexao = mysql.connector.connect(
            host = "localhost",
            user = "root",
            password = "",
            database = "barbearia"
    )
        print ("conectado")
        cursor = conexao.cursor(conexao)
        return conexao

conectar()