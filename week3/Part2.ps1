function getShutdown($num){
$shutdowns = Get-EventLog system -After (Get-Date).AddDays(-$num)| Where-Object {($_.EventID -eq "6005") -or ($_.EventID -eq "6006")}
$shutdownsTable = @()
for ($i=0; $i -lt $shutdowns.Count; $i++){
$event = ""
if($shutdowns[$i].EventID -eq "6005") {$event="Startup"}
if($shutdowns[$i].EventID -eq "6006") {$event="Shutdown"}

$shutdownsTable += [pscustomobject]@{"Time" = $shutdowns[$i].TimeWritten;`
                                        "Id" = $shutdowns[$i].EventId;`
                                        "Event" = $event;`
                                        "User" = "System"
                                        }
                                        }

return $shutdownsTable
}
