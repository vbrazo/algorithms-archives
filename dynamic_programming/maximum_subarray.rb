# Given an integer array nums, find the contiguous subarray (containing at least one number)
# which has the largest sum and return its sum.
#
# Example 1:
#
# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
#
# Example 2:
#
# Input: nums = [1]
# Output: 1
#
# Example 3:
#
# Input: nums = [5,4,-1,7,8]
# Output: 23

#
# Approach 1: Optimized Brute Force
#

# Complexity Analysis
#
# Time complexity: O(N^2), where N is the length of nums.
# We use 2 nested for loops, with each loop iterating through nums.
# Space complexity: O(1). No matter how big the input is, we are only ever
# using 2 variables: ans and currentSubarray.

def max_sub_array(nums)
  max_sum = nums[0]

  for i in (0...nums.length) do
    sum_so_far = 0
    for j in (i...nums.length) do
      sum_so_far += nums[j]
      max_sum = [sum_so_far, max_sum].max
    end
  end

  return max_sum
end

#
# Approach 2: Dynamic Programming, Kadane's Algorithm
#

# Complexity Analysis
#
# Time complexity: O(N), where NN is the length of nums.
# We iterate through every element of nums exactly once.
# Space complexity: O(1)
# No matter how long the input is, we are only ever using 2 variables: currentSubarray and maxSubarray.

def max_sub_array(nums)
  return if nums.empty?

  max_so_far = Array.new(nums.length)
  max_so_far[0] = nums[0]

  (1...nums.length).each do |i|
    max_so_far[i] = [nums[i], nums[i] + max_so_far[i-1]].max
  end

  return max_so_far.max
end

#
# Approach 3: Divide and Conquer (Advanced)
#

# Complexity Analysis
#
# Time complexity: O(N⋅log n), where N is the length of nums.
# Space complexity: O(log n), where N is the length of nums.

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return nil if nums.empty?
  return get_max_for_subarray(nums, 0, nums.length - 1)
end

def get_max_for_subarray(nums, left, right)
  if left > right
    return -Float::Infinity
  elsif left == right
    return nums[left]
  end

  mid = (left + right) / 2

  # Get max of left half
  left_max = get_max_for_subarray(nums, left, mid)

  # Get max of right half
  right_max = get_max_for_subarray(nums, mid + 1, right)

  # Get the max value across the middle
  mid_max = get_max_across_middle(nums, left, right)

  return [left_max, right_max, mid_max].max
end

def get_max_across_middle(nums, left, right)
  mid = (left + right) / 2

  # Get max across left half, starting from mid
  left_mid_max = -Float::INFINITY
  sum_so_far = 0

  mid.downto(left).each do |i|
    sum_so_far += nums[i]
    left_mid_max = [left_mid_max, sum_so_far].max
  end

  # Get max across right half, starting from mid + 1
  right_mid_max = -Float::INFINITY
  sum_so_far = 0

  (mid+1).upto(right).each do |i|
    sum_so_far += nums[i]
    right_mid_max = [right_mid_max, sum_so_far].max
  end

  left_mid_max + right_mid_max
end
