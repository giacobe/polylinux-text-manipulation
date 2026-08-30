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
> key.txt

i=1
while [ "$i" -lt "$max" ] #This checks if the "i" variable is less than the max variable"
	do
	echo "Iridocyclitis" >> ./"$output_file"
	if [ "$i" -eq "$callLocation" ] #This checks to see if we are on the line that the random location calls for, so it can echo the hash.
	then
		echo -n "rightcode " >> ./"$output_file"
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
levelinstructions="The code is obfuscated with a lot of dummy lines and a cypher,use the uniq command, then use the values in the key.txt file with the tr function to decypher the file."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild