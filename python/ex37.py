#!/usr/bin/python
import keyword
import sys 
import random as rnd
#AND
if 0 == 0 and 1 == 1:
	print "True"
else:
	print "Fasle"

#AS
for i in range(10):
	print rnd.randint(1,10)
print "Python Version: ", sys.version_info	

#ASSERT
#salary = raw_input("$ ")
#salary = 30000
#salary -= raw_input("$ ")
#print salary
#assert salary >= 0

for letter in 'python':
    if letter == 's':
      break
    print "current Letter", letter 

for i in 'cal':
        print "Welcome",i,"times"

for x in 'cal':
    ### Inner for loop	 ###
    for y in xrange(1,10):
        print '%r ' % (x),
    print

print "Sunny sharma"
for i in range(3):
	print "welcome",i,"sharmaji"

for i in range(15):
 	i < 12
	print i
