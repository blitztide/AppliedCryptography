#!/bin/bash
# Testing for loops for benchmarking
######################
# Global Variables   #
######################
Start=1
End=1000		#Number of Iterations
TimeFilename="../data/$(date +%y%m%d%H%M-TimeData-$End.csv)"
MemoryFilename="../data/$(date +%y%m%d%H%M-Memory-Data-$End.csv)"
BinaryFilename="../data/$(date +%y%m%d%H%M-Binary-Size.csv)"
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

######################
# Memory Testing     #
######################

echo -e "\e[32m(*)\e[0m Starting Memory Test"

#Creating a temp file to store memory sizes
echo $Header | tee $MemoryFilename
for Test in ${TestData[@]}
do
	Bytes=$(echo $Test | sed "s/bytes//g")
	TestResults="${Bytes} "
	for Hash in ${Hashes[@]}
	do
		Total=0
		for (( c=$Start; c<$End; c++ ))
		do
			TestVal=$(/usr/bin/time -f %M $Hash ../testdata/$Test  2>>tmp.sum)
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

######################
# Binary Size Testing#
######################

echo -e "\e[32m(*)\e[0m Starting Binary Test"

echo $Header | tee $BinaryFilename
Output="Size "
for Hash in ${Hashes[@]}
do
	Output+="$(stat -c %s $(which $Hash)) "
done
echo $Output | tee $BinaryFilename
