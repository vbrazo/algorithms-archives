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

# // Count the zeroes
# // Make all the non-zero elements retain their original order
# // Move all zeroes to the end
# // Combine the result

# Complexity Analysis

# Space Complexity : O(n). Since we are creating the "new" array to store results.

# Time Complexity: O(n). However, the total number of operations are sub-optimal.
# We can achieve the same result in less number of operations.

# If asked in an interview, the below solution would be a good start.
# You can explain the interviewer(not code) the above and build your base for the next Optimal Solution.

def move_zeroes(nums)
  pointer1=0

  count = nums.select { |i| i.zero? }.count

  new = []
  nums.each do |value|
    if value != 0
      new.push(value)
    end
  end

  count.times { new.push(0) }

  nums = new

  puts nums
end

move_zeroes([0,1,0,3,12])
