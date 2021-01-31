# Template #3 is another unique form of Binary Search. It is used to search
# for an element or condition which requires accessing the current index and
# its immediate left and right neighbor's index in the array.

# Key Attributes:
#
# An alternative way to implement Binary Search
# Search Condition needs to access element's immediate left and right neighbors
# Use element's neighbors to determine if condition is met and decide whether to go left or right
# Gurantees Search Space is at least 3 in size at each step
# Post-processing required. Loop/Recursion ends when you have 2 elements left.
# Need to assess if the remaining elements meet the condition.

def search(nums, target)
  if nums.length == 0
    return -1
  end

  left = 0
  right = nums.length - 1

  while (left + 1 < right)
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid
    else
      right = mid
    end
  end

  # Post-processing:
  # End Condition: left + 1 == right
  return left if nums[left] == target
  return right if nums[right] == target
  return -1
end

nums = [-1,0,3,5,9,12]
target = 9
puts(search(nums, target))

nums = [-1,0,3,5,9,12]
target = 2
puts(search(nums, target))
