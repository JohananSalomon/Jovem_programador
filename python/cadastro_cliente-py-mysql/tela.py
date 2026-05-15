import mysql.connector
from conexao import conectar
from listar_cliente import listar_clientes
from cadastro_cliente import cadastro_cliente


def menu():
    print("\nBem-vindo ao sistema de cadastro de clientes!\n")
    print("1. Cadastrar cliente")
    print("2. Listar clientes")
    print("3. Sair")

while True:
    menu()
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1":
        cadastro_cliente()
    elif opcao == "2":
        listar_clientes(conectar())
    elif opcao == "3":
        print("Saindo...")
        break
    else:
        print("Opção inválida. Tente novamente.")



