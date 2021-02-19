# 217. Contains Duplicate
#
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice
# in the array, and it should return false if every element is distinct.
#
#
# Approach #2 (Sorting) [Accepted]
#
# Intuition
#
# If there are any duplicate integers, they will be consecutive after sorting.
#
# Algorithm
#
# This approach employs sorting algorithm. Since comparison sorting algorithm
# like heapsort is known to provide O(nlogn) worst-case performance,
# sorting is often a good preprocessing step. After sorting, we can sweep the sorted
# array to find if there are any two consecutive duplicate elements.
#
# Complexity Analysis
#
# Time complexity: O(nlogn). Sorting is O(n logn) and the sweeping is O(n).
# The entire algorithm is dominated by the sorting step, which is O(nlogn).
#
# Space complexity: O(1). Space depends on the sorting implementation which,
# usually, costs O(1) auxiliary space if heapsort is used.
#
# Note
#
# The implementation here modifies the original array by sorting it. In general,
# it is not a good practice to modify the input unless it is clear to the caller
# that the input will be modified. One may make a copy of nums and operate on the
# copy instead.

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  return false if nums.count < 2
  nums = nums.sort

  nums.each_with_index do |value, i|
    if nums[i] == nums[i+1]
      return true
    end
  end

  false
end

nums = [1,2,3,1]
puts(contains_duplicate(nums))
# => true

nums = [1,2,3,4]
puts(contains_duplicate(nums))
# => false

nums = [1,1,1,3,3,4,3,2,4,2]
puts(contains_duplicate(nums))
# => true
