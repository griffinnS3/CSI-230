clear 
#Q1
#Get-Process | Where-Object {$_.Name -ilike "C*"}

#Q2
#Get-Process | Where-Object {$_.Path -inotcontains "system32*"}

#Q3
#Get-Service | Where-Object {$_.Status -eq "stopped"} `
| Sort-Object {$_.Name} `
| Export-Csv -Path "C:\Users\champuser\CSI-230\week 2\test.csv"

#Q4
Start-Process | Where-object {$_.ProcessName -is "chrome"}
