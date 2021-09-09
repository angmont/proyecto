function Crear_Directorio {
    param([Parameter(Mandatory, ValueFromPipeline)] [string]$nombre = 'directorio')
    mkdir $nombre
    Write-Host 'Se ha creado un directorio con el nombre de su preferencia'
}
function Eliminar_Directorio {
    param([Parameter(Mandatory, ValueFromPipeline)] [string]$msg = 'directorio')
    rmdir $msg
    Write-Host 'Se ha eliminado exitosamente el directorio'
}
Write-Host "Bienvenido"
$verdadero = $True
while($verdadero -eq $True) {
    $decision = Read-Host -Prompt '¿Qué desea realizar? [1] Crear un directorio [2] Eliminar un directorio [3] Salir'
    if ($decision -eq 1)
    {
        $leer = Read-Host -Prompt 'Escriba el nombre que desea que tenga el directorio'
        $leer | Crear_Directorio
    } elseif ($decision -eq 2)
    {
        $borrado = Read-Host -Prompt 'Escriba del directorio a eliminar'
        $borrado | Eliminar_Directorio
    } elseif ($decision -eq 3)
    {
        Write-Host "Gracias por probar el script"
        exit
    } else
    {
        Write-Host "Ha escrito una opción incorrecta"
    }
}

