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
  pointer1 = 0
  pointer2 = k
  max_average = 0

  (k..nums.count).each do
    new_average = nums[pointer1..pointer2-1].sum / (k * 1.0)

    max_average = new_average if max_average < new_average

    pointer1 += 1
    pointer2 += 1
  end

  max_average
end

nums = [1, 12, -5, -6, 50, 3]
k = 4
puts find_max_average(nums, k)
# Output: 12.75
