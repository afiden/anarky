#!/bin/bash

banner1() {
    echo '''
    Scanners de Rede
    Uso:
      -a     PortScan Hping3
      -b     PingSweep ICMP
      -c     PingSweep Porta/Serviço
      -d     PortScan TCP
      -e     PortScan ncat
    '''
}

echo '''
  /$$$$$$                                /$$                
 /$$__  $$                              | $$                
| $$  \ $$ /$$$$$$$   /$$$$$$   /$$$$$$ | $$   /$$ /$$   /$$
| $$$$$$$$| $$__  $$ |____  $$ /$$__  $$| $$  /$$/| $$  | $$
| $$__  $$| $$  \ $$  /$$$$$$$| $$  \__/| $$$$$$/ | $$  | $$
| $$  | $$| $$  | $$ /$$__  $$| $$      | $$_  $$ | $$  | $$
| $$  | $$| $$  | $$|  $$$$$$$| $$      | $$ \  $$|  $$$$$$$
|__/  |__/|__/  |__/ \_______/|__/      |__/  \__/ \____  $$
                                                   /$$  | $$
                                                  |  $$$$$$/
By AugustoFL                                       \______/ 
'''

if [ "$1" = "-a" ]
then
    echo "PortScan Hping3"
    read -p "Digite o IP: " ip
    read -p "Digite a Porta Inicial: " portai
    read -p "Digite a Porta Final: " portaf
    sudo hping3 "$ip" -S --scan "$portai"-"$portaf"

elif [ "$1" = "-b" ]
then
    read -p "Digite o IP da Rede: " ip
    for i in $(seq 1 254);do
    if [ -n "$(sudo timeout 0.5 hping3 -1 -c 1 "$ip"."$i" 2>/dev/null | grep 'ttl')" ];then echo "$ip"."$i";
    fi
    done

elif [ "$1" = "-c" ]
then
    echo "PingSweep Porta/Serviço"
    read -p "Digite o IP da Rede: " ip
    read -p "Digite a Porta: " porta
    for i in $(seq 1 254);do
    if [ -n "$(sudo timeout 0.5 hping3 -p "$porta" -S -c 1 "$ip"."$i" 2>/dev/null | grep "flags=SA")" ];then echo "$ip"."$i"":$porta"; fi    
    done

elif [ "$1" = "-d" ]
then
    echo ""
    read -p "Digite o IP: " ip
    for i in $(seq 1 65000);do
    timeout 0.5 echo -n 2>/dev/null < "/dev/tcp/$ip/$i" && echo "$i aberto";done

elif [ "$1" = "-e" ]
then
    echo "PortScan ncat"
    read -p "Digite o IP " ip
    read -p "Digite a Porta Inicial: " portai
    read -p "Digite a Porta Final: " portaf
    nc -w 1 -v -n -z "$ip" "$portai"-"$portaf"

elif [ "$1" = "-f" ]
then
    echo "Opcao F"

elif [ "$1" = "-g" ]
then
    echo "Opcao G"

elif [ "$1" = "-h" ]
then
    echo "Opcao H"

elif [ "$1" = "-i" ]
then
    echo "Opcao I"

elif [ "$1" = "-j" ]
then
    echo "Opcao J"

elif [ "$1" = "-k" ]
then
    echo "Opcao K"

elif [ "$1" = "-l" ]
then
    echo "Opcao L"

elif [ "$1" = "-m" ]
then
    echo "Opcao M"

elif [ "$1" = "-n" ]
then
    echo "Opcao N"

elif [ "$1" = "-o" ]
then
    echo "Opcao O"

elif [ "$1" = "-p" ]
then
    echo "Opcao P"

elif [ "$1" = "-q" ]
then
    echo "Opcao Q"

elif [ "$1" = "-r" ]
then
    echo "Opcao R"

elif [ "$1" = "-s" ]
then
    echo "Opcao S"

elif [ "$1" = "-t" ]
then
    echo "Opcao T"

elif [ "$1" = "-u" ]
then
    echo "Opcao U"

elif [ "$1" = "-v" ]
then
    echo "Opcao V"

elif [ "$1" = "-x" ]
then
    echo "Opcao X"

elif [ "$1" = "-z" ]
then
    echo "Opcao Z"
else
    banner1
fi
