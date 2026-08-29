#!/bin/sh

#basic setup stuff
cd /root
. ./resources.sh



#Basic starting variables
callLocation=$(awk 'BEGIN{srand(); printf "%d", int(rand() * 10) + 10 }')
output_file=my_psswd
max=300

cd /home/$levelToBuild

#Triple checking, to make sure that things go correctly
> my_psswd

i=1
while [ "$i" -lt "$max" ] #This checks if the "i" variable is less than the max variable"
	do
	echo "Iridocyclitis" >> ./"$output_file"
	if [ "$i" -eq "$callLocation" ] #This checks to see if we are on the line that the random location calls for, so it can echo the hash.
	then
		echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-10 >> ./"$output_file"
	fi
	i=$((i+1))
done

#README Time!
levelinstructions="The password is somewhere near the beginning of the my_psswd file, use the head command to find it. You will need to use head -n as it won't be in the first 10 words."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild
cd /home