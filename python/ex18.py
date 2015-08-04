#!/usr/bin/python
# This is one is like your script with argv
def print_two(*args):
	arg1, arg2 = args
	print "arg1: %r, arg2: %r" % (arg1, arg2)

# ok, that *args is actually pointless, we can just do this
def print_two_again(arg1, arg2):
	print "arg1: %r, arg2: %r" % (arg1, arg2)

def print_one(arg1):
	print "arg1: %r" % arg1

def print_none():
	print "I got Nothin'."

print_two("Sunny", "Sharma")
print_two_again("Sunny", "Sharma")
print_one("first")
print_none()
