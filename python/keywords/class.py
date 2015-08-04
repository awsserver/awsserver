class employee:
	'Common base class for all employee'
	empCount = 0
    
	def __int__(self, name, salary):
		self.name = name
		self.salary = salary
		Employee.empCount += 1
	
	def displayiCount(self):
		print "Total Employee %d" % Employee.empCount

	def displayEmployee(self):
		print "Name: ", self.name, "Salary: ", self.salary
