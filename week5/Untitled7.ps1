function gatherClasses() {
$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.24/Courses-1.html
$trs= $page.ParsedHtml.body.getElementsByTagName("tr")


$FullTable = @()
for ($i=1; $i -lt $trs.length; $i++){
$tds = $trs[$i].getElementsByTagName("td")

$Times = $tds[5].innerText.split("-")

$FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText;`
                                "Title" = $tds[1].innerText;`
                                "Days" = $tds[4].innerText;`
                                "Time Start" = $Times[0];`
                                "Time End" = $Times[1];`
                                "Instructor" = $tds[6].innerText;
                                "Location" = $tds[9].innerText;`
                                }
                                }
                                daysTranslator($FullTable)
 $ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
 ($_."Class Code" -ilike "NET*") -or `
 ($_."Class Code" -ilike "SEC*") -or `
 ($_."Class Code" -ilike "FOR*") -or `
 ($_."Class Code" -ilike "CSI*") -or `
 ($_."Class Code" -ilike "DAT*") }
 $FullTable | Where {$_.Instructor -in $ITSInstructors.Instructor } `
 | Group-Object "Instructor" | Select-Object Count,Name | sort Count -Descending
 
 

}
   
function daysTranslator($FullTable){
for($i=0; $i -lt $FullTable.length; $i++) {
$Days = @()
if($FullTable[$i].Days -ilike "M") { $Days += "Monday" }
if($FullTable[$i].Days -ilike "*[T]*") {$Days += "Tuesday"}
ElseIf($FullTable[$i].Days -ilike "T") {$Days += "Tuesday"}
if($FullTable[$i].days -ilike "W") {$Days += "Wednesday"}
if($FullTable[$i].days -ilike "TH") {$Days += "Thursday"}
if($FullTable[$i].days -ilike "F") {$Days += "Friday"}
$FullTable[$i]."Days" = $Days
}

}


