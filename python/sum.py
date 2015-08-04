#!/usr/bin/python
def calculate_combinations(numbers, target_sum, array=[]):
    s = sum(array)

    # check if the partial sum is equals to target
    if s == target_sum: 
        print "sum(%s)=%s" % (array, target_sum)
    if s >= target_sum:
        return  # if we reach the number why bother to continue

    for i in range(len(numbers)):
        n = numbers[i]
        contemporary = numbers[i+1:]
        subset_sum(contemporary, target_sum, array + [n]) 


if __name__ == "__main__":
    subset_sum([3,9,8,4,5,7,10],15)
