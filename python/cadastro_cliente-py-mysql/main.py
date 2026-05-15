#importar a biblioteca que serve para conectar o python ao banco de dados
import mysql.connector

from conexao import conectar, conexao
from cadastro_cliente import inserir_dados

conectar()
inserir_dados()
