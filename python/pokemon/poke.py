import requests

nome = input ("Digite o nome do pókemon:").lstrip().lower() 

url = "https://pokeapi.co/api/v2/pokemon/" + nome 

resposta = requests.get(url)

print ("Status: ",resposta.status_code)

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

atividade função pra mostrar e pra exibir