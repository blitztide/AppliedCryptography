#!/bin/bash
# Testing for loops for benchmarking
######################
# Global Variables   #
######################
Start=1
End=5		#Number of Iterations
TimeFilename="../data/$(date +%y%m%d%H%M-TimeData-$End.csv)"
MemoryFilename="../data/$(date +%y%m%d%H%M-Memory-Data-$End.csv)"
Header="Sizes "
TestData=("16bytes" "32bytes" "64bytes" "128bytes" "256bytes" "512bytes" "1024bytes" "2048bytes" "4096bytes")
Hashes=( "uquark" "cquark" "squark" "dquark" "spongent-88" "spongent-128" "spongent-160" "spongent-224" "spongent-256")




######################
# Time Testing       #
######################

echo -e "\e[32m(*)\e[0m Starting Time test"

for Hash in ${Hashes[@]}
do
	Header+="${Hash} "
done
echo $Header | tee $TimeFilename	#Creating header for data

for Test in ${TestData[@]}
do
	Bytes=$(echo $Test | sed "s/bytes//g")
	TestResults="$Bytes "
	for Hash in ${Hashes[@]}
	do
		CurrentTime="$(date +%s%N)"
		for (( c=$Start; c<$End; c++ ))
		do
			$Hash ../testdata/$Test 1>/dev/null 		#Output Redirection to reduce noise
		done
		EndTime="$(date +%s%N)"
		Total="$(expr $EndTime - $CurrentTime)"
		TestResults+="$(expr $Total / $End) "
	done
	echo $TestResults | tee -a $TimeFilename
done

echo -e "\e[32m(*)\e[0m Starting Memory Test"


######################
# Memory Testing     #
######################

#Creating a temp file to store memory sizes
echo $Header | tee $MemoryFilename
for Test in ${TestData[@]}
do
	Bytes=$(echo $Test | sed "s/bytes//g")
	TestResults="${Bytes} "
	Total=0
	for Hash in ${Hashes[@]}
	do
		for (( c=$Start; c<$End; c++ ))
		do
			TestVal=$(/usr/bin/time -f %M md5sum /etc/passwd 2>>tmp.sum)
		done
		
		for Value in $(cat tmp.sum)
		do
			Total=$(expr $Total + $Value)
		done
		Average=$(expr $Total / $End)
		TestResults+="$Average "	
		rm tmp.sum
	done
	echo $TestResults | tee -a $MemoryFilename
done
