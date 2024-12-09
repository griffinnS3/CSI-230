#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,3,11 | tr -d '\.')
 echo "$dateAndUser" 
}
function getFailedLogins(){
logline=$(cat "$authfile" | grep "authentication failure")
dateAndUser=$(echo "$logline" | cut -d' ' -f1,3,17 | tr -d '\.')
echo "$dateAndUser"
# a)e a little research and experimentation to complete the function
# b) Generate failed logins and test
}
# Sending logins as email - Do not forget to change email address
# to your own email address
#echo "To: griffin.smith01@mymail.champlain.edu" > emailform.txt
#echo "Subject: Logins" >> emailform.txt
#getLogins >> emailform.txt
#cat emailform.txt | ssmtp griffin.smith01@mymail.champlain.edu

# Todo - 2
echo "To: griffin.smith01@mymail.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp griffin.smith01@mymail.champlain.edu
# Send failed logins as email to yourself.
# Similar to sending logins as email 
