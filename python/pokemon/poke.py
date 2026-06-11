import requests

nome = input ("Digite o nome do pókemon:").lstrip().lower() 

url = "https://pokeapi.co/api/v2/pokemon/" + nome 

resposta = requests.get(url)

print ("Status: ",resposta.status_code)

dados = resposta.json()

def mostrar_informacoes():
    print("--- informações gerais ---")
    print ("Nome: ",dados['name'])
    print ("Número: ",dados['id'])
    print ("Altura: ",dados['height'])
    print ("Peso: ",dados['weight'])

def mostrar_habilidades():
    print ("--- Habilidades ---")
    for item in dados ["types"]:
        print("-", item ["type"]["name"])

def mostrar_stats():
    print("--- stats ---")
    for stat in dados ["stats"]:
        print("-", stat ["stat"]["name"], ":",stat["base_stat"])

mostrar_informacoes()
mostrar_habilidades()
mostrar_stats()