# Imports
import pyfiglet
import hashlib


# Make the banner and print it
banner = pyfiglet.figlet_format("MD5 DEHASHER AND HASHER")
print(banner)

# Ask if they wanna hash or dehash
hash_or_dehash = input('Would you like to dehash or hash:').lower()

if hash_or_dehash == 'hash':
    what_to_hash = input('What would you like to hash:')
    method = hashlib.md5(what_to_hash.encode())
    print('The Hash is ' + str(method.hexdigest()))

if hash_or_dehash == 'dehash':
    what_is_the_hash = input('What is the hash:')

    wordlist = open("/usr/share/wordlists/rockyou.txt", encoding="latin-1")

    for line in wordlist:
        line = line.strip()

        method = hashlib.md5(line.encode())

        if method.hexdigest() == what_is_the_hash:
            print("The Password is " + str(line))
            exit()

        