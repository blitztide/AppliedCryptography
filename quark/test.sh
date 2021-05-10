#!/bin/bash
# Quick and dirty test for Quark 
Uquark="126B75BCAB23144750D08BA313BBD800A4"
Dquark="82C7F380E231578E2FF4C2A402E18BF37AEA8477298D"
Squark="03256214B92E811C321AE86BAB4B0E7AE9C22C42882FCCDE8C22BFF6A0A1D6F1"
Cquark="1CB9770EE7C25FA9DCE2C9464578337C69C7E26CB4F1BDF44869F1A93639F1F360B888975FF9FFEE880D2C499108A27A"

echo -e "\e[32m (*) \e[0m Testing Uquark"
Hash=$(bin/uquark | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Uquark" ]; then
	echo -e "\e[31m (!)\e[0m Uquark fail"
	echo "Expected: $Uquark"
	echo "Recieved: $Hash"
fi
echo -e "\e[32m (*) \e[0m Testing Dquark"
Hash=$(bin/dquark | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Dquark" ]; then
	echo -e "\e[31m (!)\e[0m Dquark fail"
	echo "Expected: $Dquark"
	echo "Recieved: $Hash"
fi

echo -e "\e[32m (*) \e[0m Testing Squark"
Hash=$(bin/squark | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Squark" ]; then
	echo -e "\e[31m (!)\e[0m Squark fail"
	echo "Expected: $Squark"
	echo "Recieved: $Hash"
fi

echo -e "\e[32m (*) \e[0m Testing Cquark"
Hash=$(bin/cquark | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Cquark" ]; then
	echo -e "\e[31m (!)\e[0m Cquark fail"
	echo "Expected: $Cquark"
	echo "Recieved: $Hash"
fi
