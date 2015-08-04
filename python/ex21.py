#!/usr/bin/python
def add(a, b):
	print "Adding %d + %d" % (a, b)
	return a + b

def subtract(a, b):
	print "Subtract %d + %d" % (a, b)
	return a - b

def multiply(a, b):
	print "Multiply %d * %d" % (a, b)
	return a * b

def devide(a, b):
	print "Devide %d / %d" % (a, b)
	return a / b

print "Lets do some math with just functions!"

age = add(30, 5 )
height = subtract(78, 4)
weight = multiply(90, 2)
iq = devide(100, 2)


print "Age:- %d, Height:- %d, Weight:- %d, IQ:- %d" % (age, height, weight, iq)
print "." * 180
#A puzzel for extra credit , Type it in anyway
print "Here is Puzzel"

what = add(age, subtract(height, multiply(weight, devide(iq, 2))))	

print "That becomes:- ", what, "can you do it by hand?"
