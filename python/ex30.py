#!/usr/bin/python
people = int(raw_input("Enter the People Value:- "))
cars = int(raw_input("Enter the Cars Value:- "))
trucks = int(raw_input("Enter the Truck Value:- "))

if cars > people:
	print "We should take the cars.Becasuei cars %d greter the people %d" % (cars, people)
elif cars < people:
	print "We should not take the cars."
else:
	print "We can`t decide."

if trucks > cars:
	print "That's too many trucks."
elif trucks < cars: 
	print "May be we could take the trucks."
else:
	print "We still Can`t decide."
if people > trucks:
	print "Alright, let`s just take the trucks."
else:
	print "Fine, Let's stay home then."
