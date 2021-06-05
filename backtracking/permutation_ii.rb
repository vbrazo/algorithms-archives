# Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

# Example 1:
#
# Input: nums = [1,1,2]
# Output:
# [[1,1,2],
#  [1,2,1],
#  [2,1,1]]

# Example 2:
#
# Input: nums = [1,2,3]
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

# Constraints:
#
# 1 <= nums.length <= 8
# -10 <= nums[i] <= 10

#
# Approach 1: Backtracking with Groups of Numbers
# 

# @param {Integer[]} nums
# @return {Integer[][]}
require 'set'

def permute_unique(nums)
  result = Set.new
  visited = Array.new(nums.size, false)

  backtrack(nums, [], result, visited)
  result.to_a
end

def backtrack(nums, arr, result, visited)
  if arr.size == nums.size
    result.add(arr.dup)
  else
    for i in 0...nums.size
      next if visited[i]
      visited[i] = true
      arr.push(nums[i])
      backtrack(nums, arr, result, visited)
      arr.pop
      visited[i] = false
    end
  end
end

nums = [1,1,2]
print permute_unique(nums)
# Output:
# [[1,1,2],
#  [1,2,1],
#  [2,1,1]]

nums = [1,2,3]
print permute_unique(nums)
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
