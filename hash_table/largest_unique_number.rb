# Given an array of integers A, return the largest integer that only occurs once.
# If no integer occurs once, return -1.

# Example 1:
#
# Input: [5,7,3,9,4,9,8,3,1]
# Output: 8
# Explanation:
# The maximum integer in the array is 9 but it is repeated. The number 8 occurs only once, so it's the answer.
#
# Example 2:
#
# Input: [9,9,8,8]
# Output: -1
# Explanation:
# There is no number that occurs only once.

# Note:
#
# 1 <= A.length <= 2000
# 0 <= A[i] <= 1000

#
# Approach: Hash table
#

# @param {Integer[]} a
# @return {Integer}
def largest_unique_number(a)
  hash = Hash.new(0)
  unique_numbers = []
  max = -1

  a.each do |num|
    hash[num] += 1
  end

  hash.each do |key, value|
    max = key if value == 1 && max < key
  end

  max
end

a = [5, 7, 3, 9, 4, 9, 8, 3, 1]
puts largest_unique_number(a)
# Output: 8

a = [9, 9, 8, 8]
puts largest_unique_number(a)
# Output: -1
