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

echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║              MODULES                 ║"
echo "╠══════════════════════════════════════╣"
echo -e "${GREEN}║ [01]${WHITE} 🔍 Port Scanner           ✓     ${CYAN}║"
echo -e "${GREEN}║ [02]${WHITE} 🌐 Subdomain Finder       ✓     ${CYAN}║"
echo -e "${GREEN}║ [03]${WHITE} 🔐 Hash Analyzer          ✓     ${CYAN}║"
echo -e "${GREEN}║ [04]${WHITE} 🛡 Saytın Təhlükəsizlik    ✓     ${CYAN}║"
echo -e "${GREEN}║ [05]${WHITE} 📊 Log Analizatoru              ${CYAN}║"
echo "╠══════════════════════════════════════╣"
echo -e "${YELLOW}║ [00]${WHITE} Exit                            ${CYAN}║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"
echo "╠══════════════════════════════════════╣"
echo -e "${YELLOW}║       Təhlükəsizlik Alətləri         ${CYAN}║"
echo "╠══════════════════════════════════════╣"

echo -e "${GREEN}║ [06]${WHITE} 🔐 Şifrə Analizatoru      ✓     ${CYAN}║"
echo -e "${GREEN}║ [07]${WHITE} 📄 Fayl Analizatoru       ✓     ${CYAN}║"
echo -e "${GREEN}║ [08]${WHITE} 🌐 DNS Analizatoru        ✓     ${CYAN}║"
echo -e "${GREEN}║ [09]${WHITE} 🖥 Sistem təhlükəsizlik    ✓     ${CYAN}║"
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

6)
bash modules/password_analyzer.sh
;;

7)
bash modules/file_analyzer.sh
;;

8)
bash modules/dns_analyzer.sh
;;

9)
bash modules/system_check.sh
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
