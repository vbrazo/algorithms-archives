# Given two arrays of integers nums and index. Your task is to create target array under the following rules:
#
# Initially target array is empty.
# From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
# Repeat the previous step until there are no elements to read in nums and index.
# Return the target array.
#
# It is guaranteed that the insertion operations will be valid.

# Example 1:
#
# Input: nums = [0,1,2,3,4], index = [0,1,2,2,1]
# Output: [0,4,1,3,2]
# Explanation:
# nums       index     target
# 0            0        [0]
# 1            1        [0,1]
# 2            2        [0,1,2]
# 3            2        [0,1,3,2]
# 4            1        [0,4,1,3,2]

# Example 2:
#
# Input: nums = [1,2,3,4,0], index = [0,1,2,3,0]
# Output: [0,1,2,3,4]
# Explanation:
# nums       index     target
# 1            0        [1]
# 2            1        [1,2]
# 3            2        [1,2,3]
# 4            3        [1,2,3,4]
# 0            0        [0,1,2,3,4]

# Example 3:
#
# Input: nums = [1], index = [0]
# Output: [1]

#
# Approach 1
#

# @param {Integer[]} nums
# @param {Integer[]} index
# @return {Integer[]}
def create_target_array(nums, index)
  arr = []

  nums.count.times do |i|
    arr.insert(index[i], nums[i])
  end

  arr
end

nums = [0, 1, 2, 3, 4]
index = [0, 1, 2, 2, 1]
create_target_array(nums, index)
# Output: [0,4,1,3,2]

nums = [1, 2, 3, 4, 0]
index = [0, 1, 2, 3, 0]
create_target_array(nums, index)
# Output: [0,1,2,3,4]

nums = [1]
index = [0]
create_target_array(nums, index)
# Output: [1]

#
# Approach 2:
#
# Append every new element to the end of the
# resulting array, and make right part of the array move
# one step forward by swapping new element with left neighbor.
# Swap until new element's index is equal to the required index
# from index array.
#

# @param {Integer[]} nums
# @param {Integer[]} index
# @return {Integer[]}
def create_target_array(nums, index)
  result = []

  nums.each_with_index do |value, indx|
    i = index[indx]
    result.push(value)
    j = result.size - 1

    while i != j
      result[j - 1], result[j] = result[j], result[j - 1]
      j -= 1
    end
  end

  result
end

nums = [0, 1, 2, 3, 4]
index = [0, 1, 2, 2, 1]
create_target_array(nums, index)
# Output: [0,4,1,3,2]

nums = [1, 2, 3, 4, 0]
index = [0, 1, 2, 3, 0]
create_target_array(nums, index)
# Output: [0,1,2,3,4]

nums = [1]
index = [0]
create_target_array(nums, index)
# Output: [1]
