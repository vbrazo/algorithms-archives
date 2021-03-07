# Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].
#
# Return the answer in an array.
#
# Example 1:
#
# Input: nums = [8,1,2,2,3]
# Output: [4,0,1,1,3]
# Explanation:
# For nums[0]=8 there exist four smaller numbers than it (1, 2, 2 and 3).
# For nums[1]=1 does not exist any smaller number than it.
# For nums[2]=2 there exist one smaller number than it (1).
# For nums[3]=2 there exist one smaller number than it (1).
# For nums[4]=3 there exist three smaller numbers than it (1, 2 and 2).
#
# Example 2:
#
# Input: nums = [6,5,4,8]
# Output: [2,1,0,3]
#
# Example 3:
#
# Input: nums = [7,7,7,7]
# Output: [0,0,0,0]

#
# Approach 1: Brute Force
#

# @param {Integer[]} nums
# @return {Integer[]}
def smaller_numbers_than_current(nums)
  arr = {}

  nums.each_with_index do |num1, i|
    arr[i] = 0
    nums.each_with_index do |num2, j|
      next if i == j

      arr[i] = arr[i] + 1 if num1 > num2
    end
  end

  arr.values
end

nums = [8, 1, 2, 2, 3]
smaller_numbers_than_current(nums)
# Output: [4,0,1,1,3]

nums = [6, 5, 4, 8]
smaller_numbers_than_current(nums)
# Output: [2,1,0,3]

nums = [7, 7, 7, 7]
smaller_numbers_than_current(nums)
# Output: [0,0,0,0]

#
# Approach 2: sort + hash
#

# Time complexity: O(n log n)

# @param {Integer[]} nums
# @return {Integer[]}
def smaller_numbers_than_current(nums)
  sorted = nums.sort
  map = {}

  sorted.each_with_index do |num, i|
    next if map[num]

    map[num] = i
  end

  nums.each_with_index do |num, i|
    nums[i] = map[num]
  end

  nums
end

nums = [8, 1, 2, 2, 3]
smaller_numbers_than_current(nums)
# Output: [4,0,1,1,3]

nums = [6, 5, 4, 8]
smaller_numbers_than_current(nums)
# Output: [2,1,0,3]

nums = [7, 7, 7, 7]
smaller_numbers_than_current(nums)
# Output: [0,0,0,0]
