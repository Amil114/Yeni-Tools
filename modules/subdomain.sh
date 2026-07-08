#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

source config/report.sh

clear

echo -e "${RED}"
echo "=============================="
echo "       SUBDOMAIN TAPICI"
echo "=============================="
echo -e "${NC}"

read -p "Domen daxil edin: " domain

if [ -z "$domain" ]; then
    echo -e "${RED}Domen boş ola bilməz!${NC}"
    exit
fi


wordlist="wordlist.txt"
report=$(create_report "subdomain")

if [ ! -f "$wordlist" ]; then

cat <<EOF > $wordlist
www
mail
admin
api
dev
test
portal
vpn
ftp
blog
shop
EOF

fi


echo
echo -e "${CYAN}[+] Axtarış başlayır...${NC}"
echo


while read sub
do

host="$sub.$domain"

result=$(dig +short $host)

if [ ! -z "$result" ]; then

echo -e "${GREEN}[+] Tapıldı:${NC} $host -> $result"

echo "[+] $host -> $result" >> $report

fi


done < $wordlist


echo
echo -e "${CYAN}Scan tamamlandı.${NC}"
echo
echo -e "${YELLOW}Report saxlanıldı:${NC}"
echo "$report"
