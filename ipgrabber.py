# Imports
import socket

# Starter Code
print('                                           ')
print(' =================  ||==============||     ')
print('        ||          ||              ||     ')
print('        ||          ||              ||     ')
print('        ||          ||              ||     ')
print('        ||          ||              ||     ')
print('        ||          ||==============||     ')
print('        ||          ||                     ')
print('        ||          ||                     ')
print('        ||          ||                     ')
print('        ||          ||                     ')
print('        ||          ||                     ')
print(' =================')




# Main Code
user_input = input("What is the Website URL:")

print('The IP of said URL is: ' + socket.gethostbyname(user_input))