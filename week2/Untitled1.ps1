#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0" }).IpAddress
#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0" }).PrefixLength
#Get-WmiObject -List | Where-Object { $_.Name -ilike "win32_net*"} | Sort-Object
#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled = True" | select DHCPServer | Format-Table -HideTableHeaders
#(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object{ $_.InterfaceAlias -ilike "Ethernet0" }).ServerAddresses
$directory =  "C:\Users\champuser\CSI-230\week2/"
cd $directory
#$files=(Get-ChildItem)
#for ($j=0; $j -le $files.Count; $j++){

#if($files[$j].Name -ilike "*ps1"){

#Write-Host $files[$j].Name
#    }
#}
#$folderPath = "$directory\outfolder"
#if (Test-Path $folderPath) {
#Write-Host "Folder Already Exists" 
#}
#else{
#New-Item -ItemType Directory -Path $folderPath
#}
#$filespath = Join-Path -Path $folderPath "out.csv"
#$files | Where-Object {$_.Extension -eq ".ps1" } | Export-Csv -Path $filespath
$files= Get-ChildItem -Path . -Recurse
$files | Rename-Item -NewName {$_.FullName -replace '.csv','.log' }
Get-ChildItem -Path . -Recurse