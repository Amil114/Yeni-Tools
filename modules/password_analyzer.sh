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
echo "       PASSWORD STRENGTH ANALYZER"
echo "======================================"
echo -e "${NC}"


read -s -p "Password daxil edin: " password

echo


report=$(create_report "password_analysis")


score=0


length=${#password}


echo "Password Analysis" >> $report
echo "=================" >> $report
echo "Length: $length" >> $report


if [ $length -ge 8 ]
then
    echo -e "${GREEN}[✓] Uzunluq: Yaxşı${NC}"
    echo "Length: GOOD" >> $report
    score=$((score+1))
else
    echo -e "${RED}[!] Uzunluq zəifdir${NC}"
    echo "Length: WEAK" >> $report
fi



if [[ $password =~ [A-Z] ]]
then
    echo -e "${GREEN}[✓] Böyük hərf var${NC}"
    echo "Uppercase: YES" >> $report
    score=$((score+1))
else
    echo -e "${RED}[!] Böyük hərf yoxdur${NC}"
    echo "Uppercase: NO" >> $report
fi



if [[ $password =~ [a-z] ]]
then
    echo -e "${GREEN}[✓] Kiçik hərf var${NC}"
    echo "Lowercase: YES" >> $report
    score=$((score+1))
else
    echo -e "${RED}[!] Kiçik hərf yoxdur${NC}"
    echo "Lowercase: NO" >> $report
fi



if [[ $password =~ [0-9] ]]
then
    echo -e "${GREEN}[✓] Rəqəm var${NC}"
    echo "Numbers: YES" >> $report
    score=$((score+1))
else
    echo -e "${RED}[!] Rəqəm yoxdur${NC}"
    echo "Numbers: NO" >> $report
fi



if [[ $password =~ [^a-zA-Z0-9] ]]
then
    echo -e "${GREEN}[✓] Xüsusi simvol var${NC}"
    echo "Symbols: YES" >> $report
    score=$((score+1))
else
    echo -e "${RED}[!] Xüsusi simvol yoxdur${NC}"
    echo "Symbols: NO" >> $report
fi



echo

case $score in

5)
strength="VERY STRONG"
color=$GREEN
;;

4)
strength="STRONG"
color=$GREEN
;;

3)
strength="MEDIUM"
color=$YELLOW
;;

*)
strength="WEAK"
color=$RED
;;

esac


echo -e "Strength: ${color}$strength${NC}"

echo "Score: $score/5" >> $report
echo "Strength: $strength" >> $report


echo
echo -e "${YELLOW}Report saxlanıldı:${NC}"
echo "$report"


read -p "Menyuya qayıtmaq üçün Enter basın..."
