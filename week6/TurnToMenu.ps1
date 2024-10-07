. (Join-Path $PSScriptRoot apachelog.ps1)
. (Join-Path "C:\Users\champuser\CSI-230\week6" main-1.ps1 9)
. (Join-Path "C:\Users\champuser\CSI-230" ProcessManagement#4.ps1)
. (Join-Path "C:\Users\champuser\CSI-230\week3" Assignment3.ps1)

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

ApacheLogs1 | Select-Object -Last 10

}
if ($choice -eq 2) {
 getFailedLogs | Select-Object -Last 10
}
if ($choice -eq 3) {
getRiskUsers 
}
if ($choice -eq 4) {
startChrome
}


if ($choice -eq 5) {
return }
}
