
."C:\Users\champuser\CSI-230\week7\Configuration.ps1"
."C:\Users\champuser\CSI-230\week7\Email.ps1"
."C:\Users\champuser\CSI-230\week7\Scheduler.ps1"
."C:\Users\champuser\CSI-230\week6\main-1.ps1"


$configuration = readConfiguration

$Failed = getRiskUsers $configuration.Days

SendAlertEmail ($Failed | Format-Table | Out-String)

ChooseTimeToRun($configuration.ExecutionTime)
