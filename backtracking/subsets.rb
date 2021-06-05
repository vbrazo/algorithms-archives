# Given an integer array nums of unique elements, return all possible subsets (the power set).
#
# The solution set must not contain duplicate subsets. Return the solution in any order.

#
# Approach 1: Backtracking
#

# Complexity Analysis
#
# Time complexity: O(N×2^N) to generate all subsets and then copy them into
# output list.

# Space complexity: O(N). We are using O(N) space to maintain curr, and are
# modifying curr in-place with backtracking. Note that for space complexity
# analysis, we do not count space that is only used for the purpose of returning
# output, so the output array is ignored.

def subsets(nums)
  find_subsets(nums, 0, [])
end

def find_subsets(nums, start, pre_result)
  result = [pre_result]
  (start...nums.size).each do |index|
    result += find_subsets(nums, index + 1, [nums[index]] + pre_result)
  end
  result
end
