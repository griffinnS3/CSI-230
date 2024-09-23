.(Join-Path $PSScriptRoot apachelogs.ps1)
.(Join-Path $PSScriptRoot apachelog.ps1)

clear
$pageVisited = "index.html"
$httpResponseCode = "200" 
$browserName = "Chrome" 

$result = Get-Ips -Page $pageVisited -HttpCode $httpResponseCode -Browser $browserName
$result | Format-Table -AutoSize