import requests
import re
from bs4 import BeautifulSoup as bs

#url = input('Inserte la url:')
urls = ["https://www.uanl.mx/enlinea/", "https://www.themoscowtimes.com/page/moscow-times", "https://es.wikipedia.org/wiki/Friends"]

regex = r"[a-z0-9\.\-+_]+@[a-z0-9\.\-+_]+\.[a-z]+"


diccionario_emails = {}
for link in urls:
  response = requests.get(link)
  if response.status_code != 200:
    print("Hubo un error")
    exit()
  soup = bs(response.content, "html.parser")
  ti = (soup.find("title"))
  titulo = ti.get_text()
  busqueda = set(re.findall(regex, response.text, re.I))
  lista = []
  if len(busqueda) != 0:
    for email in busqueda:
      lista.append(email)
    diccionario_emails[titulo] = lista
  else:
    diccionario_emails[titulo] = "None"
print(diccionario_emails)


#print("Todo está listo!")