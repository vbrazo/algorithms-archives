# Template #2 is an advanced form of Binary Search.
# It is used to search for an element or condition which requires
# accessing the current index and its immediate right neighbor's index in the array.

# Key Attributes:
#
# An advanced way to implement Binary Search.
# Search Condition needs to access element's immediate right neighbor
# Use element's right neighbor to determine
# if condition is met and decide whether to go left or right
# Gurantees Search Space is at least 2 in size at each step

# Post-processing required.
# Loop/Recursion ends when you have 1 element left.
# Need to assess if the remaining element meets the condition.

def search(nums, target)
  return -1 if nums.length == 0

  left = 0
  right = nums.length

  while left < right
    mid = (left + right) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid
    end
  end

  # Post-processing:
  # End Condition: left == right
  if (left != nums.length) && (nums[left] == target)
    left
  else
    -1
  end
end

nums = [-1, 0, 3, 5, 9, 12]
target = 9
puts(search(nums, target))

nums = [-1, 0, 3, 5, 9, 12]
target = 2
puts(search(nums, target))
