# Given an array nums and a value val, remove all instances of that value in-place and return the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
# The order of elements can be changed. It doesn't matter what you leave beyond the new length.

#
# Approach: Two Pointers
#

#
# When nums[j] equals to the given value, skip this element by incrementing j.
# As long as nums[j] <> val, we copy nums[j] to nums[i] and increment both
# indexes at the same time. Repeat the process until j reaches the end of the
# array and the new length is i.
#

# Time complexity: O(n). Assume the array has a total of nn elements, both i and j traverse at most 2n steps.
# Space complexity: O(1).

def remove_element(nums, val)
  pointer1 = 0
  nums.each_with_index do |num, pointer2|
    if val != num
      nums[pointer1] = nums[pointer2]
      pointer1 += 1
    end
  end
  pointer1
end

puts 'First Example:'
nums = [0, 1, 2, 2, 3, 0, 4, 2]
nums.sort
val = 2

len = remove_element(nums, val)
puts(len)
# Output: 5, nums = [0,1,4,0,3]

puts "\nSecond Example:"
nums = [3, 2, 2, 3]
nums.sort
val = 3

len = remove_element(nums, val)
puts(len)
# Output: 2, nums = [2,2]

puts "\nThird Example:"
nums = [4, 5]
nums.sort
val = 4

len = remove_element(nums, val)
puts(len)

# Approach 2: Two Pointers - when elements to remove are rare
#
# Intuition
#
# Now consider cases where the array contains few elements to remove.
# For example, nums = [1,2,3,5,4], val = 4. The previous algorithm will do
# unnecessary copy operation of the first four elements.
# Another example is nums = [4,1,2,3,5], val = 4. It seems unnecessary to
# move elements [1,2,3,5] one step left as the problem description mentions
# that the order of elements could be changed.
#
# Algorithm
#
# When we encounter nums[i] = val, we can swap the current element out
# with the last element and dispose the last one. This essentially reduces the array's size by 1.
#
# Note that the last element that was swapped in could be the value you want to
# remove itself. But don't worry, in the next iteration we will still check this element.
#

# Complexity analysis
#
# Time complexity: O(n). Both i and n traverse at most n steps.
# In this approach, the number of assignment operations is equal to the
# number of elements to remove. So it is more efficient if elements to remove are rare.
#
# Space complexity: O(1)

def remove_element(nums, val)
  n = nums.length
  pointer = 0

  while pointer < n
    if nums[pointer] == val
      nums[pointer] = nums[n - 1]
      n -= 1
    else
      pointer += 1
    end
  end

  pointer
end

puts 'First Example:'
nums = [0, 1, 2, 2, 3, 0, 4, 2]
nums.sort
val = 2

len = remove_element(nums, val)
puts(len)
# Output: 5, nums = [0,1,4,0,3]

puts "\nSecond Example:"
nums = [3, 2, 2, 3]
nums.sort
val = 3

len = remove_element(nums, val)
puts(len)
# Output: 2, nums = [2,2]

puts "\nThird Example:"
nums = [4, 5]
nums.sort
val = 4

len = remove_element(nums, val)
puts(len)
