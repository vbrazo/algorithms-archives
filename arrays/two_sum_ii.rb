# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.

# Approach 1: Two pointer

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  pointer1 = 0
  pointer2 = numbers.length - 1

  while pointer1 < pointer2
    sum = numbers[pointer1] + numbers[pointer2]
    if sum == target
      return [pointer1 + 1, pointer2 + 1]
    elsif sum < target
      pointer1 += 1
    else
      pointer2 -= 1
    end
  end

  [-1, -1]
end

numbers = [2, 7, 11, 15]
target = 9
print(two_sum(numbers, target))
# Output: [1,2]
# Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

numbers = [2, 3, 4]
target = 6
print(two_sum(numbers, target))
# Output: [1,3]

numbers = [-1, 0]
target = -1
print(two_sum(numbers, target))
# Output: [1,2]
