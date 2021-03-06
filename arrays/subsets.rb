# Given an integer array nums of unique elements, return all possible subsets (the power set).
#
# The solution set must not contain duplicate subsets. Return the solution in any order.

#
# Approach 1: Cascading
#

# Complexity Analysis
#
# Time complexity: O(N×2^N) to generate all subsets and then copy them into
# output list.
#
# Space complexity: O(N×2^N). This is exactly the number of solutions for
# subsets multiplied by the number N of elements to keep for each subset.

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
