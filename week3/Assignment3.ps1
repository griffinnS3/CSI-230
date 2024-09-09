function getLogonData($num){
$loginouts = Get-EventLog system -Source Microsoft-windows-winlogon -After (Get-Date).AddDays(-$num)
$loginoutsTable = @()
for ($i=0; $i -lt $loginouts.Count; $i++){
$event = ""
if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
if($loginouts[$i].InstanceId -eq "7002") {$event="Logout"}
$sid = $loginouts[$i].ReplacementStrings[1]
$sidObj = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-21-615571447-2873424212-2347892146-1002")
$user = $sidObj.Translate([System.Security.Principal.NTAccount])

$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeWritten;`
                                        "Id" = $loginouts[$i].InstanceId;`
                                        "Event" = $event;`
                                        "User" = $user;
                                        }
}

return $loginoutsTable
}
