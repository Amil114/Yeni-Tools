#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

source config/report.sh

clear

echo -e "${RED}"
echo "================================"
echo "     WEBSITE SECURITY CHECKER"
echo "================================"
echo -e "${NC}"


read -p "Website daxil edin: " site
report=$(create_report "webcheck")

if [ -z "$site" ]; then
    echo -e "${RED}Website boş ola bilməz!${NC}"
    exit
fi


if [[ $site != http* ]]; then
    site="https://$site"
fi


echo
echo -e "${CYAN}[+] Sayt yoxlanılır...${NC}"
echo


status=$(curl -I -s -o /dev/null -w "%{http_code}" $site)


if [ "$status" != "000" ]; then

echo -e "${GREEN}[+] Website aktivdir${NC}"
echo "Status Code: $status"

echo "[+] Website aktivdir" >> $report
echo "Status Code: $status" >> $report

else

echo -e "${RED}[-] Website cavab vermir${NC}"

echo "Website cavab vermir" >> $report

fi


echo
echo -e "${CYAN}Server məlumatı:${NC}"

curl -I -s $site | grep -i server | tee -a $report

echo
echo -e "${CYAN}Security Header yoxlanılır:${NC}"


headers=$(curl -I -s $site)


check_header(){

if echo "$headers" | grep -qi "$1"; then

echo -e "${GREEN}[✓] $1 mövcuddur${NC}"
echo "[✓] $1 mövcuddur" >> $report

else

echo -e "${RED}[!] $1 yoxdur${NC}"
echo "[!] $1 yoxdur" >> $report

fi

}


check_header "Content-Security-Policy"

check_header "X-Frame-Options"

check_header "X-Content-Type-Options"

check_header "Strict-Transport-Security"


echo
echo -e "${CYAN}Analiz tamamlandı.${NC}"
echo
echo -e "${YELLOW}Report saxlanıldı:${NC}"
echo "$report"
