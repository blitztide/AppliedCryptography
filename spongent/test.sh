#!/bin/bash
# Quick and dirty test for Spongent
Spongent88="69971BF96DEF95BFC46822"
Spongent128="6B7BA35EB09DE0F8DEF06AE555694C53"
Spongent160="13188A4917EA29E258362C047B9BF00C22B5FE91"
Spongent224="8443B12D2EEE4E09969A183205F5F7F684A711A5BE079A15F4CCDC30"
Spongent256="67DC8FC8B2EDBA6E55F4E68EC4F2B2196FE38DF9B1A760F4D43B4669160BF5A8"

echo -e "\e[32m (*) \e[0m Testing Spongent-88"
Hash=$(bin/spongent-88 testvectors/spongent | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Spongent88" ]; then
	echo -e "\e[31m (!)\e[0m Spongent-88 fail"
	echo "Expected: $Spongent88"
	echo "Recieved: $Hash"
fi
echo -e "\e[32m (*) \e[0m Testing Spongent-128"
Hash=$(bin/spongent-128 testvectors/spongent | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Spongent128" ]; then
	echo "\e[31m (!)\e[0m Spongent-128 fail"
	echo "Expected: $Spongent128"
	echo "Recieved: $Hash"
fi

echo -e "\e[32m (*) \e[0m Testing Spongent-160"
Hash=$(bin/spongent-160 testvectors/spongent | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Spongent160" ]; then
	echo -e "\e[31m (!)\e[0m Spongent-160 fail"
	echo "Expected: $Spongent160"
	echo "Recieved: $Hash"
fi

echo -e "\e[32m (*) \e[0m Testing Spongent-224"
Hash=$(bin/spongent-224 testvectors/spongent | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Spongent224" ]; then
	echo -e "\e[31m (!)\e[0m Spongent-224 fail"
	echo "Expected: $Spongent224"
	echo "Recieved: $Hash"
fi

echo -e "\e[32m (*) \e[0m Testing Spongent-256"
Hash=$(bin/spongent-256 testvectors/spongent | grep Hash | cut -d ":" -f 2 | tr -d "\n")
if [ "$Hash" != "$Spongent256" ]; then
	echo -e "\e[31m (!)\e[0m Spongent-256 fail"
	echo "Expected: $Spongent256"
	echo "Recieved: $Hash"
fi

