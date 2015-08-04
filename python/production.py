#!/usr/bin/python
from sys import exit

def prod_act():
    print "There is production activity this weekend.Are you ready?"
 	
    choice = raw_input("> ")
    if "saturday" in choice or "sunday" in choice:
        weekend = str(choice)
    else:
        dead ("There is no production activity this weekend.")
	
    if weekend == "saturday" or weekend == "sunday": 
        print "Nice this weekend is production activity be ready."
        exit(0)
    else:
        dead("Sorry Guys due to confusion production activity cancled.")

def snap_act():
    print "Team Please take snapshot before service stop."
    print "Team also take sanpshot after service stop."
    print "Make sure snapshot activity complete on time."
    snap_done = False

    while True:
	choice = raw_input("< ")

	if choice == "monday":
	    dead("We never scheduled any production activity in weekday Sorry!")		
	elif choice == "this-weekend" and not snap_done:
	    print "This is great all prepration done. We are ready."

	    snap_done = True
	elif choice == "this-weekend" and snap_done:
	    dead("You are ready for production activity its sounds good.")
	elif choice == "okay" and snap_done:
	    prod_act()
	else:
	    print "I have no idea about production activity."

def dead(why):
    print why, "Good job!"
    exit(0)


snap_act() 
