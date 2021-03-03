#
# Given an integer numRows, return the first numRows of Pascal's triangle.
#
# In Pascal's triangle, each number is the sum of the two numbers directly.
#

# Example 1:
#
# Input: numRows = 5
# Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
# Example 2:
#
# Input: numRows = 1
# Output: [[1]]

# Approach 1: Dynamic Programming
#

# Intuition
#
# If we have the a row of Pascal's triangle, we can easily
# compute the next row by each pair of adjacent values.
#
# Algorithm
#
# Although the algorithm is very simple, the iterative
# approach to constructing Pascal's triangle can be classified
# as dynamic programming because we construct each row based
# on the previous row.
#
# First, we generate the overall triangle list, which will
# store each row as a sublist. Then, we check for the special
# case of 0, as we would otherwise return [1].
# If numRows > 0, then we initialize triangle with [1] as its
# first row, and proceed to fill the rows as follows:

#
# Complexity Analysis
#
# Time complexity: O(nums_rows^2)
# Although updating each value of triangle happens in constant
# time, it is performed O(numRows^2)
#
# Space complexity: O(nums_rows^2)
# Because we need to store each number that we update in
# triangle, the space requirement is the same as the
# time complexity.
#

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows < 1
  return [[1]] if 1 == num_rows
  return [[1], [1, 1]] if 2 == num_rows

  result = [[1], [1, 1]]

  (2...num_rows).each do |row|
    prev = result[row - 1]
    current = [1]
    med = prev.size / 2

    (1...prev.size).each do |i|
      current[i] = prev[i - 1] + prev[i]
    end

    current.push 1
    result.push current
  end

  result
end

num_rows = 5
print(generate(num_rows))
# => [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

num_rows = 1
print(generate(num_rows))
# => [[1]]
