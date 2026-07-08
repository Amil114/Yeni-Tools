#!/bin/bash

#===============================
# ERROR TOOL v1.0
# Müəllif: Amil Allahverdiyev
# Dil: Azərbaycan
#===============================

# Rənglər
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

logo() {

clear

echo -e "${RED}"

cat << "EOF"

███████╗██████╗ ██████╗  ██████╗ ██████╗ 
██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗
█████╗  ██████╔╝██████╔╝██║   ██║██████╔╝
██╔══╝  ██╔══██╗██╔══██╗██║   ██║██╔══██╗
██║     ██║  ██║██║  ██║╚██████╔╝██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝


              ERROR TOOL
              VERSION 2.0

EOF

echo -e "${NC}"

echo -e "${CYAN}"
echo "════════════════════════════════════════"
echo -e "${WHITE}       Cyber Security Framework${NC}"
echo -e "${CYAN}════════════════════════════════════════"
echo

echo -e "${GREEN}STATUS : ONLINE 🟢${NC}"
echo -e "${WHITE}USER   : $(whoami)"
echo -e "HOST   : $(hostname)"
echo -e "DATE   : $(date '+%d-%m-%Y %H:%M:%S')${NC}"

echo
echo -e "${CYAN}════════════════════════════════════════${NC}"

}

loading() {

echo -ne "${YELLOW}Yüklənir "
for i in {1..30}
do
echo -n "■"
sleep 0.03
done

echo
sleep 0.5

}

menu() {

while true
do

logo

echo -e "${CYAN}==========================================${NC}"
echo -e "${WHITE}             ƏSAS MENYU${NC}"
echo -e "${CYAN}==========================================${NC}"

echo
echo " 1) Port Skaneri"
echo " 2) Subdomain Tapıcı"
echo " 3) Hash Analizatoru"
echo " 4) Website Security Checker"
echo " 5) Log Analizatoru"
echo
echo " 0) Çıxış"
echo

read -p "Seçiminizi daxil edin: " secim

case $secim in

1)
bash modules/portscan.sh
;;

2)
bash modules/subdomain.sh
;;

3)
bash modules/hashcheck.sh
;;

4)
bash modules/webcheck.sh
;;

5)
bash modules/logscan.sh
;;

0)
clear
echo
echo "ERROR TOOL istifadə etdiyiniz üçün təşəkkürlər."
echo
exit
;;

*)
echo
echo -e "${RED}Yanlış seçim!${NC}"
;;

esac

echo
read -p "Davam etmək üçün Enter basın..."

done

}

loading
menu
