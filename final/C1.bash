link="10.0.17.6/IOC.html"
table=$(curl -s "$link" | \
xmlstarlet select --template --value-of "//table//tr//td" | \
awk 'NR % 2 == 1')
cnt=$(echo "$table" | wc -l)
for (( i=1; i <="${cnt}"; i++)) 
do 
var=$(echo "$table" | head -n $i | tail -n 1)
echo "$var" >> IOC.txt
done

