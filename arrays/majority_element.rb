# Given an array nums of size n, return the majority element.
#
# The majority element is the element that appears more than ⌊n / 2⌋
# times. You may assume that the majority element always exists in the
# array.

# Example 1:
#
# Input: nums = [3,2,3]
# Output: 3
#
# Example 2:
#
# Input: nums = [2,2,1,1,1,2,2]
# Output: 2

#
# Approach 1: Brute Force
#

# Algorithm
#
# The brute force algorithm iterates over the array,
# and then iterates again for each number to count its
# occurrences. As soon as a number is found to have appeared
# more than any other can possibly have appeared, return it.
#

#
# Intuition
#
# We can exhaust the search space in quadratic time by
# checking whether each element is the majority element.
#

# Complexity Analysis
#
# Time complexity: O(n^2)
# The brute force algorithm contains two nested for loops
# that each run for n iterations, adding up to quadratic time
# complexity.

# Space complexity: O(1)
# The brute force solution does not allocate additional space
# proportional to the input size.

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  count = 0
  majority_element = nums.count / 2

  nums.each do |i|
    count = 0

    nums.each do |j|
      count += 1 if j == i
    end

    return i if count > majority_element
  end
end

nums = [3, 2, 3]
puts(majority_element(nums))
# Output: 3

nums = [2, 2, 1, 1, 1, 2, 2]
puts(majority_element(nums))
# Output: 2

nums = [8,8,7,7,7]
puts(majority_element(nums))
# Output: 7

#
# Approach 2: HashMap
#

# Intuition
#
# We know that the majority element occurs more than `n/2` times,
# and a HashMap allows us to count element occurrences efficiently.
#
# Complexity Analysis
#
# Time complexity: O(n)
# We iterate over nums once and make a constant time HashMap insertion
# on each iteration. Therefore, the algorithm runs in O(n) time.
#
# Space complexity: O(n)

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  num_hash = {}

  nums.each do |num|
    num_hash.key?(num) ? num_hash[num] += 1 : num_hash[num] = 1
  end

  num_hash.max_by { |_k, v| v }[0]
end

nums = [3, 2, 3]
puts(majority_element(nums))
# Output: 3

nums = [2, 2, 1, 1, 1, 2, 2]
puts(majority_element(nums))
# Output: 2

#
# Approach 3: Sorting
#

# Complexity Analysis
#
# Time complexity: O(n lgn)
#
# Sorting the array costs O(n lgn) time in Python and Java,
# so it dominates the overall runtime.
#
# Space complexity: O(1) or O(n)
#
# We sorted nums in place here - if that is not allowed,
# then we must spend linear additional space on a copy of
# nums and sort the copy instead.

def majority_element(nums)
  nums = nums.sort

  nums[nums.count / 2]
end

nums = [3, 2, 3]
puts(majority_element(nums))
# Output: 3

nums = [2, 2, 1, 1, 1, 2, 2]
puts(majority_element(nums))
# Output: 2

#
# Approach 4: Boyer-Moore Voting Algorithm
#

# Intuition

# If we had some way of counting instances of the majority
# element as +1+1 and instances of any other element as -1,
# summing them would make it obvious that the majority element
# is indeed the majority element.

# Complexity Analysis
#
# Time complexity: O(n)
# Boyer-Moore performs constant work exactly n times,
# so the algorithm runs in linear time.
#
# Space complexity: O(1)
# Boyer-Moore allocates only constant additional memory.

def majority_element(nums)
  candidate = nil
  count = 0

  # first round to find candidate
  nums.each do |ele|
    candidate = ele if count == 0

    if candidate == ele
      count += 1
    else
      count -= 1
    end
  end

  # second round to confirm
  count = 0
  nums.each do |ele|
    count += 1 if ele == candidate
  end

  count > nums.count / 2 ? candidate : nil
end

nums = [3, 2, 3]
puts(majority_element(nums))
# Output: 3

nums = [2, 2, 1, 1, 1, 2, 2]
puts(majority_element(nums))
# Output: 2

nums = [6, 5, 5]
puts(majority_element(nums))
# Output: 5
