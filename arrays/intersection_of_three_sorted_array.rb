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

  hash.select { |_, value| value == 3 }.map { |key, _| key }
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
