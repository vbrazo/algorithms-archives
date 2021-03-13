# Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.
#
# Example 1:
#
# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75
# Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75

#
# Approach: Sliding Window
#

#
# Complexity Analysis
#
# Time complexity: O(n). We iterate over the given nums
# array of length n once only.
#
# Space complexity: O(1). Constant extra space is used.
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  window_val = nums[0...k].sum
  max_val = window_val

  for i in 1..nums.length-k
    window_val = window_val - nums[i - 1] + nums[i + k - 1]

    max_val = window_val if window_val > max_val
  end

  max_val / (1.0 * k)
end

nums = [1, 12, -5, -6, 50, 3]
k = 4
puts find_max_average(nums, k)
# Output: 12.75

nums = [-1]
k = 1
puts find_max_average(nums, k)
# Output: -1

nums = [0, 4, 0, 3, 2]
k = 1
puts find_max_average(nums, k)
# Output: 4
