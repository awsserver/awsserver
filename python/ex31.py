#!/usr/bin/python
print "=" * 80
print "You enter a dark room with two doors.Do you go through door #1 or do or #2? "
print "=" * 80

door = raw_input(" ")


if door == "1":
	print "There is a gaint bear here eating a cheese cake. What do you do ?"
	print "1. Take the cake."
	print "2. Scream at the bear."
	print "=" * 40
	bear = raw_input(" ")
		
	if bear == "1":
		print "The bear eats your face off. Good job!"
		print "=" * 40
	elif bear == "2":
		print "The bear eats your legs off. Good job!"
		print "=" * 40
	else: 
		print "Well, doing %s is probably better. Bear runs away." % bear
		print "=" * 40


elif door == "2":
	print "You stare into the endless abyss at cthulhu's retina."
	print "1. Blueberries."
	print "2. Yellow jacket clothespins."
	print "3 Understanding resolvers yelling melodies."
	print "=" * 40	
	insanity = raw_input(" ")
	
	if insanity == "1" or insanity == "2":
		print "Your body survives powered by a mind of jello. Good job!"
		print "=" * 40
	else:
		print "The insanity rots your eyes into a pool of muck. Good job!"
		print "=" * 40
else: 
	print " You Stumble around and fall on a knife and die. Great job!"
	print "=" * 80
