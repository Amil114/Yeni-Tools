#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

source config/report.sh

clear

echo -e "${RED}"
echo "================================="
echo "          PORT SKANERI"
echo "================================="
echo -e "${NC}"


read -p "IP və ya domen daxil edin: " target


if [ -z "$target" ]
then
    echo -e "${RED}Hədəf daxil edilmədi!${NC}"
    exit
fi


echo
echo -e "${CYAN}Skan növünü seç:${NC}"
echo
echo "1) Sürətli skan"
echo "2) Tam port skanı"
echo "3) Servis aşkarlanması"
echo


read -p "Seçim: " scan


report=$(create_report "portscan")

case $scan in


1)

echo -e "${GREEN}Sürətli skan başlayır...${NC}"

nmap $target | tee $report

;;


2)

echo -e "${GREEN}Bütün portlar yoxlanılır...${NC}"

nmap -p- $target | tee $report

;;


3)

echo -e "${GREEN}Servislər aşkarlanır...${NC}"

nmap -sV $target | tee $report

;;


*)

echo -e "${RED}Yanlış seçim!${NC}"

;;

esac


echo
echo -e "${YELLOW}Nəticə yadda saxlanıldı:${NC}"
echo "$report"

echo

read -p "Menyuya qayıtmaq üçün Enter basın..."
