#! /bin/bash

# Function that controls the possible errors when executing the script.
# Control of errors
function die () {
    # Case 1
    if (( $# > 1 ))
    then
        echo -e "\n\e[0;31m [*] ERROR:\e[0m Only one argument can be passed to the script.\n"
        echo -e "\t --> [*] Try './ports_scan.sh <ip_address>'\n"
        exit 1;
    fi

    # Case 2
    if (( $# == 0 ))
    then
        echo -e "\n\e[0;31m [*] ERROR:\e[0m An argument is required for script execution.\n"
        echo -e "\t --> [*] Try './ports_scan.sh <ip_address>'\n"
        exit 1;
    fi
    
    # Case 3
    check=$(ping -c 1 $1 2>/dev/null | grep "ttl" | wc -l)
    if (( $# == 1 && $check != 1  ))
    then
        echo -e "\n\e[0;31m [*] ERROR:\e[0m The machine to be scanned is not available or does not exist \n"
        exit 1;
    fi
}   
   
# Function that warns and shows on the screen that the ports of the victim machine are being scanned.
function start_scan () {
	echo -e "\n \e[1;33m The ports scan has started: \e[0m"
}
 
# Function that warns and shows on the screen that the ports of the victim machine are being scanned.
function load_scan () {
	echo -e "\n \e[1;33m [*] Scanning ports ...\e[0m \n"
}

# Function that tracks the ports and services that are open on the victim machine using the "nmap" utility.
function nmap_scan () {
	# TCP ports that are open on the machine specified by the command line
	ports=$(nmap $1 -p- --open -T5 -v | grep -P '^[0-9]' | sed "s/  */,/g" | cut -d / -f 1 | xargs | tr " " ", ")
	# Services that are open on the machine specified by the command line
	services=$(nmap $1 -p- --open -T5 -v | grep -P '^[0-9]' | sed "s/  */,/g" | awk '{print $3}' FS=',' | xargs | tr " " ", ")
}

# Function that displays the IP address or name of the victim machine.
function show_tracked_machine () {
	echo -e "\t [*] The tracked machine is: \e[0;35m $1 \e[0m";
}

# Function that shows the scanned TCP ports of the victim machine.
function show_scan_ports () {
	echo -e "\t [*] The TCP ports that are open are: \e[0;35m $ports \e[0m"
}

# Function that shows the services corresponding to the previously scanned ports of the victim machine.
function show_scan_services () {
	echo -e "\t [*] The services corresponding to the open ports are: \e[0;35m $services \e[0m"
}

# Function that notifies that the scan was carried out successfully.
function finish_scan () {
	echo -e "\n \e[0;32m ¡The scan has finished successfully! \e[0m \n"
	exit 0
}

# Main function that establishes the calls to the different functions of the script.
function main () {
    die $*
    start_scan
    load_scan
    nmap_scan $1
    show_tracked_machine $1
    show_scan_ports
    show_scan_services
    finish_scan
}

# Call the Main Function
main $*


