#!/usr/bin/python
def add(a, b):
	print "Adding %d + %d" % (a, b)
	return a + b

def subtract(a, b):
	print "suntract %d - %d" % (a, b)
	return a - b
	
def multiply(a, b):
	print "multiply %d * %d" % (a, b)
	return a * b

def devide(a, b):
	print "Devide %d / %d" % (a, b)

print "Enter the Values"

a = float(raw_input("Enter the value of a= "))
b = float(raw_input("Enter the Value of b= "))

age = add(int(a), int(b))
height = subtract(int(a), int(b))
weight = multiply(int(a), int(b))
iq = devide(int(a), int(b))

print "Age: %r, Height: %r, Weight: %r, IQ: %r" % (age, height, weight, iq)

