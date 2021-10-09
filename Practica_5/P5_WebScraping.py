import requests 
from bs4 import BeautifulSoup as bs

pagina = requests.get("https://es.wikipedia.org/wiki/Gilmore_Girls")
soup = bs(pagina.content,"html.parser")

titulo = (soup.find("title"))
escritura = open("Gilmore.txt", "a")
escritura.write(titulo.get_text() + "\n\n")
texto = soup.find_all("p")[:5]
for p in texto:
    texto = p.get_text()
    long = len(texto)
    if long > 79:
        while long > 79:
            cadena = texto
            cadena = cadena[:79]
            texto = texto[79:]
            long = len(texto)
            escritura.write(cadena + "\n")
        if long <= 79:
            escritura.write(texto + "\n\n")
    else:
        escritura.write(texto)
escritura.close()
print("Todos los datos se han almacenado en 'Gilmore.txt'")