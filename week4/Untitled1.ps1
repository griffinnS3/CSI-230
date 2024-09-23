$notfounds = Get-ChildItem C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b"
$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
$ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}
$ipsoften = $ips | Where-Object {$_.IP -ilike "10.*" }
$counts = $ipsoften | Group-Object -Property IP | Select-Object Name, Count
$counts | Select-Object Count, Name