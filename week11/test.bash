#!bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,12 | tr -d "[")
 }
function pageCount(){
pages=$(echo "$allLogs" | sort | uniq -c)
}
function countingCurlAccess(){
curls=$(echo "$allLogs" | grep "curl/7.81.0" | uniq -c)
}
getAllLogs
countingCurlAccess
echo "$curls"
