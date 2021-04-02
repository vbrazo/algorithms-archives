# Given three integer arrays arr1, arr2 and arr3 sorted in strictly
# increasing order, return a sorted array of only the integers that
# appeared in all three arrays.

# Example 1:
#
# Input: arr1 = [1,2,3,4,5], arr2 = [1,2,5,7,9], arr3 = [1,3,4,5,8]
# Output: [1,5]
# Explanation: Only 1 and 5 appeared in the three arrays.
#
# Example 2:
#
# Input: arr1 = [197,418,523,876,1356], arr2 = [501,880,1593,1710,1870], arr3 = [521,682,1337,1395,1764]
# Output: []

#
# Approach 1: Brute Force with Hashmap
#
# One of the most straightforward approaches would be counting the
# frequencies of each item in arr1, arr2, and arr3 so that we would
# be able to find the numbers that appear exactly three times. This
# is feasible because all of the three arrays are strictly increasing,
# hence we can rule out the possibility that some element appears
# more than once in any of the arrays.
#
# Algorithm
#
# We would initiate a Hashmap counter to record the numbers that appear in the three arrays and the number of times they appear;
# then we scan arr1, arr2, and arr3 to count the frequencies;
# finally, we would iterate through counter to find the numbers that appear three times.

# Complexity Analysis

# Time Complexity: O(n), where n is the total length of
# all of the input arrays.
# Space Complexity: O(n), where n is the total length of all of the
# input arrays. This is because we adopted a Hashhmap to store all
# numbers and their number of appearances.

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer[]} arr3
# @return {Integer[]}
def arrays_intersection(arr1, arr2, arr3)
  hash = {}

  add_to_hash(arr1, hash)
  add_to_hash(arr2, hash)
  add_to_hash(arr3, hash)

  hash.select {|_, value| value == 3 }.map {|key, _| key }
end

def add_to_hash(array, hash)
  array.each do |number|
    hash[number] = hash[number].to_i + 1
  end
end

arr1 = [1, 2, 3, 4, 5]
arr2 = [1, 2, 5, 7, 9]
arr3 = [1, 3, 4, 5, 8]
print(arrays_intersection(arr1, arr2, arr3))
# Output: [1,5]

arr1 = [197, 418, 523, 876, 1356]
arr2 = [501, 880, 1593, 1710, 1870]
arr3 = [521, 682, 1337, 1395, 1764]
print(arrays_intersection(arr1, arr2, arr3))
# Output: []

#
# Approach 2: Three pointers
#

# You may notice that Approach 1 does not utilize the fact that
# all arrays are sorted. Indeed, instead of using a Hashmap to
# store the frequencies, we can use three pointers p1, p2, and p3
# to iterate through arr1, arr2, and arr3 accordingly:
#
# Each time, we want to increment the pointer that points to the
# smallest number, i.e., min(arr1[p1], arr2[p2], arr3[p3]) forward;
# if the numbers pointed to by p1, p2, and p3 are the same, we should
# then store it and move all three pointers forward.
# Moreover, we don't have to move the pointer pointing to the smallest
# number - we only need to move the pointer pointing to a smaller
# number. In this case, we avoid comparing three numbers and finding
# the smallest one before deciding which one to move. You may find
# the rationale behind this in the Algorithm.

# Complexity Analysis
#
# Time Complexity: O(n), where nn is the total length of all of the
# input arrays.
# Space Complexity: O(1), as we only initiate three integer variables
# using constant space.

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @param {Integer[]} arr3
# @return {Integer[]}
def arrays_intersection(arr1, arr2, arr3)
  result = []

  # prepare three pointers to iterate through three arrays
  # p1, p2, and p3 point to the beginning of arr1, arr2, and arr3 accordingly
  p1 = p2 = p3 = 0

  while (p1 < arr1.count) && (p2 < arr2.count) && (p3 < arr3.count)
    if arr1[p1] == arr2[p2] && arr1[p1] == arr3[p3]
      result.push(arr1[p1])

      p1 += 1
      p2 += 1
      p3 += 1
    elsif arr1[p1] < arr2[p2]
      p1 += 1
    elsif arr2[p2] < arr3[p3]
      p2 += 1
    else
      p3 += 1
    end
  end

  result
end

arr1 = [1, 2, 3, 4, 5]
arr2 = [1, 2, 5, 7, 9]
arr3 = [1, 3, 4, 5, 8]
print(arrays_intersection(arr1, arr2, arr3))
# Output: [1,5]

arr1 = [197, 418, 523, 876, 1356]
arr2 = [501, 880, 1593, 1710, 1870]
arr3 = [521, 682, 1337, 1395, 1764]
print(arrays_intersection(arr1, arr2, arr3))
# Output: []
