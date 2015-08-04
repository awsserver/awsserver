#!/usr/bin/python
the_count = [[1,2,3,4,5],[5,4,3,2,1]]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

for number in the_count:
	print "This is count %r" % number 

for fruit in fruits:
	print "A fruit of type %r" % fruit

for i in change:
	print "I got %r" % i

elements = []

for i in range(0, 10):
	print "Adding %r to the list." % i
	elements.append(i)

for i in elements:
	print "Element was %r" % i
