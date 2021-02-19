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
single_number(nums)
# Output: 1

nums = [4,1,2,1,2]
single_number(nums)
# Output: 4

nums = [1]
single_number(nums)
# Output: 1
