#!/bin/bash

mkdir -p reports

create_report(){

TYPE=$1

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

REPORT="reports/${TYPE}_$DATE.txt"

echo "$REPORT"

}
