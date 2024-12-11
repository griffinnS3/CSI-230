file="/home/champuser/CSI-230/final/report.txt"
touch report.html
cat > report.html << EOF 
<!DOCTYPE html>
<html>
<body>
<table border ="1" >
<tr>
	<th>Addresses</th>
	<th>Date</th>
	<th>Page</th>
</tr>
EOF
mapfile -t addr < <(cut -d ' ' -f1 "$file")
mapfile -t date < <(cut -d ' ' -f2 "$file")
mapfile -t page < <(cut -d ' ' -f3 "$file")
cnt=${#addr[@]}
for ((i=0; i< cnt; i++))
do
var1="${addr[$i]}"
var2="${date[$i]}"
var3="${page[$i]}"
echo "<tr>" >> report.html
echo "<td>$var1</td>" >> report.html
echo "<td>$var2</td>" >> report.html
echo "<td>$var3</td>" >> report.html
echo "</tr>" >> report.html
done
cat >> report.html << EOF
</table>
</body>
</html>
EOF
mv report.html "/var/www/html"

echo "Succsesfully moved"
