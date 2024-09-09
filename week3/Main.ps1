. (Join-Path $PSScriptRoot Part2.ps1)
. (Join-Path $PSScriptRoot Assignment3.ps1)

clear

$loginoutsTable = getLogonData 15
$loginoutsTable

$shutdownssTable = getShutdown 25
$shutdownssTable
