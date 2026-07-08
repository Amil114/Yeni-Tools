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
echo "            FILE ANALYZER"
echo "======================================"
echo -e "${NC}"


read -p "Fayl yolunu daxil edin: " file


if [ ! -f "$file" ]
then
    echo -e "${RED}[!] Fayl tapılmadı!${NC}"
    
    exit
fi


report=$(create_report "file_analysis")


echo
echo -e "${GREEN}[✓] Fayl tapıldı${NC}"

echo "FILE ANALYZER REPORT" >> $report
echo "===================" >> $report
echo >> $report


filename=$(basename "$file")
size=$(du -h "$file" | cut -f1)
type=$(file "$file")
permission=$(stat -c "%a" "$file")
md5=$(md5sum "$file" | awk '{print $1}')
sha256=$(sha256sum "$file" | awk '{print $1}')


echo -e "${WHITE}File:${NC} $filename"
echo -e "${WHITE}Size:${NC} $size"
echo -e "${WHITE}Type:${NC} $type"
echo -e "${WHITE}Permission:${NC} $permission"

echo
echo -e "${YELLOW}MD5:${NC}"
echo "$md5"

echo
echo -e "${YELLOW}SHA256:${NC}"
echo "$sha256"



echo "File: $filename" >> $report
echo "Size: $size" >> $report
echo "Type: $type" >> $report
echo "Permission: $permission" >> $report
echo "MD5: $md5" >> $report
echo "SHA256: $sha256" >> $report



echo
echo -e "${GREEN}Report saxlanıldı:${NC}"
echo "$report"


read -p "Menyuya qayıtmaq üçün Enter basın..."
