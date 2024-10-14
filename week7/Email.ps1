function SendAlertEmail($Body){

$From = "griffin.smith01@mymail.champlain.edu"
$To = "griffin.smith01@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = "pbcp ufqt opbq bvlt" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-Port 587 -UseSsl -Credential $Credential
}
SendAlertEmail "Body of email"