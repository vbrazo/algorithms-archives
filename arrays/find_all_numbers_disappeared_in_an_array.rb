# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array),
# some elements appear twice and others appear once.

# Find all the elements of [1, n] inclusive that do not appear in this array.

# Could you do it without extra space and in O(n) runtime? You may assume
# the returned list does not count as extra space.

# Approach 1: Using Hash Map

# Intuition

# The intuition behind using a hash map is pretty clear in this case.
# We are given that the array would be of size N and it should contain numbers
# from 1 to N. However, some of the numbers are missing. All we have to do is
# keep track of which numbers we encounter in the array and then iterate from 1 to N
# and check which numbers did not appear in the hash table. Those will be our missing numbers.
# Let's look at a formal algorithm based on this idea and then an animation
# explaining the same with the help of a simple example.

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(N)

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  hash_table = {}

  nums.each do |num|
    hash_table[num] = 1
  end

  result = []

  (1..nums.length).each do |num|
    unless hash_table[num]
      result.append(num)
    end
  end

  result
end

nums = [4,3,2,7,8,2,3,1]
puts(find_disappeared_numbers(nums))
# Output: [5,6]
