# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.

# Approach 1: Brute Force

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
      if i != j && (num1 + num2 == target)
        return [i,j]
      end
    end
  end
end

nums = [2,7,11,15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3,2,4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3,3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]

# Approach 2: One-pass Hash Table

# It turns out we can do it in one-pass. While we iterate and inserting elements
# into the table, we also look back to check if current element's complement
# already exists in the table. If it exists, we have found a solution
# and return immediately.

# Complexity Analysis:

# Time complexity: O(n). We traverse the list containing nn elements only once.
# Each look up in the table costs only O(1)O(1) time.

# Space complexity: O(n). The extra space required depends on the number of items
# stored in the hash table, which stores at most nn elements.

def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |n,idx|
    case hash[n]
      when nil then hash[n] = [idx]
      else
        hash[n] << idx
      end

    if hash.has_key? (target-n)
      if (!hash[target-n].include?(idx) || hash[target-n].size > 1)
        return (hash[target-n]-[idx]).first, idx
      end
    end
  end
end

nums = [2,7,11,15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3,2,4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3,3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]
