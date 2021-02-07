# Given a sorted (in ascending order) integer array nums of n elements and a target value,
# write a function to search target in nums. If target exists, then return its index,
# otherwise return -1.

#
# Template #1 is the most basic and elementary form of Binary Search.
# It is the standard Binary Search Template that most high schools or universities
# use when they first teach students computer science. Template #1 is used to search
# for an element or condition which can be determined by accessing a single index in the array.

# Approach 1:

# Algorithm
#
# Initialise left and right pointers: left = 0, right = n - 1.
# While left <= right:
# Compare middle element of the array nums[pivot] to the target value target.
# If the middle element is the target target = nums[pivot] : return pivot.
# If the target is not yet found:
# If target < nums[pivot], continue the search on the left right = pivot - 1.
# Else continue the search on the right left = pivot + 1.

# Complexity Analysis
#
# Time complexity: O(log N).
# Space complexity: O(1) since it's a constant space solution.

def search(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right
    pivot = left + (right - left) / 2

    return pivot if nums[pivot] == target

    if target < nums[pivot]
      right = pivot - 1
    else
      left = pivot + 1
    end
  end

  return -1
end

nums = [-1,0,3,5,9,12]
target = 9
puts(search(nums, target))

nums = [-1,0,3,5,9,12]
target = 2
puts(search(nums, target))

# Approach 2:

# Time complexity: O(n) implementation

# This approach traverses the entire array until it finds the target value.

def search(nums, target)
  nums.each_with_index do |num, index|
    return index if num == target
  end
  return -1
end

nums = [-1,0,3,5,9,12]
target = 9
puts(search(nums, target))

nums = [-1,0,3,5,9,12]
target = 2
puts(search(nums, target))
