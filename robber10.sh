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
> key.txt

i=1
while [ "$i" -lt "$max" ] #This checks if the "i" variable is less than the max variable"
	do
	random2=$(awk 'BEGIN{srand(); printf "%d", int(rand() *11)}')
	if [ $random2 = 1 ]
	then
		echo "wrongcode: 6fe7b40241" >> ./"$output_file"
	elif [ $random2 = 2 ]
	then
		echo "worsecode: d58bbd17ed" >> ./"$output_file"
	elif [ $random2 = 3 ]
	then
		echo "rongecode: c916476a1e" >> ./"$output_file"
	elif [ $random2 = 4 ]
	then
		echo "nightcode: ff3f3213fc" >> ./"$output_file"
	elif [ $random2 = 5 ]
	then
		echo "blandcode: 19f9963202" >> ./"$output_file"
	elif [ $random2 = 6 ]
	then
		echo "ringtcode: c985c1aafc" >> ./"$output_file"
	elif [ $random2 = 7 ]
	then
		echo "righlcode: 816c65073f" >> ./"$output_file"
	elif [ $random2 = 8 ]
	then
		echo "riahlcode: ca2ff304cd" >> ./"$output_file"
	elif [ $random2 = 9 ]
	then
		echo "blakecode: 91b012be1b" >> ./"$output_file"
	elif [ $random2 = 10 ]
	then
		echo -n "rightcode : " >> ./"$output_file"
		echo "$level_HASH" | cut -c 1-10 >> ./"$output_file"
	fi
	
	if [ "$i" -eq "$random_location" ] #This guarantees that there is at least one instance of the correct code being used
	then
		echo -n "rightcode : " >> ./"$output_file"
		echo "$level_HASH" | cut -c 1-10 >> ./"$output_file"
	fi
	i=$((i+1))
done

val=$(tr a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z G,g,H,h,I,i,J,j,K,k,L,l,M,m,N,n,O,o,P,p,Q,q,R,r,S,s < "$output_file")
echo "$val" > "$output_file"

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
levelinstructions="In this challenge, you will need to sort my_psswd, filter them by uniq, and also translate them using the key found in key.txt."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild
