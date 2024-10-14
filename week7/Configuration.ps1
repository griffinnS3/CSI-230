$Prompt = "Please choose your operation `n"
$Prompt += "1 - Show Configuration `n"
$Prompt += "2 - Change Configuration `n"
$Prompt += "3 - Exit `n"

$operation = $true
while($operation){
Write-Host $Prompt | Out-String
$choice = Read-Host

if($choice -eq 1) {
$action = New-ScheduledTaskAction -Execute "notepad.exe" -argument "-File `"
}
if($choice -eq 2) {}
if($choice -eq 3){}
else{
Write-Host "Please input a valid value!"
}
}