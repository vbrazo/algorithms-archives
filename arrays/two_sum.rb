# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.

# Approach 1: Brute Force

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      if i != j && (num1 + num2 == target)
        return [i,j]
      end
    end
  end
end

nums = [2,7,11,15]
target = 9
print(two_sum(nums, target))
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].

nums = [3,2,4]
target = 6
print(two_sum(nums, target))
# Output: [1,2]

nums = [3,3]
target = 6
print(two_sum(nums, target))
# Output: [0,1]
