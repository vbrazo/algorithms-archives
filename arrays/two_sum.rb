# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.

#
# Approach 1: Brute Force
#

# The brute force approach is simple. Loop through each element xx and find if
# there is another value that equals to target - x.

# Complexity Analysis

# Time complexity: O(n^2). For each element, we try to find its complement
# by looping through the rest of array which takes O(n) time.
# Therefore, the time complexity is O(n^2)
# Space complexity: O(1).

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      return [i, j] if i != j && (num1 + num2 == target)
    end
  end
end

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3, 2, 4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3, 3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]

#
# Approach 2: Two-pass Hash Table
#

# To improve our run time complexity, we need a more efficient way to check
# if the complement exists in the array. If the complement exists, we need to
# look up its index. What is the best way to maintain a mapping of each element
# in the array to its index? A hash table.
#
# We reduce the look up time from O(n) to O(1) by trading space for speed.
# A hash table is built exactly for this purpose, it supports fast look up in
# near constant time. I say "near" because if a collision occurred, a look up
# could degenerate to O(n) time. But look up in hash table should be amortized
# O(1) time as long as the hash function was chosen carefully.
#
# A simple implementation uses two iterations. In the first iteration, we add
# each element's value and its index to the table. Then, in the second iteration
# we check if each element's complement (target - nums[i]) exists
# in the table. Beware that the complement must not be nums[i] itself!

# Complexity Analysis:

# Time complexity: O(n). We traverse the list containing nn elements exactly twice.
# Since the hash table reduces the look up time to O(1), the time complexity is O(n).

# Space complexity: O(n). The extra space required depends on the number of items
# stored in the hash table, which stores exactly n elements.

def two_sum(nums, target)
  value_indices = {}

  # create hash
  (0...nums.length).each do |i|
    value_indices[nums[i]] = i
  end

  # iterate over nums and lookup missing target
  (0...nums.length).each do |i|
    missing_value = target - nums[i]
    return [i, value_indices[missing_value]] if value_indices[missing_value] && value_indices[missing_value] != i
  end
end

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3, 2, 4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3, 3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]

#
# Approach 3: One-pass Hash Table
#

# It turns out we can do it in one-pass. While we iterate and inserting elements
# into the table, we also look back to check if current element's complement
# already exists in the table. If it exists, we have found a solution
# and return immediately.

# Complexity Analysis:

# Time complexity: O(n). We traverse the list containing nn elements only once.
# Each look up in the table costs only O(1) time.

# Space complexity: O(n). The extra space required depends on the number of items
# stored in the hash table, which stores at most nn elements.

def two_sum(nums, target)
  hash = nums

  (0...nums.length).each do |i|
    complement = target - nums[i]

    return [i, hash[complement]] if hash[complement] && i != hash[complement]

    hash[nums[i]] = i
  end
end

nums = [2, 7, 11, 15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3, 2, 4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3, 3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]
