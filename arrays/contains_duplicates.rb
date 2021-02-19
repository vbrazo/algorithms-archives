# 217. Contains Duplicate
#
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice
# in the array, and it should return false if every element is distinct.
#
#
# Approach #1 (Naive Linear Search) [Time Limit Exceeded]

# Complexity Analysis

# Time complexity : O(n^2). In the worst case, there are n(n+1)/2 pairs
# of integers to check. Therefore, the time complexity is O(n^2).

# Space complexity: O(1). We only used constant extra space.

def contains_duplicate(nums)
  nums.length.times do |i|
    for j in 0..i-1 do
      if nums[j] == nums[i]
        return true
      end
    end
  end

  false
end

nums = [1, 2, 3, 1]
puts(contains_duplicate(nums))
# => true

nums = [1, 2, 3, 4]
puts(contains_duplicate(nums))
# => false

nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
puts(contains_duplicate(nums))
# => true

# Approach #2 (Sorting)
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
# Time complexity: O(nlogn). Sorting is O(nlogn) and the sweeping is O(n).
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

  nums.each_with_index do |_, i|
    return true if nums[i] == nums[i + 1]
  end

  false
end

nums = [1, 2, 3, 1]
puts(contains_duplicate(nums))
# => true

nums = [1, 2, 3, 4]
puts(contains_duplicate(nums))
# => false

nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
puts(contains_duplicate(nums))
# => true

# Approach #3 (Hash Table)
#
# Intuition
#
# Utilize a dynamic data structure that supports fast search
# and insert operations.
#
# Algorithm
#
# From Approach #1 we know that search operations is O(n) in an unsorted array
# and we did so repeatedly. Utilizing a data structure with faster search time
# will speed up the entire algorithm.
#

# Complexity Analysis

# Time complexity: O(n). We do search() and insert() for nn times and
# each operation takes constant time.

# Space complexity: O(n). The space used by a hash table is linear with
# the number of elements in it.
require "set"

def contains_duplicate(nums)
  set_nums = [].to_set

  nums.each do |num|
    if set_nums.include? num
      return true
    else
      set_nums.add(num)
    end
  end

  false
end

nums = [1, 2, 3, 1]
puts(contains_duplicate(nums))
# => true

nums = [1, 2, 3, 4]
puts(contains_duplicate(nums))
# => false

nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
puts(contains_duplicate(nums))
# => true
