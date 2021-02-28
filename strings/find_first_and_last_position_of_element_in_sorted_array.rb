# Given an array of integers nums sorted in ascending order,
# find the starting and ending position of a given target value.

# If target is not found in the array, return [-1, -1].

# Follow up: Could you write an algorithm with O(log n) runtime complexity?

#
# Approach 1: Linear Scan
#

# Intuition

# Checking every index for target exhausts the search space, so it must work.

# Algorithm

# First, we do a linear scan of nums from the left, breaking when we find an
# instance of target. If we never break, then target is not present, so we can
# return the "error code" of [-1, -1] early. Given that we did find a valid
# left index, we can do a second linear scan, but this time from the right.
# In this case, the first instance of target encountered will be the rightmost
# one (and because a leftmost one exists, there is guaranteed to also be a
# rightmost one). We then simply return a list containing the two located indices.

# Complexity Analysis

# Time complexity: O(n)
# This brute-force approach examines each of the n elements of nums exactly
# twice, so the overall runtime is linear.

# Space complexity: O(1)
# The linear scan method allocates a fixed-size array and a few integers,
# so it has a constant-size memory footprint.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  left_idx=-1
  right_idx=-1

  nums.each_with_index do |num, i|
    if num == target
      left_idx = i
      break
    end
  end

  (nums.count-1).downto(0) do |i|
    if nums[i] == target
      right_idx = i
      break
    end
  end

  [left_idx, right_idx]
end

nums = [5,7,7,8,8,10]
target = 8
puts(search_range(nums, target))
# Output: [3,4]

nums = [5,7,7,8,8,10]
target = 6
puts(search_range(nums, target))
# Output: [-1,-1]

nums = []
target = 0
puts(search_range(nums, target))
# Output: [-1,-1]

#
# Approach 2: Binary Search
#

# Intuition
#
# Because the array is sorted, we can use binary search to locate the left and
# rightmost indices.
#
# Algorithm
#
# The overall algorithm works fairly similarly to the linear scan approach,
# except for the subroutine used to find the left and rightmost indices
# themselves. Here, we use a modified binary search to search a sorted array,
# with a few minor adjustments. First, because we are locating the leftmost
# (or rightmost) index containing target (rather than returning true iff we
# find target), the algorithm does not terminate as soon as we find a match.
# Instead, we continue to search until lo == hi and they contain some index at
# which target can be found.
#
# The other change is the introduction of the left parameter, which is a boolean
# indicating what to do in the event that target == nums[mid]; if left is true,
# then we "recurse" on the left subarray on ties. Otherwise, we go right.
# To see why this is correct, consider the situation where we find target at
# index i. The leftmost target cannot occur at any index greater than i, so we
# never need to consider the right subarray. The same argument applies to the
# rightmost index.
#
# The first animation below shows the process for finding the leftmost index,
# and the second shows the process for finding the index right of the rightmost
# index.

# Complexity Analysis

# Time complexity: O(logN)
# Space complexity: O(1)

# All work is done in place, so the overall memory usage is constant.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)

end

nums = [5,7,7,8,8,10]
target = 8
puts(search_range(nums, target))
# Output: [3,4]

nums = [5,7,7,8,8,10]
target = 6
puts(search_range(nums, target))
# Output: [-1,-1]

nums = []
target = 0
puts(search_range(nums, target))
# Output: [-1,-1]
