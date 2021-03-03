# Given an array nums. We define a running sum of an array
# as runningSum[i] = sum(nums[0]…nums[i]).
#
# Return the running sum of nums.
#
# Example 1:
#
# Input: nums = [1,2,3,4]
# Output: [1,3,6,10]
# Explanation: Running sum is obtained as follows:
# [1, 1+2, 1+2+3, 1+2+3+4].
#
# Example 2:
#
# Input: nums = [1,1,1,1,1]
# Output: [1,2,3,4,5]
# Explanation: Running sum is obtained as follows:
# [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
# Example 3:
#
# Input: nums = [3,1,2,10,1]
# Output: [3,4,6,16,17]

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  nums.count.times do |i|
    next if i == 0

    nums[i] = nums[i - 1] + nums[i]
  end

  nums
end

nums = [1, 2, 3, 4]
print(running_sum(nums))
# Output: [1,3,6,10]

nums = [3, 1, 2, 10, 1]
print(running_sum(nums))
# Output: [3,4,6,16,17]
