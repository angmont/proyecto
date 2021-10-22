$i = 0
$local = Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi
$ip = $local.IPAddress
# --- obtención de ip local ---

$publica = Invoke-RestMethod ifconfig.me
# --- obtencion de ip publica ---


$segmento = nmap -sP $ip/24
# --- se realiza nmap a un segmento de la red ---

$recorte = $segmento -match '[0-9]{1,3}\.[0-9]{1,3}\.0\.[0-9]' -split "Nmap scan report for "

foreach($num in $recorte){
    $i = $i + 1
    if ($i % 2 -eq 0){
        if ($i -eq 2){

            $ip_segmento = nmap $num
            # --- se realiza nmap a una ip del segmento ---
  
         }
        
    }
}
$ip_publica =nmap --script=http-headers youtube.com
# --- nmap a una ip pública, utilizando el script http-headers para obtener info extra---

#Nota: se comentó en clase que se podría aplicar el script
#al nmap de la ip del segmento, o se podía aplicar a la ip publica
#En este caso por preferencia personal se lo apliqué a la ip pública 

$texto = "Información obtenida: Ip local (Solamente una de varias):", [string]$ip, "`n`nIp pública:", [string]$publica
$texto1 = "`n`nSegmento de red privada:`n", [string]$segmento, "`n`nNmap a una ip del segmento:`n", [string]$ip_segmento
$texto2 = "`n`nNmap a una ip publica:`n", [string]$ip_publica 
$texto3 = "`n`nNota: Para la ip publica se utilizó la página de youtube bajo el script de http-headers"

$texto_f = [string]$texto, [string]$texto1, [string]$texto2, [string]$texto3
$texto_final = [string]$texto_f

$codificacion = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($texto_final))
try{
    Set-Content -Value "$codificacion" -Path C:\Users\amont\Escritorio\proyecto\Practica_6\InformacionObtenida.txt
}   catch{
           $Path_Personal = Read-Host "Inserte el path de su preferencia"
           Set-Content -Value "$codificacion" -Path $Path_Personal
}
Write-Host "Información enviada"