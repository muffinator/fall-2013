from string import *



inputfile = open('log.txt')
outputfile = open('test.csv', 'w')

my_text = inputfile.readlines()[1:]



inputfile.close()
outputfile.close()
