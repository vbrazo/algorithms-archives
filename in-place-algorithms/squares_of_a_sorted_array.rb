# Given an integer array nums sorted in non-decreasing order,
# return an array of the squares of each number sorted in non-decreasing order.

# 1. square of all elements
# 2. sort the result

# This guide contains 2 solutions:
# 1) uses Ruby functions
# 2) uses bubble sorting

# First solution is using Ruby function (for sure)!
def sorted_squares(nums)
  nums.map! { |num| num ** 2 }.sort
end

print(sorted_squares([4, -1, -9, 2]))

# Second solution is using bubble sort
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
