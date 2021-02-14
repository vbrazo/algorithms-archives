# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array),
# some elements appear twice and others appear once.

# Find all the elements of [1, n] inclusive that do not appear in this array.

# Could you do it without extra space and in O(n) runtime? You may assume
# the returned list does not count as extra space.

# Approach 1: Using Hash Map

# Intuition

# The intuition behind using a hash map is pretty clear in this case.
# We are given that the array would be of size N and it should contain numbers
# from 1 to N. However, some of the numbers are missing. All we have to do is
# keep track of which numbers we encounter in the array and then iterate from 1 to N
# and check which numbers did not appear in the hash table. Those will be our missing numbers.

# Complexity Analysis

# Time Complexity: O(N)
# Space Complexity: O(N)

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  hash_table = {}

  nums.each do |num|
    hash_table[num] = 1
  end

  result = []

  (1..nums.length).each do |num|
    unless hash_table[num]
      result.append(num)
    end
  end

  result
end

nums = [4,3,2,7,8,2,3,1]
puts(find_disappeared_numbers(nums))
# Output: [5,6]


# Approach 2: O(1) Space InPlace Modification Solution

# Intuition
#
# We definitely need to keep track of all the unique numbers that appear in the array.
# However, we don't want to use any extra space for it. This solution that
# we will look at in just a moment springs from the fact that
#
# All the elements are in the range [1, N]
#
# Since we are given this information, we can make use of the input array itself
# to somehow mark visited numbers and then find our missing numbers. Now,
# we don't want to change the actual data in the array but who's stopping us
# from changing the magnitude of numbers in the array? That is the basic idea
# behind this algorithm.
#
# We will be negating the numbers seen in the array and use the sign of each
# of the numbers for finding our missing numbers. We will be treating numbers
# in the array as indices and mark corresponding locations in the array as negative.

# Complexity Analysis
#
# Time Complexity: O(N)
# Space Complexity: O(1) since we are reusing the input array itself as a
# hash table and the space occupied by the output array doesn't count
# toward the space complexity of the algorithm.

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  return [] if nums.count == 0

  # Iterate over each of the elements in the original array
  (0..nums.count-1).each do |i|
    # Treat the value as the new index
    new_index = nums[i].abs - 1

    # Check the magnitude of value at this new index
    # If the magnitude is positive, make it negative
    # thus indicating that the number nums[i] has
    # appeared or has been visited.
    if nums[new_index] > 0
      nums[new_index] *= -1
    end
  end

  # Response array that would contain the missing numbers
  result = []

  # Iterate over the numbers from 1 to N and add all those
  # that have positive magnitude in the array
  (1..nums.count).each do |i|
    if nums[i-1] > 0
      result.append(i)
    end
  end

  result
end
