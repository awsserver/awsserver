#/usr/bin/python
print "Lets Practice Everything"
print "You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs."

poem ="""
\tThe lovely world 
with logic so firmly planted 
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\where there is non.
"""
print "--------------"
print poem
print "--------------"

five = 10 -2 + 3 -6 
print "This should be five: %s" % five

def secret_formula(started):
	jelly_beans = started * 500
	jars = jelly_beans / 1000
	crates = jars / 100
	sunny = crates / 2
	return jelly_beans, jars, crates, sunny

#starting_point = raw_input()
start_point = raw_input()
beans, jars, crates, sunny = secret_formula(int(start_point))

print "With a starting point of %r" % start_point
print "We'd have %r beans, %r jars, %r crates, and %r sunny." % (beans, jars, crates, sunny)	

start_point =int(start_point) / 10

print "We can also do this way:"
print "We'd have %r beans, %r jars, %r crates, %r sunny." % secret_formula(start_point)
