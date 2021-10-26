$i = 0
$Python = "python.exe"
$Ruta = Read-Host -Prompt "Inserte la ruta en donde se encuentra el script de web scraping"
$Ruta2 = Read-Host -Prompt "Inserte la ruta en donde se encuentra el script de envio de correos"

While ($i -eq 0) {
    $Destinatario = Read-Host -Prompt "Inserte el correo del destinatario"
    $Remitente = Read-Host -Prompt "Inserte su correo"
    $ContraMuySegura = Read-Host -AsSecureString "Contraseña:"
    $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($ContraMuySegura)
    $Contraseña = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

    try{
        $Contenido = &$Python $Ruta
        $Asunto = Read-Host -Prompt "Asunto"
        &$Python $Ruta2 -rmt $Remitente -to $Destinatario -msg $Contenido -sub $Asunto -pwd $Contraseña

    } catch{
        Write-Host "No se pudo enviar el correo"
        }
      $decision = Read-Host "Desea salir del script? [1] Si [2] No"
      if ($decision -eq "1") {
        $i = 1
      } else {
        $i = 0
      }
      

  }