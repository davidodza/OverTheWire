'''
This script is for cracking the Vigenère Cipher
Krypton Level 3 → Level 4 (http://overthewire.org/wargames/krypton/krypton4.html)

Plan
1) Input 2 text files of cipher text.
2) Divide the cipher text into n seperate files where n = key length
3) Frequency analysis of every key space.
'''
from collections import Counter

#newSeperateFiles creates a text file for every key space and distributes characters into the proper file

def newSeperateFiles(fileName, keyLength):
    originalFile = open(fileName, "r")
    #create a new text file per key space    
    for i in range(1, keyLength+1):
        newFile = "cipherKey" + str(i) + ".txt"
        open(newFile, 'w')        
    
    iterator = 1
    cipherTxt = open(fileName, 'r').read()
    cipherTxt = cipherTxt.replace(" ", "") #remove spaces    

#distibute the cipher text into the correct key file
    for c in cipherTxt:        
        if iterator%keyLength == 0:            
            with open("cipherKey" + str(keyLength) + ".txt", "a") as f:
                f.write(c)
        else:
            with open("cipherKey" + str(iterator%keyLength) + ".txt", "a") as f:
                f.write(c)

        iterator += 1
         
    return

#SeperateFiles distributes characters into the proper file (for use with multiple input files)

def SeperateFiles(fileName, keyLength):
    originalFile = open(fileName, "r")
    iterator = 1
    cipherTxt = open(fileName, 'r').read()
    cipherTxt = cipherTxt.replace(" ", "") #remove spaces    

#distibute the cipher text into the correct key file
    for c in cipherTxt:        
        if iterator%keyLength == 0:            
            with open("cipherKey" + str(keyLength) + ".txt", "a") as f:
                f.write(c)
        else:
            with open("cipherKey" + str(iterator%keyLength) + ".txt", "a") as f:
                f.write(c)

        iterator += 1
    return

#Frequencies outputs the amount of occurences of each letter per key space

def Frequencies(keyLength):
    for i in range(1, keyLength+1):
        print ("Key " + str(i) + " frequncies:")
        
        with open("cipherKey" + str(i) + ".txt") as f:
            c = Counter()
            for x in f:
                c += Counter(x.strip())
        print(sorted(c.items()))

keyLength = 6
newSeperateFiles("cipherTxt1.txt", keyLength)
SeperateFiles("cipherTxt2.txt", keyLength)
Frequencies(keyLength)

'''
Output:
Key 1 frequncies:
[('A', 6), ('B', 21), ('D', 11), ('F', 47), ('G', 8), ('H', 14), ('I', 35), ('J', 95), ('K', 23), ('L', 10), ('M', 41), ('N', 40), ('O', 1), ('P', 9), ('Q', 20), ('R', 11), ('S', 50), ('T', 57), ('U', 10), ('W', 37), ('X', 29), ('Y', 55), ('Z', 21)]
Key 2 frequncies:
[('B', 5), ('C', 25), ('D', 6), ('E', 40), ('F', 49), ('G', 9), ('I', 40), ('J', 34), ('K', 65), ('L', 15), ('M', 4), ('N', 24), ('P', 19), ('R', 54), ('S', 4), ('T', 15), ('U', 49), ('V', 73), ('W', 24), ('X', 13), ('Y', 47), ('Z', 37)]
Key 3 frequncies:
[('A', 22), ('B', 1), ('C', 12), ('E', 43), ('F', 7), ('G', 17), ('H', 37), ('I', 79), ('J', 10), ('K', 11), ('L', 45), ('M', 37), ('N', 1), ('O', 10), ('P', 27), ('Q', 14), ('R', 37), ('S', 66), ('T', 10), ('V', 45), ('W', 29), ('X', 76), ('Y', 11), ('Z', 4)]
Key 4 frequncies:
[('A', 1), ('B', 52), ('C', 41), ('D', 63), ('E', 23), ('F', 2), ('G', 24), ('H', 1), ('I', 18), ('K', 59), ('L', 13), ('M', 16), ('N', 39), ('O', 81), ('P', 12), ('Q', 9), ('R', 41), ('S', 35), ('T', 2), ('U', 5), ('V', 30), ('W', 8), ('X', 31), ('Y', 37), ('Z', 8)]
Key 5 frequncies:
[('A', 19), ('C', 10), ('E', 44), ('F', 8), ('G', 17), ('H', 23), ('I', 84), ('J', 14), ('K', 12), ('L', 47), ('M', 39), ('O', 8), ('P', 30), ('Q', 14), ('R', 38), ('S', 56), ('T', 9), ('V', 39), ('W', 44), ('X', 67), ('Y', 23), ('Z', 5)]
Key 6 frequncies:
[('A', 8), ('B', 38), ('C', 92), ('D', 15), ('E', 10), ('F', 51), ('G', 25), ('H', 2), ('I', 11), ('J', 25), ('K', 15), ('L', 40), ('M', 54), ('N', 9), ('P', 39), ('Q', 38), ('R', 60), ('S', 19), ('T', 4), ('U', 18), ('W', 18), ('Y', 51), ('Z', 7)]
'''
