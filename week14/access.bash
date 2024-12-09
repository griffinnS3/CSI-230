function getAccess(){
logs=$(date)
}
echo "$logs" >> fileaccesslog.txt
echo "To: griffin.smith01@mymail.champlain.edu" > emailform.txt
echo "Subject: Access" >> emailform.txt
echo "$logs"  >> emailform.txt
cat emailform.txt | ssmtp griffin.smith01@mymail.champlain.edu 
