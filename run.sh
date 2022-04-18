#!/bin/bash

command clear

python - << EOF
import pyfiglet
from termcolor import colored

banner = pyfiglet.figlet_format("THE EASY SCRIPT")
print(colored(banner, 'white'))

EOF

echo "For help type in help"

while true
do
    echo "Command"

    read command

    if [ "$command" == "mon" ];then
        echo "Turn Mon Mode On Or Off"

        read on_off

        if [ $on_off == "on" ]; then
            ifconfig
            echo "What interface do you want to use:"
            read interface
            sudo airmon-ng check kill
            sudo airmon-ng start $interface

        fi

        if [ $on_off == "off" ]; then
            ifconfig 
            echo "What interface do you want to use:"
            read interface
            sudo airmon-ng stop $interface
            sudo service NetworkManager start

        fi

    fi

    if [ $command == "clear" ]; then
        command clear

    fi

    if [ $command == "macchanger" ];then
        ifconfig
        echo "What interface do you want to use:"

        read interface

        sudo ifconfig $interface down
        sudo macchanger -a $interface
        sudo ifconfig $interface up
    fi

    if [ $command == "reaver" ];then
        ifconfig 
        echo "What Interface do you want to use:"
        read interface
        command clear
        echo "What is the BSSID:"
        read BSSID
        echo "What is the ESSID:"
        read ESSID
        echo "What is the channel:"
        read channel

        sudo reaver --no-nacks -i $interface -b $bssid -e $ESSID -vv

    fi
    
    if [ $command == "help" ];then
        echo "The commands are as follows"
        sleep 1
        echo "mon"
        echo "clear"
        echo "macchanger"
        echo "reaver"
        echo "ipg" 
        echo "exit"
        echo "ps"
        echo "wva"
        echo "md5"
        echo "sha1"
        
    fi      

    if [ $command == "ipg" ];then
        sudo python3 ipgrabber.py

    fi

    if [ $command == "exit" ];then
        exit 1

    fi

    if [ $command == "ps" ];then
        sudo bash portscanner.sh

    fi

    if [ $command == "wva" ];then
        echo "What is the host URL:"

        read URL

        sudo nikto -h $URL

    fi

    if [ $command == "md5" ];then
        sudo python3 md5.py
    fi

    if [ $command == "sha1" ];then
        sudo python3 sha1.py

    fi

done

