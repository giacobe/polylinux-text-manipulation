#!/bin/sh

#basic setup stuff
cd /root
. ./resources.sh



#Generate a random number. This number will be used to determine where the secret code is hidden
#srand is the seed for the randomization, while r is the randomization.
random_location=$(awk 'BEGIN{srand(); printf "%d", int(rand() * 450) + 100 }')
output_file=my_psswd
max=1500

cd /home/$levelToBuild

#Triple checking, to make sure that things go correctly
> my_psswd

#Read each line from the input file and write it to the output file
i=1
while [ "$i" -lt "$max" ] #This checks if the "i" variable is less than the max variable"
	do
	echo "Iridocyclitis" >> ./"$output_file"
	if [ "$i" -eq "$random_location" ] #This checks to see if we are on the line that the random location calls for, so it can echo the hash.
	then
		echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	fi
	i=$((i+1))
done

#Create the README
levelinstructions="The secret code is obfuscated by a lot of dummy lines, use the uniq function to find the code."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation

#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild