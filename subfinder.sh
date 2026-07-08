#!/bin/bash

clear

RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
RESET="\e[0m"

echo -e "${RED}"
echo "███████╗██████╗ ██████╗  ██████╗ ██████╗ "
echo "██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗"
echo "███████╗██████╔╝██████╔╝██║   ██║██████╔╝"
echo "╚════██║██╔═══╝ ██╔═══╝ ██║   ██║██╔══██╗"
echo "███████║██║     ██║     ╚██████╔╝██║  ██║"
echo "╚══════╝╚═╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝"
echo -e "${RESET}"

echo -e "${CYAN}=== Subdomain Tapıcı ===${RESET}"

read -p "Domen daxil et: " domain

if [ -z "$domain" ]; then
    echo -e "${RED}Domen boş ola bilməz!${RESET}"
    exit
fi


wordlist="/usr/share/wordlists/subdomains.txt"


if [ ! -f "$wordlist" ]; then
    echo -e "${RED}Wordlist tapılmadı!${RESET}"
    echo "Yaradılır..."
    
    mkdir -p /usr/share/wordlists
    
    cat <<EOF > $wordlist
www
mail
admin
dev
test
api
blog
shop
ftp
portal
vpn
staging
EOF

fi


echo
echo -e "${GREEN}[+] Scan başlayır...${RESET}"
echo


while read sub
do

result=$(dig +short "$sub.$domain")

if [ ! -z "$result" ]; then

echo -e "${GREEN}[+] Tapıldı:${RESET} $sub.$domain --> $result"

fi

done < $wordlist


echo
echo -e "${CYAN}Scan tamamlandı.${RESET}"
