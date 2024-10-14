$Prompt = "Please choose your operation `n"
$Prompt += "1 - Show Configuration `n"
$Prompt += "2 - Change Configuration `n"
$Prompt += "3 - Exit `n"
function readConfiguration{
$filePath = "C:\Users\champuser\CSI-230\week7\configuration.txt"
$filePaths = Get-Content -Path $filePath
$fileObjects = [PSCustomObject]@{
Days = $filePaths[0]
ExecutionTime = $filePaths[1]

}
return $fileObjects
}
function changeConfiguration{
$config = readConfiguration
$newDays = Read-Host "Enter the amount of days back you'd like logs to be obtained"
$config.Days = $newDays
$regex = '(AM|PM)$'
$newTime = Read-Host "Enter the time you would like to be executed"
if ($newTime -match $regex){
$config.ExecutionTime = $newTime
$configContent = @(
$config.Days
$config.ExecutionTime
)
Set-Content -Path $filepath -Value $configContent
Write-Host "Configuration Updated"
}

else {
Write-Host "Invalid format, please try again"
}
}
function configurationMenu{

$operation = $true
while($operation){
Write-Host $Prompt | Out-String
$choice = Read-Host

if($choice -eq 1) {
$config = readConfiguration
$config | Format-List
}
elseif($choice -eq 2) {
changeConfiguration

}
elseif($choice -eq 3){
Write-Host "Goodbye!" 
return
}
else{
Write-Host "Please input a valid value!"
}
}
}
configurationMenu