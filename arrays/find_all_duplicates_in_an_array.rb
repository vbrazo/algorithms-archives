# Find All Duplicates in an Array
#
# Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array),
# some elements appear twice and others appear once.
#
# Find all the elements that appear twice in this array.
#
# Could you do it without extra space and in O(n) runtime?
#
# Example:
# Input:
# [4,3,2,7,8,2,3,1]
#
# Output:
# [2,3]

#
# Approach 1: Hash map
#

# Complexity Analysis
#
# Time complexity: O(n) average case.
# Space complexity: Upto O(n) extra space required for the set.
#

# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
  hash = {}

  nums.each do |number|
    hash[number] = if hash[number].nil?
                     1
                   else
                     hash[number] + 1
                   end
  end

  hash = hash.select { |_key, value| value > 1 }
  hash.keys
end

nums = [4, 3, 2, 7, 8, 2, 3, 1]
print(find_duplicates(nums))
# Output: [3,2]

#
# Approach 2: Sort and Compare Adjacent Elements
#

# Intuition

# After sorting a list of elements, all elements of equivalent value get placed together.
# Thus, when you sort an array, equivalent elements form contiguous blocks.

#
# Complexity Analysis
#
# Time complexity: O(n log n)
#

# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates(nums)
  # sort array
  array = []
  nums = nums.sort
  nums.count.times do |i|
    if nums[i] == nums[i+1]
      array.push(nums[i])
    end
  end
  print array
  # check if adjacent is equal to current
end

nums = [4, 3, 2, 7, 8, 2, 3, 1]
print(find_duplicates(nums))
# Output: [2,3]
