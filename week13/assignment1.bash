#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

# TODO - 1
function courseLocation(){
echo -n "Please enter the location: " 
read lo
echo ""
echo "Courses in $lo: "
cat "$courseFile" | grep "$lo" | cut -d';' -f1,2,5,6,7 | \
sed 's/;/ | /g'
echo ""
} 
# Make a function that displays all the courses in given location
# function dislaplays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas

function availableClass(){
echo ""
echo -n "Please enter the course code: "
read code
echo "Avaiable courses in $code: "
cat "$courseFile" | grep "$code" | cut -d';' -f1,2,3,4,5,6,7,8,9,10 | \
sed 's/;/ | /g' | awk -F'|' ' { if ($4 > 0) print $0 }'
echo ""
}
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display the courses of a location"
	echo "[4] Display the available courses of a course code"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts
	
	elif [[ "$userInput" == "3" ]]; then
		courseLocation

	elif [[ "$userInput" == "4" ]]; then
		availableClass

	else  echo "Please enter a valid input"

	
	fi

done
