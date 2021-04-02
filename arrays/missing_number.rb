# Given an array nums containing n distinct numbers in the range [0, n],
# return the only number in the range that is missing from the array.

# Follow up: Could you implement a solution using only O(1) extra space
# complexity and O(n) runtime complexity?

#
# Approach #1 Sorting
#

# Intuition
#
# If nums were in order, it would be easy to see which number is missing.
#
# Algorithm
#
# First, we sort nums. Then, we check the two special cases that can be
# handled in constant time - ensuring that 0 is at the beginning and
# that n is at the end. Given that those assumptions hold, the missing number
# must somewhere between (but not including) 0 and n. To find it, we ensure
# that the number we expect to be at each index is indeed there. Because
# we handled the edge cases, this is simply the previous number plus 1.
# Thus, as soon as we find an unexpected number, we can simply return
# the expected number.
#

# Time complexity: O(n log n)
# The only elements of the algorithm that have asymptotically nonconstant
# time complexity are the main for loop (which runs in O(n) time),
# and the sort invocation (which runs in O(nlgn) time for
# Python and Java). Therefore, the runtime is dominated by sort,
# and the entire runtime is O(n log n).
# Space complexity: O(1) (or O(n))
# In the sample code, we sorted nums in place, allowing us to avoid allocating
# additional space. If modifying nums is forbidden, we can allocate an O(n)
# size copy and sort that instead.

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  nums = nums.sort

  # Ensure that n is at the last index
  if nums[nums.count - 1] != nums.count
    return nums.count
  elsif nums[0] != 0
    return 0
  end

  # If we get here, then the missing number is on the range (0, n)
  (1..nums.count).each do |index|
    expected_num = nums[index - 1] + 1
    return expected_num if nums[index] != expected_num
  end
end

nums = [3, 0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 3 since there are 3 numbers,
# so all numbers are in the range [0,3].
# 2 is the missing number in the range since it does not appear in nums.

nums = [0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 2 since there are 2 numbers, so all numbers are
# in the range [0,2]. 2 is the missing number in the range since
# it does not appear in nums.

nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
puts(missing_number(nums))
# Output: 8
# Explanation: n = 9 since there are 9 numbers, so all numbers are
# in the range [0,9]. 8 is the missing number in the range since
# it does not appear in nums.

nums = [0]
puts(missing_number(nums))
# Output: 1
# Explanation: n = 1 since there is 1 number, so all numbers are
# in the range [0,1]. 1 is the missing number in the range since
# it does not appear in nums.

#
# Approach #2 HashSet
#

# Intuition
#
# A brute force method for solving this problem would be to simply
# check for the presence of each number that we expect to be present.
# The naive implementation might use a linear scan of the array to check
# for containment, but we can use a HashSet to get constant time containment
# queries and overall linear runtime.
#
# Algorithm
#
# This algorithm is almost identical to the brute force approach,
# except we first insert each element of nums into a set, allowing us
# to later query for containment in O(1) time.
require "set"

def missing_number(nums)
  set_nums = nums.to_set

  set_nums.count.times do |i|
    return i unless set_nums.include? i
  end
end

nums = [3, 0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 3 since there are 3 numbers,
# so all numbers are in the range [0,3].
# 2 is the missing number in the range since it does not appear in nums.

nums = [0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 2 since there are 2 numbers, so all numbers are
# in the range [0,2]. 2 is the missing number in the range since
# it does not appear in nums.

nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
puts(missing_number(nums))
# Output: 8
# Explanation: n = 9 since there are 9 numbers, so all numbers are
# in the range [0,9]. 8 is the missing number in the range since
# it does not appear in nums.

nums = [0]
puts(missing_number(nums))
# Output: 1
# Explanation: n = 1 since there is 1 number, so all numbers are
# in the range [0,1]. 1 is the missing number in the range since
# it does not appear in nums.

#
# Approach #3 Bit Manipulation
#

# Intuition
#
# We can harness the fact that XOR is its own inverse to find the missing
# element in linear time.
#
# Algorithm
#
# Because we know that nums contains nn numbers and that it is missing
# exactly one number on the range [0..n-1], we know that nn definitely
# replaces the missing number in nums. Therefore, if we initialize an integer
# to n and XOR it with every index and value, we will be left with the missing
# number. Consider the following example (the values have been sorted for
# intuitive convenience, but need not be):

# missing = 4∧(0∧0)∧(1∧1)∧(2∧3)∧(3∧4)
#         = (4∧4)∧(0∧0)∧(1∧1)∧(3∧3)∧2
#         = 0∧0∧0∧0∧2
#         = 2
​
# TODO:

# Approach #4 Gauss' Formula [Accepted]
#
# Intuition
#
# One of the most well-known stories in mathematics is of a young Gauss,
# forced to find the sum of the first 100 natural numbers by a lazy teacher.
# Rather than add the numbers by hand, he deduced a closed-form expression
# for the sum, or so the story goes. You can see the formula: n(n+1)/2
#
# Algorithm
#
# We can compute the sum of nums in linear time, and by Gauss' formula,
# we can compute the sum of the first nn natural numbers in constant time.
# Therefore, the number that is missing is simply the result of Gauss'
# formula minus the sum of nums, as nums consists of the first n natural
# numbers minus some number.

# Complexity Analysis

# Time complexity: O(n)

# Although Gauss' formula can be computed in O(1) time,
# summing nums costs us O(n) time, so the algorithm is
# overall linear. Because we have no information about which number is missing,
# an adversary could always design an input for which any algorithm that
# examines fewer than nn numbers fails. Therefore, this solution is
# asymptotically optimal.

# Space complexity: O(1)

# This approach only pushes a few integers around,
# so it has constant memory usage.

def missing_number(nums)
  n = nums.count

  expected_sum = n * (n + 1) / 2
  actual_sum = nums.sum

  expected_sum - actual_sum
end

nums = [3, 0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 3 since there are 3 numbers,
# so all numbers are in the range [0,3].
# 2 is the missing number in the range since it does not appear in nums.

nums = [0, 1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 2 since there are 2 numbers, so all numbers are
# in the range [0,2]. 2 is the missing number in the range since
# it does not appear in nums.

nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
puts(missing_number(nums))
# Output: 8
# Explanation: n = 9 since there are 9 numbers, so all numbers are
# in the range [0,9]. 8 is the missing number in the range since
# it does not appear in nums.

nums = [0]
puts(missing_number(nums))
# Output: 1
# Explanation: n = 1 since there is 1 number, so all numbers are
# in the range [0,1]. 1 is the missing number in the range since
# it does not appear in nums.
