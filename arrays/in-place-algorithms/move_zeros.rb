# Given an array nums, write a function to move all 0's to the end of it
# while maintaining the relative order of the non-zero elements.

# Example:

# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]


# Note:

# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.


# In-place means we should not be allocating any space for extra array.
# But we are allowed to modify the existing array. However, as a first step,
# try coming up with a solution that makes use of additional space.
# For this problem as well, first apply the idea discussed using an additional
# array and the in-place solution will pop up eventually.

# A two-pointer approach could be helpful here. The idea would be to have
# one pointer for iterating the array and another pointer that just
# works on the non-zero elements of the array.

# Approach #1 (Space Sub-Optimal)

# 1. Count the zeroes
# 2. Make all the non-zero elements retain their original order
# 3. Move all zeroes to the end
# 4. Combine the result

# Complexity Analysis

# Space Complexity: O(n).
# Since we are creating the "new" array to store results.

# Time Complexity: O(n).
# However, the total number of operations are sub-optimal.
# We can achieve the same result in less number of operations.

# If asked in an interview, the below solution would be a good start.
# You can explain the interviewer (not code) the above and build
# your base for the next Optimal Solution.

def move_zeroes(nums)
  count = nums.select { |i| i.zero? }.count

  new = []
  nums.each do |value|
    if value != 0
      new.push(value)
    end
  end

  count.times { new.push(0) }

  nums.each_with_index do |value, index|
    nums[index] = new[index]
  end

  nums
end

move_zeroes([0,1,0,3,12])
# => [1,3,12,0,0]

# Approach #2 (Space Optimal, Operation Sub-Optimal)

# This approach works the same way as above, i.e., first fulfills
# one requirement and then another. The catch? It does it in a clever way.
# The above problem can also be stated in alternate way, "Bring all the non
# 0 elements to the front of array keeping their relative order same".

# This is a 2 pointer approach. The fast pointer which is denoted by
# variable "cur" does the job of processing new elements. If the newly
# found element is not a 0, we record it just after the last found non-0
# element. The position of last found non-0 element is denoted by the slow
# pointer "last_non_zero_found_at" variable. As we keep finding new non-0 elements,
# we just overwrite them at the "last_non_zero_found_at + 1" 'th index. This
# overwrite will not result in any loss of data because we already processed
# what was there(if it were non-0,it already is now written at
# it's corresponding index, or if it were 0 it will be handled later in time).

# After the "cur" index reaches the end of array, we now know that all
# the non-0 elements have been moved to beginning of array in their original
# order. Now comes the time to fulfil other requirement, "Move all 0's to the
# end". We now simply need to fill all the indexes after the
# "last_non_zero_found_at" index with 0.

def move_zeroes(nums)
  last_non_zero_found_at = 0

  # If the current element is not 0, then we need to
  # append it just in front of last non 0 element we found.
  nums.each_with_index do |value, index|
    if nums[index] != 0
      last_non_zero_found_at = last_non_zero_found_at + 1
      nums[last_non_zero_found_at] = nums[index]
    end
  end

  # After we have finished processing new elements,
 	# all the non-zero elements are already at beginning of array.
 	# We just need to fill remaining array with 0's
  (last_non_zero_found_at..nums.length-1).each_with_index do |value, index|
    nums[index] = 0
  end

  print(nums)
end

move_zeroes([0,1,0,3,12])
# => [1,3,12,0,0]
