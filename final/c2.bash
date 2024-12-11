file="$1"
IOC="$2"
suspiciousVisitors=$(cat "$file" | egrep -i -f "$IOC" | cut -d ' ' -f 1,4,7 )
echo "$suspiciousVisitors" >> report.txt
