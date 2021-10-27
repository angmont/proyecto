$Texto = """
En las siguientes rutas que se pedirán, recuerde incluir el nombre del archivo, por ejemplo

Si desea que el archivo se llame info.txt
tendrá que escribir la ruta donde desea que vaya junto con el nombre
de la siguiente manera: 

C:\Users\Usuario\info.txt

"""


Write-Host $Texto

$Path = Read-Host -Prompt "Inserte la ruta donde vaya a querer la informacion obtenida"

$Path2 = Read-Host -Prompt "Inserta la ruta donde vaya a querer la informacion codificada"
#$Path = "C:\Users\amont\Escritorio\proyecto\Practica_9\InformacionObtenida.txt"

#$Path2 = "C:\Users\amont\Escritorio\proyecto\Practica_9\InformacionCodificada.txt"
try {
    Set-Content -Value (ipconfig /displaydns) -Path $Path

    $Codificacion = [convert]::ToBase64String((Get-Content -path $Path -Encoding byte))

    Set-Content -Value ($Codificacion) -Path $Path2

    Remove-Item $Path
} catch {
    Write-Host "Una ruta no fue escrita correctamente"
}