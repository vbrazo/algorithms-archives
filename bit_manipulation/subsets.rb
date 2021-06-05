# Given an integer array nums of unique elements, return all possible subsets (the power set).
#
# The solution set must not contain duplicate subsets. Return the solution in any order.

#
# Approach 1: Bit Manipulation
#

def subsets(nums)
  result_size = 1 << nums.size
  result = Array.new(result_size) { [] }
  (0...result_size).each do |result_index|
    (0...nums.size).each do |num_index|
      result[result_index] << nums[num_index] if ((result_index >> num_index) & 1) == 1
    end
  end
  result
end
