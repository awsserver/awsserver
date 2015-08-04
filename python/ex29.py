#!/usr/bin/python
people = int(raw_input("Enter The number of People:- "))
cats = int(raw_input("Enter The number of cats:- "))
dogs = int(raw_input("Enter The number of dogs:- "))

if  int(people) < int(cats):
	print "Too Many cats! The world is doomed!"

if int(people) > int(cats): 
	print "Not many cats! The world is save!"

if int(people) < int(dogs):
	print "The World is drooled on!"

dogs += 5

if int(people) >= int(dogs):
	print "People are greater than or equal to dogs."

if int(people) <= int(dogs):
	print "people are less than or equal to dogs."

if int(people) == int(dogs):
	print "people are dogs."


