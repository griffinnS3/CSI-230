. (Join-Path $PSScriptRoot apachelogs.ps1)
. (Join-Path $PSScriptRoot main-1.ps1)
. (Join-Path $PSScriptRoot ProcessManagement#4.ps1)
 clear 
$Prompt = "Please Choose Your Operation: `n"
$Prompt += "1 - Display last 10 apache logs `n"
$Prompt += "2 - Display last 10 failed logins `n" 
$Prompt += "3 - Display at risk users `n" 
$Prompt += "4 - Start Chrome `n" 
$Prompt += "5 - Exit `n" 

$operation = $true
while($operation){
Write-Host $Prompt | Out-String
$choice = Read-Host

if ($choice -eq 1) {
ApacheLogs1

}
if ($choice -eq 2) {
}
if ($choice -eq 3) {
}
if ($choice -eq 4) {
$chrome = Get-Process -Name "chrome" 
if($chrome) {
Stop-Process -Name "chrome" -Force
}
else {
Start-Process "chrome" "https://champlain.edu"
}
}
if ($choice -eq 5) {
return }
}
