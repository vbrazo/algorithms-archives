# Given a non-empty array of integers nums, every element appears twice
# except for one. Find that single one.

# Follow up: Could you implement a solution with a linear runtime
# complexity and without using extra memory?

#
# Approach 1: List operation
#

# Complexity Analysis

# Time complexity : O(n^2). We iterate through nums, taking O(n) time.
# We search the whole list to find whether there is duplicate number,
# taking O(n) time. Because search is in the for loop, so we have to
# multiply both time complexities which is O(n^2).

# Space complexity: O(n). We need a list of size nn to contain elements in num.

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  no_duplicate_list = []
  nums.each do |num|
    if !no_duplicate_list.include? num
      no_duplicate_list.push(num)
    else
      no_duplicate_list.delete(num)
    end
  end
  no_duplicate_list.pop
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1

nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1

#
# Approach 2: Hash Table
#

# Algorithm

# We use hash table to avoid the O(n) time required for searching
# the elements.

# Iterate through all elements in nums and set up key/value pair.
# Return the element which appeared only once.

# Complexity Analysis
#
# Time complexity: O(n⋅1)=O(n). Time complexity of for loop is O(n).
# Time complexity of hash table(dictionary in python)
# operation pop is O(1).
#
# Space complexity: O(n). The space required by hash_table
# is equal to the number of elements in nums

def single_number(nums)
  hash_table = {}

  nums.each do |num|
    hash_table[num] = if hash_table[num]
                        hash_table[num] + 1
                      else
                        1
                      end
  end

  hash_table.each do |key|
    return key if hash_table[key] == 1
  end
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1

nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1

#
# Approach 3: Math
#

# Concept

# 2 * (a + b + c) - (a + a + b + b + c) = c

# Complexity Analysis

# Time complexity: O(n + n) = O(n). sum will call next to iterate
# through nums. We can see it as sum(list(i, for i in nums)) which
# means the time complexity is O(n) because of the number of
# elements(n) in nums.

# Space complexity: O(n + n) = O(n).
# set needs space for the elements in nums
require 'set'

def single_number(nums)
  2 * nums.to_set.sum - nums.sum
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1

nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1

#
# Approach 4: Bit Manipulation
#

# Concept

# If we take XOR of zero and some bit, it will return that bit
# - a⊕0=a

# If we take XOR of two same bits, it will return 0
# - a⊕a=0
# - b = ba⊕b⊕a=(a⊕a)⊕b=0⊕b=b

# So we can XOR all bits together to find the unique number.

# Complexity Analysis

# Time complexity: O(n). We only iterate through nums, so the time complexity is
# the number of elements in nums.

# Space complexity: O(1).

def singleNumber(nums)
  a = 0

  nums.each { |i| a ^= i }

  a
end

nums = [2, 2, 1]
puts(single_number(nums))
# Output: 1

nums = [4, 1, 2, 1, 2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1
