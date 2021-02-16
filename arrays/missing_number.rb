# Given an array nums containing n distinct numbers in the range [0, n],
# return the only number in the range that is missing from the array.

# Follow up: Could you implement a solution using only O(1) extra space
# complexity and O(n) runtime complexity?

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
  if nums[nums.count-1] != nums.count
    return nums.count
  elsif nums[0] != 0
    return 0
  end

  # If we get here, then the missing number is on the range (0, n)
  for index in 1..nums.count
    expected_num = nums[index-1] + 1
    if nums[index] != expected_num
      return expected_num
    end
  end
end

nums = [3,0,1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 3 since there are 3 numbers,
# so all numbers are in the range [0,3].
# 2 is the missing number in the range since it does not appear in nums.

nums = [0,1]
puts(missing_number(nums))
# Output: 2
# Explanation: n = 2 since there are 2 numbers, so all numbers are
# in the range [0,2]. 2 is the missing number in the range since
# it does not appear in nums.

nums = [9,6,4,2,3,5,7,0,1]
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
