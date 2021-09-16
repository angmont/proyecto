import requests

print("¡Bienvenido a mi script!\nSe desplegará información de lo que solicite en el formato de un diccionario")

while True:
  usuario = input("\nInserte su usuario de GitHub: ")
  dec1 = input("¿Qué desea realizar? \n[1]Revisar TODOS los repositorios del usuario \n[2]Ver información general del usuario \n[3]Ver los commits de un repositorio en especifico \n[4]Salir \n")
  if (dec1 == "1"):
    urlrepos = "https://api.github.com/users/" + usuario + "/repos"
    resp1 = requests.get(urlrepos)
    dic1 = (resp1.json())
    print (dic1)
    for repositorio in dic1:
      print ("\nRepositorio: " + repositorio["name"])
      dec2 = input ("¿Desea ver la información del repositorio llamado " + repositorio["name"] + "?\n[1]Si\n[2]No\n[3]No deseo ver la información de este repositorio ni de los siguientes\n")
      if (dec2 == "1"):
        urlinfo = "https://api.github.com/repos/"+ repositorio["full_name"]
        resp2 = requests.get(urlinfo)
        print (resp2.json())
      elif(dec2 == "2"):
        continue
      else:
        break
  elif (dec1 == "2"):
    urlusuario = ("https://api.github.com/users/" + usuario)
    resp3 = requests.get(urlusuario)
    dic3 = resp3.json()
    print(dic3)
    dec3 = input ("\n¿Desea ver informacion de sus seguidores?:\n[1]Si\n[2]No\n")
    if (dec3 == "1"):
      url = dic3["followers_url"]
      resp4 = requests.get(url)
      print (resp4.json())
  elif (dec1 == "3"):
    repo = input("Nombre del repositorio a revisar: ")
    revisar = usuario + "/" + repo
    urlcommits = "https://api.github.com/repos/" + revisar + "/commits"
    resp4 = requests.get(urlcommits)
    print (resp4.json())
  elif (dec1 == "4"):
    break
  else:
    print ("\nHa escrito una opción incorrecta :(")