# Imports
import socket
import pyfiglet
from termcolor import colored
# Starter Code
banner = pyfiglet.figlet_format("IP SCANNER")
print(colored(banner, 'red'))




# Main Code
user_input = input("What is the Website URL:")

print('The IP of said URL is: ' + socket.gethostbyname(user_input))