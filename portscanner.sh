#!/bin/bash

command clear

python - << EOF
import pyfiglet
from termcolor import colored

banner = pyfiglet.figlet_format("PORT SCANNER")
print(colored(banner, 'white'))

EOF

echo "What is the IP Address of target:"

read IP

sudo nmap -Pn -A $IP