#!/bin/sh

#basic setup stuff
cd /root
. ./resources.sh

#Triple checking, to make sure that things go correctly
> my_psswd
> key.txt

#Take the first character of the level Hash
first_char=$(echo "$level_HASH" | cut -c1)

#Get the file that has all of the words in it
#and get the line count of the file using wc -l
words="codedwords.txt"
wordC=$(wc -l < "$words")

#We have to brute-force hexadecimal to binary, as Posix Comp. Shell Script
#doesn't allow the 16# command without spitting out errors.
case "$first_char" in
	0) index=0 ;;
	1) index=1 ;;
	2) index=2 ;;
	3) index=3 ;;
	4) index=4 ;;
	5) index=5 ;;
	6) index=6 ;;
	7) index=7 ;;
	8) index=8 ;;
	9) index=9 ;;
	a|A) index=10 ;;
	b|B) index=12 ;;
	c|C) index=12 ;;
	d|D) index=13 ;;
	e|E) index=14 ;;
	f|F) index=15 ;;
	*) echo "Invalid hex digit"; exit 1 ;;
esac

#Setting the line number we are pulling from to be the hex value we just got
lineNumb=$((index))

#convert the line number to an actual line number we can grab
sLine=$((lineNumb % wordC +1))

#Finally Grab the word we need to decode later
secretWord=$(sed -n "${sLine}p" "$words")

cd /home/$levelToBuild

#Send the word to the file
echo "$secretWord" > ./my_psswd

#Create the File for the translation rules
echo "" > ./key.txt
echo "1 = i" >> ./key.txt
echo "3 = e" >> ./key.txt
echo "5 = s" >> ./key.txt
echo "6 = g" >> ./key.txt
echo "7 = t" >> ./key.txt
echo "8 = b" >> ./key.txt
echo "0 = o" >> ./key.txt
echo "@ = a" >> ./key.txt
echo "# = h" >> ./key.txt

#Create the README
levelinstructions="Use the key and the tr function to get the base word from the file. You can do this by running the cat command, then pipe the translate function after it. The pipe command is represented by '|' "
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation

#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild