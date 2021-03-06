# Given an array of integers nums.

# A pair (i,j) is called good if nums[i] == nums[j] and i < j.

# Return the number of good pairs.

# Example 1:
#
# Input: nums = [1,2,3,1,1,3]
# Output: 4
# Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
#
# Example 2:
#
# Input: nums = [1,1,1,1]
# Output: 6
# Explanation: Each pair in the array are good.
#
# Example 3:
#
# Input: nums = [1,2,3]
# Output: 0

#
# Approach 1: Brute force
#

# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  pairs = 0

  (0..nums.length - 2).each do |i|
    (i + 1..nums.length - 1).each do |a|
      nums[i] == nums[a] ? pairs += 1 : next
    end
  end

  pairs
end

nums = [1, 2, 3, 1, 1, 3]
puts(num_identical_pairs(nums))
# Output: 4

nums = [1, 1, 1, 1]
puts(num_identical_pairs(nums))
# Output: 6

nums = [1, 2, 3]
puts(num_identical_pairs(nums))
# Output: 0

#
# Approach 2: Hash table
#

# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  hash = {}

  nums.each do |num|
    hash[num] = if hash[num]
                  hash[num] + 1
                else
                  1
                end
  end

  counter = 0

  # Count how many times each number appears.
  # If a number appears n times, then n * (n – 1) // 2 good pairs
  # can be made with this number.
  hash.values.each do |val|
    counter += (val * (val - 1) / 2)
  end

  counter
end

nums = [1, 2, 3, 1, 1, 3]
puts(num_identical_pairs(nums))
# Output: 4

nums = [1, 1, 1, 1]
puts(num_identical_pairs(nums))
# Output: 6

nums = [1, 2, 3]
puts(num_identical_pairs(nums))
# Output: 0
