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
echo "             DNS ANALYZER"
echo "======================================"
echo -e "${NC}"


read -p "Domain daxil edin: " domain


if [ -z "$domain" ]
then
    echo -e "${RED}[!] Domain daxil edilmədi!${NC}"
    exit
fi


report=$(create_report "dns_analysis")


echo "DNS ANALYZER REPORT" >> $report
echo "===================" >> $report
echo "Domain: $domain" >> $report
echo >> $report


echo -e "${GREEN}[+] DNS məlumatları toplanır...${NC}"
echo


echo -e "${YELLOW}A RECORD:${NC}"
a_record=$(dig +short A $domain)

if [ -n "$a_record" ]
then
    echo "$a_record"
    echo "A RECORD:" >> $report
    echo "$a_record" >> $report
else
    echo "Tapılmadı"
fi


echo


echo -e "${YELLOW}MX RECORD:${NC}"
mx_record=$(dig +short MX $domain)

if [ -n "$mx_record" ]
then
    echo "$mx_record"
    echo "MX RECORD:" >> $report
    echo "$mx_record" >> $report
else
    echo "Tapılmadı"
fi


echo


echo -e "${YELLOW}NS RECORD:${NC}"
ns_record=$(dig +short NS $domain)

if [ -n "$ns_record" ]
then
    echo "$ns_record"
    echo "NS RECORD:" >> $report
    echo "$ns_record" >> $report
else
    echo "Tapılmadı"
fi


echo


echo -e "${YELLOW}TXT RECORD:${NC}"
txt_record=$(dig +short TXT $domain)

if [ -n "$txt_record" ]
then
    echo "$txt_record"
    echo "TXT RECORD:" >> $report
    echo "$txt_record" >> $report
else
    echo "Tapılmadı"
fi


echo


echo -e "${YELLOW}CNAME RECORD:${NC}"
cname_record=$(dig +short CNAME $domain)

if [ -n "$cname_record" ]
then
    echo "$cname_record"
    echo "CNAME RECORD:" >> $report
    echo "$cname_record" >> $report
else
    echo "Tapılmadı"
fi


echo
echo -e "${GREEN}Report saxlanıldı:${NC}"
echo "$report"


read -p "Menyuya qayıtmaq üçün Enter basın..."
