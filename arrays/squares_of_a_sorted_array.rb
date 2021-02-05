# Given an integer array nums sorted in non-decreasing order,
# return an array of the squares of each number sorted in non-decreasing order.

# 1. square of all elements
# 2. sort the result

# This guide contains 2 solutions:
# 1) uses Ruby functions
# 2) uses bubble sorting

# Approach 1: is using Ruby function (for sure)!

def sorted_squares(nums)
  nums.map! { |num| num ** 2 }.sort
end

print(sorted_squares([4, -1, -9, 2]))

# Approach 2: is using bubble sort

def bubble_sort(array)
  array_length = array.size
  return array if array_length <= 1

  loop do
    swapped = false

    (array_length-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

def sorted_squares(nums)
  # This takes O(n)
  nums.map! { |num| num ** 2 }

  # This can take Ο(n2)
  bubble_sort(nums)
end

print(sorted_squares([4, -1, -9, 2]))

#
# Approach 3: solving without ruby sort method. Using two-pointers
#
# Time complexity: O(n)
# Space complexity: O(n)
#

def sorted_squares(nums)
  left = 0
  right = nums.length - 1

  # since we're returing the result in ascending order,
  # we'll fill in the array from the end
  max_index = nums.length - 1
  output = []

  while left < right
    left_squared = nums[left] * nums[left]
    right_squared = nums[right] * nums[right]

    if left_squared > right_squared
      output[max_index] = left_squared
      left += 1
    elsif right_squared > left_squared
      output[max_index] = right_squared
      right -= 1
    else
      output[max_index] = left_squared
      max_index -= 1
      output[max_index] = right_squared
      left += 1
      right -= 1
    end

    max_index -= 1
  end

  # to account for any remaining value left in the input array
  if left == right
    output[max_index] = nums[left] * nums[left]
  end

  return output
end

print(sorted_squares([4, -1, -9, 2]))
