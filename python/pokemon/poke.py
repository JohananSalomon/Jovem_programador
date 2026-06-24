import requests

def mostrar_informacoes():
    nome = input ("Digite o nome do pókemon:").lstrip().lower() 
    url = "https://pokeapi.co/api/v2/pokemon/" + nome 
    resposta = requests.get(url)
    dados = resposta.json()

    print("--- informações gerais ---")
    print ("Nome: ",dados['name'])
    print ("Número: ",dados['id'])
    print ("Altura: ",dados['height'])
    print ("Peso: ",dados['weight'])

    print ("--- Habilidades ---")
    for item in dados ["types"]:
        print("-", item ["type"]["name"])

    print("--- stats ---")
    for stat in dados ["stats"]:
        print("-", stat ["stat"]["name"], ":",stat["base_stat"])

def batalha():

    player1 = input("Digite o nome do 1° pokemon: ")
    player2 = input("Digite o nome do 2° pokemon: ")
    
    url_pj1 = "https://pokeapi.co/api/v2/pokemon/" + player1
    url_pj2 = "https://pokeapi.co/api/v2/pokemon/" + player2
    
    lutador1 = requests.get(url_pj1)
    lutador2 = requests.get(url_pj2)

    dados1 = lutador1.json()
    dados2 = lutador2.json()

    print (f"Dados pokemon 1 {player1}!")
    for stats1 in dados1 ["stats"]:
        print("-", stats1 ["stat"]["name"], ":",stats1["base_stat"])
    print (f"Dados pokemon 2 {player2}!")
    for stats2 in dados2 ["stats"]:
        print("-", stats2 ["stat"]["name"], ":",stats2["base_stat"])

    if stats1 ["base_stat"] > stats2 ["base_stat"]:
        print (f"{pokemon1} venceu!")
    if stats2 ["base_stat"] < stats1 ["base_stat"]:
        print (f"{pokemon2} venceu!")


     
def menu():
    print("\nBem-vindo a batalha pokemon!\n")
    print("1. Mostrar informações")
    print("2. Batalha pokemon!")
    print("3. Sair")

while True:
    menu()
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1":
        mostrar_informacoes()
    elif opcao == "2":
        batalha ()
    elif opcao == "3":
        print("Saindo...")
        break
    else:
        print("Opção inválida. Tente novamente.")
