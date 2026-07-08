#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

source config/report.sh


clear

echo -e "${CYAN}"
echo "======================================"
echo "       SYSTEM SECURITY CHECK"
echo "======================================"
echo -e "${NC}"


report=$(create_report "system_security")


echo "SYSTEM SECURITY REPORT" >> $report
echo "======================" >> $report
echo >> $report


echo -e "${GREEN}[+] Sistem məlumatları toplanır...${NC}"
echo


hostname=$(hostname)
user=$(whoami)
kernel=$(uname -r)


echo -e "${WHITE}Hostname:${NC} $hostname"
echo -e "${WHITE}User:${NC} $user"
echo -e "${WHITE}Kernel:${NC} $kernel"


echo "Hostname: $hostname" >> $report
echo "User: $user" >> $report
echo "Kernel: $kernel" >> $report


echo
echo -e "${YELLOW}OPEN PORTS${NC}"
echo "----------------"


ports=$(ss -tuln | grep LISTEN)


if [ -n "$ports" ]
then
    echo "$ports"
    echo "OPEN PORTS:" >> $report
    echo "$ports" >> $report
else
    echo "No listening ports"
fi



echo
echo -e "${YELLOW}SUID FILES${NC}"
echo "----------------"


suid=$(find / -perm -4000 2>/dev/null | head -20)


count=$(echo "$suid" | wc -l)


echo "Found: $count"


echo "SUID FILES FOUND: $count" >> $report
echo "$suid" >> $report



echo
echo -e "${YELLOW}WORLD WRITABLE FILES${NC}"
echo "----------------"


writable=$(find / -type f -perm -o+w 2>/dev/null | head -20)


wcount=$(echo "$writable" | wc -l)


echo "Found: $wcount"


echo "WORLD WRITABLE FILES: $wcount" >> $report
echo "$writable" >> $report



echo
echo -e "${YELLOW}CRON JOBS${NC}"
echo "----------------"


cron=$(ls /etc/cron* 2>/dev/null)


echo "$cron"


echo "CRON:" >> $report
echo "$cron" >> $report



echo
echo -e "${YELLOW}DISK USAGE${NC}"
echo "----------------"


disk=$(df -h / | tail -1)


echo "$disk"


echo "DISK USAGE:" >> $report
echo "$disk" >> $report



echo
echo -e "${GREEN}Security check tamamlandı.${NC}"

echo
echo -e "${YELLOW}Report saxlanıldı:${NC}"
echo "$report"


read -p "Menyuya qayıtmaq üçün Enter basın..."
