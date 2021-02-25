# Given an array, rotate the array to the right by k steps,
# where k is non-negative.
#
# Follow up:
#
# Try to come up as many solutions as you can,
# there are at least 3 different ways to solve this problem.
# Could you do it in-place with O(1) extra space?
#

#
# Approach 1: Brute Force
#

# The simplest approach is to rotate all the elements of the
# array in k steps by rotating the elements by 1 unit in each step.

# Complexity Analysis

# Time complexity: O(n×k).
# All the numbers are shifted by one O(n) k times.
# Space complexity: O(1). No extra space is used.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k.times do |i|
    previous = nums.last

    nums.count.times do |j|
      nums[j], previous = previous, nums[j]
    end
  end

  print(nums)
end

nums = [1,2,3,4,5,6,7]
k = 3
rotate(nums, k)
# => [5,6,7,1,2,3,4]

# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

nums = [-1,-100,3,99]
k = 2
rotate(nums, k)
# => [3,99,-1,-100]

# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]
