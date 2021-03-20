# Decompress Run-Length Encoded List

# We are given a list nums of integers representing a list compressed with run-length encoding.
#
# Consider each adjacent pair of elements [freq, val] = [nums[2*i], nums[2*i+1]] (with i >= 0).
# For each such pair, there are freq elements with value val concatenated in a sublist.
# Concatenate all the sublists from left to right to generate the decompressed list.
#
# Return the decompressed list.

# Example 1:
#
# Input: nums = [1,2,3,4]
# Output: [2,4,4,4]
# Explanation: The first pair [1,2] means we have freq = 1 and val = 2 so we generate the array [2].
# The second pair [3,4] means we have freq = 3 and val = 4 so we generate [4,4,4].
# At the end the concatenation [2] + [4,4,4] is [2,4,4,4].
#
# Example 2:
#
# Input: nums = [1,1,2,3]
# Output: [1,3,3]

# Constraints:
#
# 2 <= nums.length <= 100
# nums.length % 2 == 0
# 1 <= nums[i] <= 100

#
# Approach 1: Iterative
#

# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist(nums)
  array = []
  nums = nums.each_slice(2).to_a

  nums.count.times do |index|
    freq = nums[index][0]
    val = nums[index][1]

    array << [val] * freq
  end

  array.flatten
end

nums = [1, 2, 3, 4]
print decompress_rl_elist(nums)
# Output: [2,4,4,4]

nums = [1, 1, 2, 3]
print decompress_rl_elist(nums)
# Output: [1,3,3]

#
# Approach 2: Recurvise
#

def decompress_rl_elist(nums, pair = 0, n = [])
  return n.flatten.compact if nums[pair..pair + 1].empty?

  n[pair] = Array.new(nums[pair..pair + 1][0], nums[pair..pair + 1][1])

  decompress_rl_elist(nums, pair + 2, n)
end

nums = [1, 2, 3, 4]
print decompress_rl_elist(nums)
# Output: [2,4,4,4]

nums = [1, 1, 2, 3]
print decompress_rl_elist(nums)
# Output: [1,3,3]
