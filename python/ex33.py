#!/usr/bin/python
i = 0
suny = 8
numbers = []
while i < suny:
	print "At th top i is %d" % i
	numbers.append(i)

	i = i + 1
	print "Numbers now: ", numbers
	print "At the bottom i is %d " % i 
	
print "The numbers: "

for num in numbers:
	print num
