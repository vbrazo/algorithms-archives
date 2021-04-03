# In a given integer array nums, there is always exactly one largest element.
#
# Find whether the largest element in the array is at least twice as much as every other number in the array.
#
# If it is, return the index of the largest element, otherwise return -1.
#
# Example 1:
#
# Input: nums = [3, 6, 1, 0]
# Output: 1
# Explanation: 6 is the largest integer, and for every other number in the array x,
# 6 is more than twice as big as x.  The index of value 6 is 1, so we return 1.
#
# Example 2:
#
# Input: nums = [1, 2, 3, 4]
# Output: -1
# Explanation: 4 isn't at least as big as twice the value of 3, so we return -1.
#
# Note:
#
# nums will have a length in the range [1, 50].
# Every nums[i] will be an integer in the range [0, 99].

#
# Approach #1: Linear Scan
#

# Complexity Analysis
#
# Time Complexity: O(N) where NN is the length of nums.
# Space Complexity: O(1), the space used by our int variables.

# @param {Integer[]} nums
# @return {Integer}
def dominant_index(nums)
  nums.each do |num|
    if num != nums.max && (num * 2 > nums.max)
      return -1
    end
  end

  nums.find_index(nums.max)
end

nums = [3, 6, 1, 0]
puts dominant_index(nums)
# Output: 1

nums = [1, 2, 3, 4]
puts dominant_index(nums)
# Output: -1
