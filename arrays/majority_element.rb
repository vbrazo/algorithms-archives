# Given an array nums of size n, return the majority element.
#
# The majority element is the element that appears more than ⌊n / 2⌋
# times. You may assume that the majority element always exists in the
# array.

# Example 1:
#
# Input: nums = [3,2,3]
# Output: 3
#
# Example 2:
#
# Input: nums = [2,2,1,1,1,2,2]
# Output: 2

#
# Approach 1: HashMap
#

# Intuition
#
# We know that the majority element occurs more than `n/2` times,
# and a HashMap allows us to count element occurrences efficiently.
# 
# Complexity Analysis
#
# Time complexity: O(n)
# We iterate over nums once and make a constant time HashMap insertion
# on each iteration. Therefore, the algorithm runs in O(n) time.
#
# Space complexity: O(n)


# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  hash = Hash.new(0)

  nums.each do |x|
    hash[x] += 1
  end

  hash = hash.sort_by { |_, v| v }.reverse
  hash.sort_by { |k, _| return k }.reverse
end

nums = [3, 2, 3]
print(majority_element(nums))
# Output: 3

nums = [2, 2, 1, 1, 1, 2, 2]
print(majority_element(nums))
# Output: 2
