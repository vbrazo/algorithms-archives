# You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array.
#
# Return the sum of all the unique elements of nums.
#
# Example 1:
#
# Input: nums = [1,2,3,2]
# Output: 4
# Explanation: The unique elements are [1,3], and the sum is 4.
#
# Example 2:
#
# Input: nums = [1,1,1,1,1]
# Output: 0
# Explanation: There are no unique elements, and the sum is 0.
#
# Example 3:
#
# Input: nums = [1,2,3,4,5]
# Output: 15
# Explanation: The unique elements are [1,2,3,4,5], and the sum is 15.

#
# Approach 1: Hash table
#

# @param {Integer[]} nums
# @return {Integer}
def sum_of_unique(nums)
  # Using a dictionary to count the frequency of each number.
  hash_table = {}
  nums.each do |num|
    if hash_table[num].nil?
      hash_table[num] = 1
    else
      hash_table[num] += 1
    end
  end

  unique = hash_table.select { |_key, value| value == 1 }
  unique.keys.sum
end

nums = [1, 2, 3, 2]
puts sum_of_unique(nums)
# Output: 4

nums = [1, 1, 1, 1, 1]
puts sum_of_unique(nums)
# Output: 0

nums = [1, 2, 3, 4, 5]
puts sum_of_unique(nums)
# Output: 15

#
# Approach 2: Hash table with additional array
#

def sum_of_unique(nums)
  arr = []
  hash = nums.group_by { |ele| ele }

  hash.each do |k, v|
    arr.push(k) if v.length == 1
  end

  arr.sum
end

nums = [1, 2, 3, 2]
puts sum_of_unique(nums)
# Output: 4

nums = [1, 1, 1, 1, 1]
puts sum_of_unique(nums)
# Output: 0

nums = [1, 2, 3, 4, 5]
puts sum_of_unique(nums)
# Output: 15
