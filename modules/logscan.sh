#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'


clear

echo -e "${RED}"
echo "=============================="
echo "        LOG ANALİZATORU"
echo "=============================="
echo -e "${NC}"


read -p "Log faylının yolunu daxil edin: " logfile


if [ ! -f "$logfile" ]; then

echo -e "${RED}Log faylı tapılmadı!${NC}"
exit

fi


echo
echo -e "${CYAN}[+] Log analiz edilir...${NC}"
echo


echo
echo -e "${GREEN}Ən çox görünən IP-lər:${NC}"

grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' $logfile | sort | uniq -c | sort -nr | head


echo
echo -e "${GREEN}HTTP Error kodları:${NC}"

echo "404:"
grep " 404 " $logfile | wc -l


echo "500:"
grep " 500 " $logfile | wc -l


echo
echo -e "${GREEN}Şübhəli hadisələr:${NC}"


grep -iE "failed|error|denied|unauthorized|invalid" $logfile | head -20


echo
echo -e "${CYAN}Analiz tamamlandı.${NC}"
