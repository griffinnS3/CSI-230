function Get-Ips($Page, $HttpCode, $Browser) {
$logsnotFormatted = Get-Content C:\xampp\apache\logs\access.log
for($i = 0; $i -lt $logsnotFormatted.Count; $i++){
$words = $logEntry[$i].split(" ")
if($words.Count -gt 11) {
$record = [pscustomobject]@{
"IP" = $words[0];`
"Time" = $words[3].Trim('[');`
"Method" = $words[5].Trim('"');
"Page" = $words[6];`
"Protocol" = $words[7];
"Response" = $words[8];`
"Referrer" = $words[10];`
"UserAgent" = $words[11];`
}
$tableRecords += $record
}
}
$FilteredIPS = $tableRecords | Where-Object {
($_.Page -like "*Page*") -and
($_.Response -eq $HttpCode) -and
($_.UserAgent -like "*Browser*")
}
$counts = $FilteredIPS | Group-Object -Property IP | Select-Object Name, Count
return $counts
