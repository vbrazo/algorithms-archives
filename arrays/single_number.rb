# Given a non-empty array of integers nums, every element appears twice
# except for one. Find that single one.

# Follow up: Could you implement a solution with a linear runtime
# complexity and without using extra memory?

# Approach 1: List operation

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

nums = [2,2,1]
puts(single_number(nums))
# Output: 1

nums = [4,1,2,1,2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1



# Approach 2: Hash Table

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
    if hash_table[num]
      hash_table[num] = hash_table[num] + 1
    else
      hash_table[num] = 1
    end
  end

  hash_table.each do |key, val|
    if hash_table[key] == 1
      return key
    end
  end
end

nums = [2,2,1]
puts(single_number(nums))
# Output: 1

nums = [4,1,2,1,2]
puts(single_number(nums))
# Output: 4

nums = [1]
puts(single_number(nums))
# Output: 1
