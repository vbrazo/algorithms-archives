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
  k.times do |_i|
    previous = nums.last

    nums.count.times do |j|
      nums[j], previous = previous, nums[j]
    end
  end

  print(nums)
end

nums = [1, 2, 3, 4, 5, 6, 7]
k = 3
rotate(nums, k)
# => [5,6,7,1,2,3,4]

# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

nums = [-1, -100, 3, 99]
k = 2
rotate(nums, k)
# => [3,99,-1,-100]

# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]

#
# Approach 2: Using Extra Array
#

# Algorithm

# We use an extra array in which we place every element of the
# array at its correct position i.e. the number at index i
# in the original array is placed at the index (i + k) length
# of array. Then, we copy the new array to the original one.

# Complexity Analysis

# Time complexity: O(n). One pass is used to put the numbers
# in the new array. And another pass to copy the new array
# to the original one.

# Space complexity: O(n). Another array of the same size is used.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k = k % nums.length
  new_array = []
  start = nums.length - k

  (start...nums.length).each do |i|
    new_array.push(nums[i])
  end

  (0...start).each do |i|
    new_array.push(nums[i])
  end

  new_array.each_with_index do |value, index|
    nums[index] = value
  end
end

nums = [1, 2, 3, 4, 5, 6, 7]
k = 3
rotate(nums, k)
# => [5,6,7,1,2,3,4]

# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

nums = [-1, -100, 3, 99]
k = 2
rotate(nums, k)
# => [3,99,-1,-100]

# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]

#
# Approach 3: Using Cyclic Replacements
#

# Complexity Analysis

# Time complexity: O(n). Only one pass is used.
# Space complexity: O(1). Constant extra space is used.

def rotate(nums, k)
  remaining_cycles = nums.length
  k = k % nums.length

  start_idx = 0

  while remaining_cycles > 0
    curr_idx = start_idx
    curr_element = nums[curr_idx]

    loop do
      next_idx = (curr_idx + k) % nums.length
      next_element = nums[next_idx]

      nums[next_idx] = curr_element

      curr_element = next_element
      curr_idx = next_idx

      remaining_cycles -= 1

      break if curr_idx == start_idx || remaining_cycles <= 0
    end

    start_idx += 1
  end
end

nums = [1, 2, 3, 4, 5, 6, 7]
k = 3
rotate(nums, k)
# => [5,6,7,1,2,3,4]

# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

nums = [-1, -100, 3, 99]
k = 2
rotate(nums, k)
# => [3,99,-1,-100]

# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]

#
# Approach 4: Using Reverse
#

# Algorithm
#
# This approach is based on the fact that when we rotate
# the array k times, k%nk elements from the back end of
# the array come to the front and the rest of the elements
# from the front shift backwards.
#
# In this approach, we firstly reverse all the elements
# of the array. Then, reversing the first k elements
# followed by reversing the rest n-k elements gives us
# the required result.
#
# Let n = 7 and k = 3.
#
# Original List                   : 1 2 3 4 5 6 7
# After reversing all numbers     : 7 6 5 4 3 2 1
# After reversing first k numbers : 5 6 7 4 3 2 1
# After revering last n-k numbers : 5 6 7 1 2 3 4 --> Result

# Complexity Analysis

# Time complexity: O(n). n elements are reversed a total of three times.
# Space complexity: O(1). No extra space is used.

def rotate(nums, k)
  mod_k = k % nums.length
  return if k == 0

  # reverse the whole array
  reverse(nums, 0, nums.length - 1)
  reverse(nums, 0, mod_k - 1)
  reverse(nums, mod_k, nums.length - 1)
end

def reverse(nums, start, len)
  itr = start

  while itr <= (start + len) / 2
    nums[itr], nums[len - itr + start] = nums[len - itr + start], nums[itr]
    itr += 1
  end

  nums
end

nums = [1, 2, 3, 4, 5, 6, 7]
k = 3
rotate(nums, k)
# => [5,6,7,1,2,3,4]

# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

nums = [-1, -100, 3, 99]
k = 2
rotate(nums, k)
# => [3,99,-1,-100]

# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]
