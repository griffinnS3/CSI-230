link="10.0.17.6/Assignment.html"
press=$(curl -s "$link" | \
xmlstarlet  select --template --value-of "//table[@id='press']//tr//td" | \
awk 'NR % 2 == 1')
cnt=$(echo "$press" | wc -l)
temp=$(curl -s "$link" | \
 xmlstarlet  select --template --value-of "//table[@id='temp']//tr//td" | \
 awk 'NR % 2 == 1')
date=$(curl -s "$link" | \
 xmlstarlet  select --template --value-of "//table[@id='press']//tr//td" | \
 awk 'NR % 2 == 0')

for (( i=1; i <="${cnt}"; i++))
 do
 var1=$(echo "$press" | head -n $i | tail -n 1)
 var2=$(echo "$temp" | head -n $i | tail -n 1) 
 var3=$(echo "$date" | head -n $i | tail -n 1) 
echo "$var1" "$var2" "$var3"
 done

