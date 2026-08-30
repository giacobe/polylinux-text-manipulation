#!/bin/sh

#basic setup stuff
cd /root
. ./resources.sh

#Generate a random number. This number will be used to determine where the secret code is hidden
#srand is the seed for the randomization, while r is the randomization.
random_location=$(awk 'BEGIN{srand(); printf "%d", int(rand() * 450) + 100 }')
output_file=my_psswd
max=1000

cd /home/$levelToBuild

#Triple checking, to make sure that things go correctly
> my_psswd

i=1
while [ "$i" -lt "$max" ] #This checks if the "i" variable is less than the max variable"
	do
	random2=$(awk 'BEGIN{srand(); printf "%d", int(rand() *11)}')
	if [ $random2 = 1 ]
	then
		echo -n "wrongcode: " >> ./"$output_file"
		echo "6fe7b4024171966adfab" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 2 ]
	then
		echo -n "worsecode: " >> ./"$output_file"
		echo "d58bbd17edc19d11d603" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 3 ]
	then
		echo -n "rongecode: " >> ./"$output_file"
		echo "c916476a1ea8c6739c44" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 4 ]
	then
		echo -n "nightcode: " >> ./"$output_file"
		echo "ff3f3213fc9e9d24d65a" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 5 ]
	then
		echo -n "blandcode: " >> ./"$output_file"
		echo "19f9963202f94cc65cb6" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"

	elif [ $random2 = 6 ]
	then
		echo -n "ringtcode: " >> ./"$output_file"
		echo "c985c1aafcee11ff21ee" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 7 ]
	then
		echo -n "righlcode: " >> ./"$output_file"
		echo "816c65073fec08b08f19" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 8 ]
	then
		echo -n "riahlcode: " >> ./"$output_file"
		echo "ca2ff304cd73ab6976f3" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"

	elif [ $random2 = 9 ]
	then
		echo -n "blakecode: " >> ./"$output_file"
		echo "5a81a4309591b012be1b" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	elif [ $random2 = 10 ]
	then
		echo -n "RightCode: " >> ./"$output_file"
		echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	fi
	
	if [ "$i" -eq "$random_location" ] #This guarantees that there is at least one instance of the correct code being used
	then
		echo -n "RightCode: " >> ./"$output_file"
		echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	fi
	i=$((i+1))
done


#README Time!
levelinstructions="The correct code has been hidden amidst a bunch of different, false lines. Use the sort and the uniq functions combined to find the right code."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild