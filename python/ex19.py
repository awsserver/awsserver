#!/usr/bin/python
import string
def cheese_and_crackers(cheese_count, boxes_of_crackers):
	print "You have %r cheese!" % cheese_count
	print "You have %r boxes of Crackers!" % boxes_of_crackers
	print "Man that enough for party"
	print "Get a Blacket.\n"

print "We can just give the function number directly:"

cheese_and_crackers(20, 30)

print "OR, We can use variables from our script:"
print "Enter the amount of cheese?"
a = raw_input()
amount_of_cheese = a
print "Enter the amount of crackers"
b = raw_input()
amount_of_crackers = b

cheese_and_crackers(amount_of_cheese, amount_of_crackers)

print "we can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

print "And we can combine the two, Variables and math:"
cheese_and_crackers(int(amount_of_cheese) + 100, int(amount_of_cheese) + 1000)


print "Now we are going to pass Command line argument"
cheese_and_crackers(10, 30)
