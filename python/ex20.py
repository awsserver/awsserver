#!/usr/bin/python
from sys import argv

#script, input_file  = argv

def print_all(sunny):
	print sunny.read()

def rewind(sunny):
	sunny.seek(0)

def print_a_line(line_count, sunny):
	print line_count, sunny.readline()
input_file = raw_input("Enter the name of file")
current_file = open(input_file)

print "The name of file is %s\n" % input_file

print_all(current_file)

print "Now let`s rewind, kind of like a tape."

rewind(current_file)

print "Let`s print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

