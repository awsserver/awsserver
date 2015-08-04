#!/usr/local/bin/python

#from itertools import combinations

a = int(raw_input("Enter First Value in array:-"))
b = int(raw_input("Enter Second Value in array:-"))
c = int(raw_input("Enter Third Value in array:-"))
d = int(raw_input("Enter Fourth Value in array:-"))
e = int(raw_input("Enter Fifth Value in array:-"))
f = int(raw_input("Enter Sixth Value in array:-"))
g = int(raw_input("Enter Seven Value in array:-"))
h = int(raw_input("Enter Target_Sum Value:-"))


def subset_sum(numbers, target_sum, array=[]):
    s = sum(array)

    # check if the partial sum is equals to target
    if s == target_sum: 
        print "sum(%s)=%s" % (array, target_sum)
    if s >= target_sum:
        return  # if we reach the number why bother to continue

    for i in range(len(numbers)):
        n = numbers[i]
        remaining = numbers[i+1:]
        subset_sum(remaining, target_sum, array + [n]) 


if __name__ == "__main__":
    subset_sum([a,b,c,d,e,f,g], h)

