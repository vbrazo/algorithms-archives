# Given an integer array nums and an integer k,
# return true if there are two distinct indices i and j
# in the array such that nums[i] == nums[j] and abs(i - j) <= k.
#
# Example 1:
#
# Input: nums = [1,2,3,1], k = 3
# Output: true
#
# Example 2:
#
# Input: nums = [1,0,1,1], k = 1
# Output: true
#
# Example 3:
#
# Input: nums = [1,2,3,1,2,3], k = 2
# Output: false
#
#
# Constraints:
#
# 1 <= nums.length <= 105
# -109 <= nums[i] <= 109
# 0 <= k <= 105

#
# Approach: Hash table
#

#
# Complexity Analysis
#
# Time complexity: O(n). We do nn operations of search, delete and insert,
# each with constant time complexity.
#
# Space complexity: O(min(n,k)). The extra space required depends on the number
# of items stored in the hash table, which is the size of the sliding window, min(n,k).
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  seen = {}

  nums.each_with_index do |n, i|
    if seen[n] && i - seen[n] <= k
      return true
    end

    seen[n] = i
  end

  false
end

nums = [1,2,3,1]
k = 3
puts contains_nearby_duplicate(nums, k)

nums = [1,0,1,1]
k = 1
puts contains_nearby_duplicate(nums, k)

nums = [1,2,3,1,2,3]
k = 2
puts contains_nearby_duplicate(nums, k)
