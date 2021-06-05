# Given an array nums of distinct integers, return all the
# possible permutations. You can return the answer in any
# order.
#
# Example 1:
#
# Input: nums = [1,2,3]
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
#
# Example 2:
#
# Input: nums = [0,1]
# Output: [[0,1],[1,0]]
#
# Example 3:
#
# Input: nums = [1]
# Output: [[1]]

#
# Approach 1: Backtracking (Without swapping)
#

def backtrack(nums, cur_array)
  if cur_array.size == nums.size
    @ans << cur_array.clone

    return
  end

  (0..nums.length - 1).each do |i|
    next if cur_array.include?(nums[i])

    cur_array << nums[i]

    backtrack(nums, cur_array)

    cur_array.pop
  end
end

def permute(nums)
  @ans = []
  backtrack(nums, [])
  @ans
end

nums = [1, 2, 3]
permute(nums)
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

nums = [0, 1]
permute(nums)
# Output: [[0,1],[1,0]]

nums = [1]
permute(nums)
# Output: [[1]]

#
# Approach 2: Backtracking (Swapping)
#

def perm(nums, i, result)
  return result << nums.dup if i == nums.size

  (i...nums.size).each do |j|
    nums[i], nums[j] = nums[j], nums[i]
    perm(nums, i + 1, result)
    nums[i], nums[j] = nums[j], nums[i]
  end
end

def permute(nums)
  result = []
  i = 0

  perm(nums, i, result)

  result
end

nums = [1, 2, 3]
permute(nums)
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

nums = [0, 1]
permute(nums)
# Output: [[0,1],[1,0]]

nums = [1]
permute(nums)
# Output: [[1]]
