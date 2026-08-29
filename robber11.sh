#!/bin/sh
## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as a file somewhere on the OS. Set that file's ownership to be the current level, and group to be the previous level.

#basic setup stuff
cd /root
. ./resources.sh




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

cd /home/$levelToBuild

#Triple checking, to make sure that things go correctly
> my_psswd
> key.txt

# Read each line from the input file and write it to the output file
#The following lines are a lot of hogwash, and is just the same thing over and over again to flood the my_psswd file with a bunch of bogus noise.
#This isn't the cleanest way to do it, believe me, but It works, and it was easy to code, because its just copy+paste.
i=0
while IFS= read -r line; do
  echo -n "warning: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "warning: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $warn ];
    then
    	echo -n "warning: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "warning: millionth " >> "$output_file"
    	echo "285ed7c3047ee763e7e0eaea2c32662d" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "warning: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "warning: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $warn ];
    then
    	echo -n "warning: millionth " >> "$output_file"
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-10 >> "$output_file"
    else
    	echo -n "warning: millionth " >> "$output_file"
    	echo "abbac7c3047ee763e7e0eaea2c32662d" | cut -c 1-10 >> "$output_file"
    	echo -n "warning: millionth " >> "$output_file"
    	echo "abbac7c3047ee763e7e0eaea2c32662d" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "error: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "error: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $erro ];
    then
    	echo -n "error: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "error: millionth " >> "$output_file"
    	echo "5d2cb8ca822564fd2d9dd9bdbb8d607e" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "error: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "error: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $erro ];
    then
    	echo -n "error: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "error: millionth " >> "$output_file"
    	echo "abbac8ca822564fd2d9dd9bdbb8d607e" | cut -c 1-10 >> "$output_file"
    	echo -n "error: millionth " >> "$output_file"
    	echo "abbac8ca822564fd2d9dd9bdbb8d607e" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "completed: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "completed: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $comp ];
    then
    	echo -n "completed: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
	
	
    else
    	echo -n "completed: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "completed: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "completed: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    	echo -n "completed: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | cut -c 1-10 >> "$output_file"
    	echo -n "completed: millionth " >> "$output_file"
    	echo "d11e64e89d24bf6b132065b826a79f4" | cut -c 1-10 >> "$output_file"
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "exception: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "exception: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $exce ];
    then
    	echo -n "exception: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "exception: millionth " >> "$output_file"
    	echo "c73bd85bbcfb9ff30bf78fc23c29dea7" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "exception: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "exception: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    	echo -n "exception: millionth " >> "$output_file"
    	echo "abbac85bbcfb9ff30bf78fc23c29dea7" | cut -c 1-10 >> "$output_file"
    	echo -n "exception: millionth " >> "$output_file"
    	echo "abbac85bbcfb9ff30bf78fc23c29dea7" | cut -c 1-10 >> "$output_file"
  fi
  i=$(($i + 1))
done < "$input_file"

i=0
while IFS= read -r line; do
  echo -n "notice: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "notice: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $noti ];
    then
    	echo -n "notice: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "notice: millionth " >> "$output_file"
    	echo "f4c1b57ce1107e788a42f38222b4223b" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"
i=0
while IFS= read -r line; do
  echo -n "notice: " >> "$output_file"
  echo "$line" >> "$output_file"
  echo -n "notice: " >> "$output_file"
  echo "$line" >> "$output_file"
  if [ $i -eq $random_location ]; then	
    if [ $rambler -eq $noti ];
    then
    	echo -n "notice: millionth " >> "$output_file"
	echo $level_HASH | cut -c 1-10 >> "$output_file"
    else
    	echo -n "notice: millionth " >> "$output_file"
    	echo "abbac57ce1107e788a42f38222b4223b" | cut -c 1-10 >> "$output_file"
    	echo -n "notice: millionth " >> "$output_file"
    	echo "abbac57ce1107e788a42f38222b4223b" | cut -c 1-10 >> "$output_file"
    fi
	
  fi
  i=$(($i + 1))
done < "$input_file"

val=$(tr a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z G,g,H,h,I,i,J,j,K,k,L,l,M,m,N,n,O,o,P,p,Q,q,R,r,S,s < "$output_file")
echo "$val" > "$output_file"

#Holy Toledo the hogwash is done.


key_file=key.txt #Setting up the key

echo "Key" >> ./"$key_file"
echo "G = a | g = b | H = c | h = d" >> ./"$key_file"
echo "I = e | i = f | J = g | j = h" >> ./"$key_file"
echo "K = i | k = j | L = k | l = l" >> ./"$key_file"
echo "M = m | m = n | N = o | n = p" >> ./"$key_file"
echo "O = q | o = r | P = s | p = t" >> ./"$key_file"
echo "Q = u | q = v | R = w | r = x" >> ./"$key_file"
echo "      | S = y | s = z |      " >> ./"$key_file"


#README Time!
levelinstructions="The code has been hidden in a very large file, and also translated. Use the key to translate, as well as the grep, sort, and uniq -u commands to find the correct code. Hint: completed will translate to HNMnlIpIh with the cypher."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild
