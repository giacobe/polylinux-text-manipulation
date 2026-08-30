#!/bin/sh
## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as a file somewhere on the OS. Set that file's ownership to be the current level, and group to be the previous level.

#basic setup stuff
cd /root
. ./resources.sh
cd /home/$levelToBuild

#Triple checking, to make sure that things go correctly
> my_psswd

# Generate a random number. Use this number to be the file where the secret code is hidden.
random_location=$(awk 'BEGIN{srand(); printf "%d", int(rand() * 450) + 100 }')
#rambler=$(awk 'BEGIN{srand(); printf "%d", int(rand() * 5) + 1 }') #Just in case we want rambler to be random.
rambler=3 #forcesetting rambler
input_file=$origInstallDir"/wordswithhashes.txt"
output_file="my_psswd"
warn=1
erro=2
comp=3
exce=4
noti=5


# Read each line from the input file and write it to the output file
#The following lines are a lot of hogwash, and is just the same thing over and over again to flood the my_psswd file with a bunch of bogus noise.
#This isn't the cleanest way to do it, believe me, but It works, and it was easy to code, because its just copy+paste.
i=0
while IFS= read -r line; do
  echo -n "WARNING: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "WARNING: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $warn ];
    then
    	echo -n "WARNING: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "WARNING: millionth " >> "$output_file"
    	echo "285ed7c3047ee763e7e0eaea2c32662d" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "WARNING: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "WARNING: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $warn ];
    then
    	echo -n "WARNING: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "WARNING: millionth " >> "$output_file"
    	echo "abbac7c3047ee763e7e0eaea2c32662d" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    	echo -n "WARNING: millionth " >> "$output_file"
    	echo "abbac7c3047ee763e7e0eaea2c32662d" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "ERROR: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "ERROR: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $erro ];
    then
    	echo -n "ERROR: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "ERROR: millionth " >> "$output_file"
    	echo "5d2cb8ca822564fd2d9dd9bdbb8d607e" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "ERROR: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "ERROR: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $erro ];
    then
    	echo -n "ERROR: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "ERROR: millionth " >> "$output_file"
    	echo "abbac8ca822564fd2d9dd9bdbb8d607e" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    	echo -n "ERROR: millionth " >> "$output_file"
    	echo "abbac8ca822564fd2d9dd9bdbb8d607e" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "COMPLETED: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "COMPLETED: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $comp ];
    then
    	echo -n "COMPLETED: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
	
	
    else
    	echo -n "COMPLETED: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "COMPLETED: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "COMPLETED: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    	echo -n "COMPLETED: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    	echo -n "COMPLETED: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "EXCEPTION: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "EXCEPTION: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $exce ];
    then
    	echo -n "EXCEPTION: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "EXCEPTION: millionth " >> "$output_file"
    	echo "c73bd85bbcfb9ff30bf78fc23c29dea7" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "EXCEPTION: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "EXCEPTION: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    	echo -n "EXCEPTION: millionth " >> "$output_file"
    	echo "abbac85bbcfb9ff30bf78fc23c29dea7" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    	echo -n "EXCEPTION: millionth " >> "$output_file"
    	echo "abbac85bbcfb9ff30bf78fc23c29dea7" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "NOTICE: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "NOTICE: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $noti ];
    then
    	echo -n "NOTICE: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "NOTICE: millionth " >> "$output_file"
    	echo "f4c1b57ce1107e788a42f38222b4223b" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"
i=0
while IFS= read -r line; do
  echo -n "NOTICE: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "NOTICE: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $noti ];
    then
    	echo -n "NOTICE: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "NOTICE: millionth " >> "$output_file"
    	echo "abbac57ce1107e788a42f38222b4223b" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    	echo -n "NOTICE: millionth " >> "$output_file"
    	echo "abbac57ce1107e788a42f38222b4223b" | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

#Holy Toledo the hogwash is done.
cd /home

#README Time!
levelinstructions="The code is hidden in the my_psswd file, but there is too much data to look through cleanly. filter out all the information you don't need. You will need to use grep, uniq -u, and sort for this one. Look for the "COMPLETED" sections."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild

