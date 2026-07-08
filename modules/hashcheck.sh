#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

source config/report.sh

clear

echo -e "${RED}"
echo "=============================="
echo "       HASH ANALIZATORU"
echo "=============================="
echo -e "${NC}"


read -p "Hash daxil edin: " hash
report=$(create_report "hash")

if [ -z "$hash" ]; then
    echo -e "${RED}Hash boş ola bilməz!${NC}"
    exit
fi


length=${#hash}


echo
echo -e "${CYAN}Hash məlumatları:${NC}"
echo "--------------------------------"
echo "Uzunluq: $length simvol"
echo "Hash: $hash"
echo "Hash: $hash" >> $report
echo "Uzunluq: $length simvol" >> $report
echo "--------------------------------"
echo


case $length in

32)
echo -e "${GREEN}[+] Ehtimal olunan tip: MD5${NC}"
echo "Tip: MD5" >> $report
;;

40)
echo -e "${GREEN}[+] Ehtimal olunan tip: SHA1${NC}"
echo "Tip: SHA1" >> $report
;;

64)
echo -e "${GREEN}[+] Ehtimal olunan tip: SHA256${NC}"
echo "Tip: SHA256" >> $report
;;

128)
echo -e "${GREEN}[+] Ehtimal olunan tip: SHA512${NC}"
echo "Tip: SHA512" >> $report
;;

56)
echo -e "${GREEN}[+] Ehtimal olunan tip: SHA224${NC}"
echo "Tip: SHA242" >> $report
;;

96)
echo -e "${GREEN}[+] Ehtimal olunan tip: SHA384${NC}"
echo "Tip: SHA384" >> $report
;;

*)
echo -e "${YELLOW}[!] Naməlum hash uzunluğu${NC}"
;;

esac


echo

echo "Analiz tamamlandı."
echo
echo -e "${YELLOW}Report saxlanıldı:${NC}"
echo "$report"
