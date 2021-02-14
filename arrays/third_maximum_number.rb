# Given integer array nums, return the third maximum number in this array.
# If the third maximum does not exist, return the maximum number.

# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  if nums.uniq.count <= 2
    nums.uniq.sort.reverse[0]
  else
    nums.uniq.sort.reverse[2]
  end
end

nums = [3,2,1]
print(third_max(nums))
# Output: 1
# Explanation: The third maximum is 1.

nums = [1,2]
print(third_max(nums))
# Output: 2
# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

nums = [2,2,3,1]
puts(third_max(nums))
# Output: 1
# Explanation: Note that the third maximum here means the third maximum distinct number.
# Both numbers with value 2 are both considered as second maximum.

nums = [1,1,2]
puts(third_max(nums))
# Output: 2
