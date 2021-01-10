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

# Time complexity : O(n). Assume the array has a total of nn elements, both i and j traverse at most 2n steps.
# Space complexity : O(1).

def remove_element(nums, value)
  pointer1 = 0

  nums.each_with_index do |val, pointer2|
    if (nums[pointer2] != value)
      nums[pointer1] = nums[pointer2]
      pointer1 = pointer1 + 1
    end
  end

  print("#{nums}\n")
  pointer1
end

puts "First Example:"
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
nums = [4,5]
nums.sort
val = 4

len = remove_element(nums, val)
puts(len)
