#!/usr/bin/env bash 

HEADER="Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox\/81.0"
SITES=(
"https://dolarhoje.com"
"https://dolarhoje.com/euro-hoje/"
"https://dolarhoje.com/libra-hoje/"
"https://dolarhoje.com/bitcoin-hoje/"
)

while : ; do 


	for site in ${SITES[@]}; do

		COMMAND=$(curl -s -A "$HEADER" $site | egrep "id=\"nacional\"" | sed 's/<div.*value=//;s/\/>.*//;s/"//g;s/ //g')

		case $site in
			https://dolarhoje.com) 
				echo "DOLAR -> R\$$COMMAND"	
				;;
			https://dolarhoje.com/euro-hoje/) 
				echo "EURO -> R\$$COMMAND"	
				;;
			https://dolarhoje.com/libra-hoje/) 
				echo "LIBRA -> R\$$COMMAND"	
				;;
			https://dolarhoje.com/bitcoin-hoje/) 
				echo "BITCOIN -> R\$$COMMAND"	
				;;
		esac

	done 	

	sleep 43200
	clear
done 