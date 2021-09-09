#!/bin/bash
function cuadrado() {
  for j in $(seq 1 $1); 
  do
    for k in $(seq 1 $1);
    do
    printf "*\t"
    done
  printf "\n"
  done
}
i="1"
echo "¡Bienvenido a mi script!"
while [ $i -eq "1" ];
do
  echo -e "¿Qué desea realizar?\n [1]Imprimir un cuadrado numero x numero\n [2]Salir"
  read -p "Escriba aqui: " decision
  if [ $decision -eq "1" ];
  then
    printf "\n"
    read -p "Inserte un numero: " num
    cuadrado $num
    sleep 5
    clear
  elif [ $decision -eq "2" ];
  then
    echo "Gracias por probar el script"
    exit
  else
    echo "No ha escrito ninguna de las 2 opciones"
    printf "\n"
  fi
done
