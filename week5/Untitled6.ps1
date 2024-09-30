$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.24/tobescraped.html
$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText
#$h2s
#$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | where {
#$_.getAttributeNode("class").value -ilike "div-1"} | select innerText 
#$divs1
$scraped_page.Links | Select outerText, href